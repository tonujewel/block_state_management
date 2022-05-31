import 'package:bloc_state_management/services/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/todo_bloc.dart';

class TodoScreen extends StatelessWidget {
  final String username;
  const TodoScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Hive - Todo")),
      body: BlocProvider(
        create: (context) =>
            TodoBloc(RepositoryProvider.of<TodoService>(context))
              ..add(LoadTodoEvent(username)),
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state is TodoLoadedState) {
              return ListView(children: [
                ...state.todos.map((e) => ListTile(
                      title: Text(e.task),
                      trailing: Checkbox(
                        value: e.completed,
                        onChanged: (val) {
                          BlocProvider.of<TodoBloc>(context)
                              .add(TodoToggleEvent(e.task));
                        },
                      ),
                    )),
                ListTile(
                  title: const Text('Create new task'),
                  trailing: const Icon(Icons.edit),
                  onTap: () async {
                    final result = await showDialog<String>(
                        context: context,
                        builder: (context) => const Dialog(
                              child: CreateNewTask(),
                            ));

                    if (result != null) {
                      BlocProvider.of<TodoBloc>(context)
                          .add(AddTodoEvent(result));
                    }
                  },
                )
              ]);
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class CreateNewTask extends StatefulWidget {
  const CreateNewTask({Key? key}) : super(key: key);

  @override
  State<CreateNewTask> createState() => _CreateNewTaskState();
}

class _CreateNewTaskState extends State<CreateNewTask> {
  var taskNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("What task do you want to create"),
          TextField(
            controller: taskNameController,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(taskNameController.text);
              },
              child: const Text("Save"))
        ],
      ),
    );
  }
}
