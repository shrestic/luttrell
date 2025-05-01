import 'package:luttrell/app/settings/endpoints.dart';
import 'package:injectable/injectable.dart';
import '../../../utils/http_utils.dart';

abstract class AuthenticationDataSource {
  Future<HttpResponse> registerUser(Map<String, dynamic> userData);
  Future<HttpResponse> login(String username, String password);
  Future<HttpResponse> getUserProfileData();
}

@Injectable(as: AuthenticationDataSource)
class AuthenticationDataSourceImpl extends AuthenticationDataSource {
  @override
  Future<HttpResponse> registerUser(Map<String, dynamic> userData) async {
    try {
      HttpResponse response = await HttpHelper.post(Endpoints.REGISTER, userData);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse> login(String username, String password) async {
    try {
      Map<String, dynamic> data = {'username': username, 'password': password};
      HttpResponse response = await HttpHelper.post(Endpoints.LOGIN, data);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse> getUserProfileData() async {
    try {
      HttpResponse response = await HttpHelper.get(Endpoints.USER_PROFILE);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
