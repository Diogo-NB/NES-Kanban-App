import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:nes_kanban_app/features/tab/data/dtos/create_tab_dto.dart';
import 'package:nes_kanban_app/features/tab/data/dtos/update_tab_dto.dart';
import 'package:nes_kanban_app/features/tab/data/models/tab_model.dart';

part "tab_service.chopper.dart";

@ChopperApi(baseUrl: "/tab")
abstract class TabService extends ChopperService {
  static TabService create([ChopperClient? client]) => _$TabService(client);

  @Get()
  @FactoryConverter(response: _tabModelsFromResponse)
  Future<Response<List<TabModel>>> findAll();

  @Get(path: '/{id}')
  @FactoryConverter(response: _tabModelFromResponse)
  Future<Response<TabModel>> findById(@Path('id') String id);

  @Post()
  @FactoryConverter(response: _tabModelFromResponse)
  Future<Response<TabModel>> createNew(@Body() CreateTabDto dto);

  @Patch()
  Future<Response> update(@Body() UpdateTabDto dto);
}

Response<List<TabModel>> _tabModelsFromResponse(Response response) {
  final List<dynamic> jsonList = jsonDecode(response.bodyString);
  final List<TabModel> entities =
      jsonList.map((json) => TabModel.fromJson(json)).toList();
  return response.copyWith<List<TabModel>>(body: entities);
}

Response<TabModel> _tabModelFromResponse(Response response) {
  final json = jsonDecode(response.bodyString);
  final entity = TabModel.fromJson(json);
  return response.copyWith<TabModel>(body: entity);
}
