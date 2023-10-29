import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';

class ApiManager {
  static final ApiManager _instance = ApiManager._internal();
  late ApiModel _apiModel; // Usa 'late' para campos no nulos

  factory ApiManager() {
    return _instance;
  }

  ApiManager._internal() {
    _apiModel = ApiModel.create(
        baseUrl: Uri.parse('https://backend-taie.onrender.com'));
    // baseUrl: Uri.parse('http://127.0.0.1:8000'));
  }

  ApiModel get apiModel => _apiModel;
}
