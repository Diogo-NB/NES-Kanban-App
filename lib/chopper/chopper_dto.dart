import 'package:chopper/chopper.dart';

class ChopperJsonConverter extends JsonConverter {
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
