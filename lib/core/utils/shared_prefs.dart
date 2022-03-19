import 'package:shared_preferences/shared_preferences.dart';

import '../../features/login/data/models/user_model.dart';
import '../constants.dart';

class UserPrefences {
  // saves user from the json data received back
  Future<void> saveUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //prefs.setString('token', user.token!);
    prefs.setString('email', user.email);
    prefs.setString('username', user.username);
    prefs.setString('name', user.name);
    prefs.setString('password', user.password);
    prefs.setString('userCode', user.id);
  }

  // saves user from the json data received back
  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    //prefs.setString('token', user.token!);
    prefs.setString('token', token);
  }

  Future<void> saveStore(int store) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('store_id', store);
  }

  // saves user from the json data received back
  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<UserModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? email = prefs.getString('email');
    String? username = prefs.getString('username');
    String? userCode = prefs.getString('userCode');
    String? name = prefs.getString('name');
    String? password = prefs.getString('password');

    return UserModel(
      id: userCode!,
      name: name!,
      email: email!,
      password: password!,
      username: username!,
    );
  }

  Future<void> removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('token');
  }

  /// Sets initial data loaded flag
  ///
  /// according to value [value] true/false depending on whether all
  /// the required data is setup initially
  Future<bool> setInitialDataLoaded(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(INITIAL_DATA_DUMPED, value);
  }

  /// Initial Data loaded value
  ///
  /// returns true/false or null if no key found with value
  Future<bool?> initialDataLoaded() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(INITIAL_DATA_DUMPED);
  }
}
