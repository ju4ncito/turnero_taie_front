import 'dart:async';
import 'dart:io';

import 'package:chopper/chopper.dart';

import 'authenticator.dart';

class AuthInterceptor implements RequestInterceptor {
  const AuthInterceptor(this._repo);

  final AuthRepository _repo;

  @override
  FutureOr<Request> onRequest(Request request) async {
    final accessToken = await _repo.accessToken;

    // print('accessToken: $accessToken');

    final updatedRequest = applyHeader(
      request,
      HttpHeaders.authorizationHeader,
      'Bearer ${accessToken!}',
      override: false,
    );

    // print('updatedRequest: $updatedRequest');
    // print(
    //   '[AuthInterceptor] accessToken: ${updatedRequest.headers[HttpHeaders.authorizationHeader]}',
    // );

    return updatedRequest;
  }
}
