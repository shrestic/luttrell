import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:luttrell/app/settings/endpoints.dart';
import 'package:luttrell/app/settings/keys.dart';
import 'package:hive_flutter/hive_flutter.dart';

final box = Hive.box(AppStorageKey.BOX);

class DioInterceptor extends QueuedInterceptorsWrapper {
  final Dio _dio;
  final Dio _tokenDio = Dio();
  String? _accessToken;

  DioInterceptor(this._dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path.contains(Endpoints.REFRESH_TOKEN)) {
      return handler.next(options);
    }

    _accessToken = box.get(AppStorageKey.ACCESS_TOKEN);
    options.headers.addAll({
      HttpHeaders.authorizationHeader: '${AppStorageKey.TOKEN_TYPE} $_accessToken',
      'platform': 'mobile',
    });
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Assume 401 stands for token expired
    if (err.response?.statusCode == 401) {
      final options = err.response!.requestOptions;
      final authorizationHeader = '${AppStorageKey.TOKEN_TYPE} $_accessToken';
      // If the token has been updated, repeat directly.
      if (authorizationHeader != options.headers[HttpHeaders.authorizationHeader]) {
        options.headers[HttpHeaders.authorizationHeader] = authorizationHeader;
        // Repeat
        _dio.fetch(options).then(
          (r) => handler.resolve(r),
          onError: (e) {
            handler.reject(e);
          },
        );

        return;
      }

      // Request a new token
      String refreshToken = box.get(AppStorageKey.REFRESH_TOKEN) ?? '';
      if (refreshToken.isEmpty) {
        // Navigate to LOGIN PAGE
        return;
      }
      debugPrint("--[REFRESH TOKEN]--: $refreshToken");
      _tokenDio.get('${Endpoints.REFRESH_TOKEN}/$refreshToken').then((response) async {
        // Get refresh_token from response.data
        // Get access_token from response.data
        _accessToken = 'access_token';
        final authorizationHeader = '${AppStorageKey.TOKEN_TYPE} $_accessToken';
        options.headers[HttpHeaders.authorizationHeader] = authorizationHeader;
        // Save: access_token, refresh_token and expired_time
      }).then((e) {
        // Repeat
        _dio.fetch(options).then(
          (r) => handler.resolve(r),
          onError: (e) {
            handler.reject(e);
          },
        );
      });

      return;
    }

    return handler.next(err);
  }
}
