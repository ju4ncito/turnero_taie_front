import 'dart:async';
import 'dart:io';
import 'package:chopper/chopper.dart';
import 'package:turnero_taie_front/api/api_manager.dart';
import 'package:turnero_taie_front/storage/secure_storage.dart';
import 'package:turnero_taie_front/swagger_generated_code/api_model.swagger.dart';

class AuthRepository {
  AuthRepository(this._backendServer);

  final ApiManager _backendServer;

  String? _accessToken;

  FutureOr<String?> get accessToken async {
    _accessToken = await UserSecureStorage.getField('accessToken');
    return _accessToken;
  }

  Future<void> refreshToken() async {
    var refreshToken = await UserSecureStorage.getField('refreshToken');

    if (refreshToken == null) {
      throw Exception('No refresh token found');
    }

    final response = await _backendServer.apiModel
        .apiTokenRefreshPost(body: RefreshTokenRequest(refresh: refreshToken));

    _accessToken = response.body?.access;

    await UserSecureStorage.setField('accessToken', _accessToken);
    await UserSecureStorage.setField('refreshToken', response.body?.refresh);
  }
}

class MyAuthenticator implements Authenticator {
  MyAuthenticator(this._repo);

  final AuthRepository _repo;

  @override
  FutureOr<Request?> authenticate(
    Request request,
    Response response, [
    Request? originalRequest,
  ]) async {
    // print('[MyAuthenticator] response.statusCode: ${response.statusCode}');
    // print(
    //   '[MyAuthenticator] request Retry-Count: ${request.headers['Retry-Count'] ?? 0}',
    // );
    // print(originalRequest);
    // print(request);
    // print(response);

    // 401
    if (response.statusCode == HttpStatus.unauthorized) {
      // Trying to update token only 1 time
      if (request.headers['Retry-Count'] != null) {
        // print(
        //     '[MyAuthenticator] Unable to refresh token, retry count exceeded, _repo.accessToken: Bearer ${_repo._accessToken}');
        return null;
      }

      try {
        await _repo.refreshToken();

        String? accessToken = await _repo.accessToken;
        if (accessToken != null) {
          return applyHeaders(
            request,
            {
              HttpHeaders.authorizationHeader: 'Bearer $accessToken',
              // Setting the retry count to not end up in an infinite loop
              // of unsuccessful updates
              'Retry-Count': '1',
            },
          );
        } else {
          // print('[MyAuthenticator] Access token is null');
          return null;
        }
      } catch (e) {
        // print('[MyAuthenticator] Unable to refresh token: $e');
        return null;
      }
    }

    return null;
  }
}
