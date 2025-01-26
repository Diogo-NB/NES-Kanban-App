import 'package:json_annotation/json_annotation.dart';
import 'package:nes_kanban_app/chopper.dart';

part 'signin_dto.g.dart';

@JsonSerializable()
class SignInDto implements ChopperDto {
  final String username, password;

  SignInDto({required this.username, required this.password});

  factory SignInDto.fromJson(Map<String, dynamic> json) =>
      _$SignInDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SignInDtoToJson(this);
}
