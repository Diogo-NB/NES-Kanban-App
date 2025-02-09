import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nes_kanban_app/features/auth/domain/auth_provider.dart';
import 'package:nes_kanban_app/features/auth/presentation/signin/signin_screen.dart';
import 'package:nes_kanban_app/features/auth/presentation/signup/signup_screen.dart';
import 'package:nes_kanban_app/features/home/presentation/home_screen.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final sharedPrefsProvider = Provider<SharedPreferencesWithCache>((ref) {
  throw UnimplementedError();
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: flutterNesTheme(
        brightness: Brightness.dark,
        nesTheme: const NesTheme(
          pixelSize: 2,
        ),
      ),
      routerConfig: GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            path: '/',
            redirect: (context, state) async {
              await ref.read(authProvider.notifier).refreshToken();
              if (ref.read(authProvider).isAuthenticated) {
                return '/home';
              }
              return '/auth';
            },
          ),
          GoRoute(
            path: '/auth',
            builder: (context, state) => SigninScreen(),
            routes: [
              GoRoute(
                path: '/signup',
                builder: (context, state) => SignUpScreen(),
              ),
            ],
          ),
          GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
        ],
      ),
    );
  }
}
