import 'package:dio/dio.dart';
import 'package:qr_login/common/common.dart';
import 'package:qr_login/data/api/apis.dart';
import 'package:qr_login/data/protocol/models.dart';

class UserRepository {
  Future<UserModel> loginRequest(LoginModel loginModel) async {
    var options = BaseOptions(
      baseUrl: Constant.server_address,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    Dio dio = Dio(options);
    Response response;

    // var data = loginModel.toJson();
    // response = await dio.get(MyApi.user_login, queryParameters: data);
    response = await dio.post(MyApi.user_login, data: {
      "userName": loginModel.username,
      "userPass": loginModel.userpass
    });

    UserModel userModel = UserModel.fromJson(response.data);
    return userModel;
  }
}
