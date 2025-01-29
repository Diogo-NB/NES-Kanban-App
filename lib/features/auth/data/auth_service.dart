import 'package:chopper/chopper.dart';
import 'package:nes_kanban_app/features/auth/data/signin_dto.dart';

part "auth_service.chopper.dart";

@ChopperApi(baseUrl: "/auth")
abstract class AuthService extends ChopperService {
  static AuthService create([ChopperClient? client]) => _$AuthService(client);

  @Post(path: "/signin")
  Future<Response> signin(@Body() SignInDto dto);
}
