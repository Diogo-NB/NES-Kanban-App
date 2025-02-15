import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:nes_kanban_app/features/tasks/data/dtos/create_task_dto.dart';
import 'package:nes_kanban_app/features/tasks/data/dtos/update_task_dto.dart';
import 'package:nes_kanban_app/features/tasks/data/models/task_model.dart';

part 'task_service.chopper.dart';

@ChopperApi(baseUrl: '/task')
abstract class TaskService extends ChopperService {
  static TaskService create([ChopperClient? client]) => _$TaskService(client);

  @Get(path: '/{tabId}')
  @FactoryConverter(response: _taskModelsFromResponse)
  Future<Response<List<TaskModel>>> findByTab(@Path('tabId') String tabId);

  @Patch()
  Future<Response> updateTask(@Body() UpdateTaskDto dto);

  @Post()
  @FactoryConverter(response: _taskModelFromResponse)
  Future<Response<TaskModel>> createTask(@Body() CreateTaskDto dto);
}

Response<List<TaskModel>> _taskModelsFromResponse(Response response) {
  final List<dynamic> jsonList = jsonDecode(response.bodyString);

  final List<TaskModel> entities =
      jsonList.map((json) => TaskModel.fromJson(json)).toList();
  return response.copyWith<List<TaskModel>>(body: entities);
}

Response<TaskModel> _taskModelFromResponse(Response response) {
  final json = jsonDecode(response.bodyString);
  final entity = TaskModel.fromJson(json);
  return response.copyWith<TaskModel>(body: entity);
}
