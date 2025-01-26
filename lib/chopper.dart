import 'package:chopper/chopper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_kanban_app/features/auth/auth_service.dart';

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
  return ChopperClient(
    baseUrl: Uri.parse('http://localhost:3000'),
    services: [AuthService.create()],
    converter: ChopperDtoConverter(),
    errorConverter: JsonConverter(),
  );
});
