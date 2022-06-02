import 'package:bloc_state_management/models/task.dart';
import 'package:hive/hive.dart';

class TodoService {
  late Box<Task> _tasks;
  Future<void> init() async {
    Hive.registerAdapter(TaskAdapter());
    _tasks = await Hive.openBox<Task>("taskBox");
  }

  List<Task> getTasks(final String username) {
    final tasks = _tasks.values.where((element) => element.user == username);
    return tasks.toList();
  }

  void addTask(final String username, task) {
    _tasks.add(Task(username, task, false));
  }

  Future<void> removeTask(final String task, username) async {
    final taskToRemove = _tasks.values.firstWhere(
        (element) => element.user == username && element.task == task);

    await taskToRemove.delete();
  }

  Future<void> updateTask(final String task, final String username,
    ) async {
    final taskToUpdate = _tasks.values.firstWhere(
        (element) => element.user == username && element.task == task);

    final index = taskToUpdate.key as int;
    await _tasks.put(
        index, Task(username, task, !taskToUpdate.completed));
  }
}
