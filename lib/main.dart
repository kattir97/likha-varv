import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/core/providers/dictionary_provider.dart';
import 'package:likha_varv/features/game_logic/presentation/screens/game_screen.dart';
import 'package:likha_varv/features/game_logic/domain/providers/check_prefs_provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Likha Varv',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
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
