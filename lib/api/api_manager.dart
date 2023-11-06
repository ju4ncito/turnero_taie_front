import 'package:turnero_taie_front/api/authenticator.dart';
import 'package:turnero_taie_front/api/interceptor.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';
import '../storage/secure_storage.dart';

class ApiManager {
  static final ApiManager _instance = ApiManager._internal();

  late ApiModel _apiModel;

  factory ApiManager() {
    return _instance;
  }

  ApiManager._internal() {
    _apiModel = ApiModel.create(
        baseUrl: Uri.parse('https://backend-taie.onrender.com'));
  }

  ApiModel get apiModel => _apiModel;
}

class AuthenticatedApiManager {
  late ApiModel _apiModel;
  static final AuthenticatedApiManager _authenticatedInstance =
      AuthenticatedApiManager._internal();
  final accessToken = UserSecureStorage.getField('accessToken');

  factory AuthenticatedApiManager() {
    return _authenticatedInstance;
  }

  AuthenticatedApiManager._internal() {
    _apiModel = ApiModel.create(
        baseUrl: Uri.parse('https://backend-taie.onrender.com'),
        authenticator: MyAuthenticator(AuthRepository(ApiManager())),
        interceptors: [
          AuthInterceptor(AuthRepository(ApiManager())),
        ]);
  }

  ApiModel get apiModel => _apiModel;
}
