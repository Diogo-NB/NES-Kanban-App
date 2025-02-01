import 'package:chopper/chopper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    baseUrl: Uri.parse(const String.fromEnvironment('API_URL')),
    converter: ChopperDtoConverter(),
    errorConverter: JsonConverter(),
  );
});
