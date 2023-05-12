import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/core/providers/dictionary_provider.dart';
import 'package:likha_varv/features/game_logic/presentation/screens/game_screen.dart';
import 'package:likha_varv/features/game_logic/domain/providers/check_prefs_provider.dart';
import 'package:likha_varv/features/theme/data/theme_provider.dart';
import 'package:likha_varv/features/theme/domain/providers/theme_provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Likha Varv',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,

        /* light theme settings */
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.amber.shade400,
          onPrimary: Colors.black87,
          secondary: Colors.grey.shade200,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Colors.brown,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.black54,
          onPrimary: Colors.white70,
          secondary: Colors.black38,
          onSecondary: Colors.white70,
          error: Colors.red.shade300,
          onError: Colors.white,
          background: Colors.black26,
          onBackground: Colors.white70,
          surface: Colors.black26,
          onSurface: Colors.white70,
        ),
        /* dark theme settings */
      ),
      themeMode:
          theme == ThemeProvider.light ? ThemeMode.light : ThemeMode.dark,
      /* ThemeMode.system to follow system theme, 
         ThemeMode.light for light theme, 
         ThemeMode.dark for dark theme
      */
      home: const AwaitDictionary(),
    );
  }
}

class AwaitDictionary extends ConsumerWidget {
  const AwaitDictionary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dictionary = ref.watch(dictionaryProvider);
    return Scaffold(
      body: dictionary.when(
        data: (_) {
          return const HomePage();
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (_, __) => const Text('Error'),
      ),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFirstOpen = ref.watch(isFirstOpenProvider);
    return isFirstOpen.when(
      data: (data) => const GameScreen(),
      error: (error, stackTrace) => const Text('Error'),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
