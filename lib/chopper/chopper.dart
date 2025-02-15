import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_kanban_app/chopper/chopper_dto.dart';
import 'package:nes_kanban_app/features/auth/domain/auth_provider.dart';
import 'package:nes_kanban_app/features/tab/data/tab_service.dart';
import 'package:nes_kanban_app/features/tasks/data/task_service.dart';

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

final chopperProvider = Provider<ChopperClient>((ref) {
  final token = ref.watch(authProvider.select((s) => s.token));
  return ChopperClient(
    baseUrl: Uri.parse(const String.fromEnvironment('API_URL')),
    interceptors: [
      AuthInterceptor(token: token),
    ],
    converter: ChopperJsonConverter(),
    errorConverter: JsonConverter(),
    services: [
      TabService.create(),
      TaskService.create(),
    ],
  );
});
