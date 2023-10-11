import 'package:http/http.dart';
import 'package:shopapp/core/constants/constants.dart';
import 'package:shopapp/core/resources/data_state.dart';
import 'package:shopapp/features/auth/data/datasources/remote/remote_auth_source.dart';
import 'package:shopapp/features/auth/data/models/login_register_model.dart';
import 'dart:convert';

class RegisterService implements RemoteAuthSource {
  var url = Uri.parse(registrAPIUrl);

  Future<DataState<LoginRegisterModel>> register(
      String userName, String email, String password) async {
    try {
      Response response = await post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, dynamic>{
            'UserName': userName,
            'Email': email,
            'Password': password,
            "FavouriteTeamId": 0,
            "LanguageCode": "tr-TR",
            "UserTypeId": 0,
            "InfluencerCode": ""
          }));

      var body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (body['Result']['ResultCode'] == 0) {
          return DataSuccess(
              LoginRegisterModel.fromJson(jsonDecode(response.body)));
        } else {
          return DataFailed(body['Result']['ResultMessage']);
        }
      }
      if (response.statusCode == 400) {
        return DataFailed(body['Result']['ResultMessage']);
      } else {
        return DataFailed(response.toString());
      }
    } catch (e) {
      return DataFailed(e as String);
    }
  }
}
