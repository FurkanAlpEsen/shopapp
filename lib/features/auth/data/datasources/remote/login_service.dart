import 'package:http/http.dart';
import 'package:shopapp/core/constants/constants.dart';
import 'package:shopapp/core/resources/data_state.dart';
import 'package:shopapp/features/auth/data/datasources/remote/remote_auth_source.dart';
import 'package:shopapp/features/auth/data/models/login_register_model.dart';
import 'dart:convert';

class LoginService implements RemoteAuthSource {
  var url = Uri.parse(loginAPIUrl);

  Future<DataState<LoginRegisterModel>> login(
      String userName, String password) async {
    try {
      Response response = await post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
              <String, String>{'UserName': userName, 'Password': password}));

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);

        if (body['Result']['ResultCode'] == 0) {
          return DataSuccess(
              LoginRegisterModel.fromJson(jsonDecode(response.body)));
        } else {
          return DataFailed(body['Result']['ResultMessage']);
        }
      } else {
        return DataFailed(response as String);
      }
    } catch (e) {
      return DataFailed(e as String);
    }
  }
}
