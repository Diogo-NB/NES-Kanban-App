import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_kanban_app/features/auth/domain/auth_provider.dart';

class ChopperDtoConverter extends JsonConverter {
  @override
  Request convertRequest(Request request) {
    dynamic body = request.body;

    if (body is ChopperDto) {
      body = body.toJson();
    }

    return super.convertRequest(request.copyWith(body: body));
  }
}

abstract class ChopperDto {
  Map<String, dynamic> toJson();
}

final chopperProvider = Provider<ChopperClient>((ref) {
  final token = ref.watch(authProvider.select((s) => s.token));
  return ChopperClient(
    baseUrl: Uri.parse(const String.fromEnvironment('API_URL')),
    interceptors: [AuthInterceptor(token: token)],
    converter: ChopperDtoConverter(),
    errorConverter: JsonConverter(),
    services: [],
  );
});

class AuthInterceptor implements Interceptor {
  final String? token;

  AuthInterceptor({this.token});

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) {
    final request = token != null
        ? applyHeader(chain.request, 'Authorization', 'Bearer $token')
        : chain.request;

    return chain.proceed(request);
  }
}
