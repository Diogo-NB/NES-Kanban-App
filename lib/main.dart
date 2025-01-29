import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_kanban_app/features/auth/presentation/signin_screen.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefsProvider = Provider<SharedPreferencesWithCache>((ref) {
  throw UnimplementedError();
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferencesWithCache prefs =
      await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(),
  );

  runApp(
    ProviderScope(
      overrides: [sharedPrefsProvider.overrideWithValue(prefs)],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: flutterNesTheme(
        brightness: Brightness.dark,
        nesTheme: const NesTheme(
          pixelSize: 2,
        ),
      ),
      home: SigninScreen(),
    );
  }
}
