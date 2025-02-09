import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_kanban_app/chopper/chopper.dart';
import 'package:nes_kanban_app/features/tab/data/dtos/create_tab_dto.dart';
import 'package:nes_kanban_app/features/tab/data/models/tab_model.dart';
import 'package:nes_kanban_app/features/tab/data/tab_service.dart';

final tabRepositoryProvider = Provider<TabRepository>((ref) {
  final tabService = ref.read(chopperProvider).getService<TabService>();
  return TabRepository(service: tabService);
});

class TabRepository {
  final TabService _service;

  TabRepository({required TabService service}) : _service = service;

  Future<List<TabModel>> getAll() async {
    final response = await _service.findAll();
    if (response.isSuccessful) {
      return response.body ?? [];
    } else {
      throw Exception(response.error);
    }
  }

  Future<TabModel> create(String title) async {
    final response = await _service.createNew(CreateTabDto(title: title));
    if (response.isSuccessful) {
      return response.body!;
    } else {
      throw Exception(response.error);
    }
  }
}
