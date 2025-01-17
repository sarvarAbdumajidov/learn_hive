import 'package:hive/hive.dart';
import 'package:learn_hive/model/user_model.dart';

class HiveService {
  static var box = Hive.box('task_for_hive');

  static void storeUser(User user) {
    box.put('user', user.toJson());
  }

  static User? loadUser() {
    var userData = box.get('user');
    if (userData != null) {
      return User.fromJson(userData);
    } else {
      return null;
    }
  }

  static void removeUser() {
    box.delete('user');
  }
}
