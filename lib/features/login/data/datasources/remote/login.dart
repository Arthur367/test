import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../../core/constants.dart';
import '../../../../../core/utils/shared_prefs.dart';
import '../../models/user_model.dart';

enum Status { LoggedIn, NotLoggedIn, Authenticating, Failed }

class AuthProvider with ChangeNotifier {
  // track authentication status
  Status _loggedInStatus = Status.NotLoggedIn;

  Status get loggedInStatus => _loggedInStatus;

  Future<Map<String, dynamic>> login(String username, String password) async {
    var result;
    var dio = Dio();
    final Map<String, dynamic> responseData;

    final Map<String, dynamic> data = {
      'username': username,
      'password': password,
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    try {
      Response res = await dio.post(
        BASE_URL + '/api/auth/login',
        data: data,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
      );

      responseData = res.data['user'];

      print(responseData);

      // save user to local db.

      // (responseData['username'], responseData['email_address'],
      //     responseData['password'], responseData['name']);

      UserModel _user = UserModel.fromJson(responseData);
      // persist user on app.
      UserPrefences().saveToken(res.data['token']);
      UserPrefences().saveUser(_user);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = {
        'status': true,
        'message': 'Successful',
        'user': _user,
      };
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();

      if (e.response != null) {
        _loggedInStatus = Status.Failed;
        notifyListeners();
        switch (e.response?.statusCode) {
          case 400:
            result = {
              'status': false,
              'message': 'Login failed!',
            };
            break;
          case 401:
            result = {
              'status': false,
              'message': e.response?.data['message'],
            };
            break;

          default:
            result = {
              'status': false,
              'message': 'Something went wrong!',
            };
            break;
        }
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    } on SocketException catch (_) {
      _loggedInStatus = Status.Failed;
      notifyListeners();
      result = {'status': false, 'message': 'Something went wrong.'};
    }

    return result;
  }
}
