import 'package:bloc_state_management/models/user.dart';
import 'package:hive/hive.dart';

class AuthenticationService {
  late Box<User> _users;

  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    _users = await Hive.openBox<User>("userBox");
  }

  Future<String?> authenticateUser(final String username, password) async {
    final success = await _users.values.any((element) =>
        element.username == username && element.password == password);

    if (success) {
      return username;
    } else {
      return null;
    }
  }

  Future<UserCredential> createUser(final String username, password) async {
    final aleasyExist = _users.values.any(
        (element) => element.username.toLowerCase() == username.toLowerCase());

    if (aleasyExist) {
      return UserCredential.alreadyExist;
    }

    try {
      _users.add(User(username, password));
      return UserCredential.success;
    } on Exception catch (e) {
      return UserCredential.failure;
    }
  }
}

enum UserCredential { success, failure, alreadyExist }
