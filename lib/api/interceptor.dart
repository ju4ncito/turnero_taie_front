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

    final updatedRequest = applyHeader(
      request,
      HttpHeaders.authorizationHeader,
      accessToken!,
      override: false,
    );

    // print(
    //   '[AuthInterceptor] accessToken: ${updatedRequest.headers[HttpHeaders.authorizationHeader]}',
    // );

    return updatedRequest;
  }
}
