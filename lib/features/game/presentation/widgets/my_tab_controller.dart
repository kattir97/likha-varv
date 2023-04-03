import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:likha_varv/features/game/presentation/screens/game_screen.dart';
import 'package:likha_varv/features/game/presentation/screens/info_screen.dart';
import 'package:likha_varv/features/game/presentation/widgets/guessed_words_widget.dart';

class MyTabController extends StatefulWidget {
  const MyTabController({super.key});

  @override
  _MyTabControllerState createState() => _MyTabControllerState();
}

class _MyTabControllerState extends State<MyTabController>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('likha varv', style: GoogleFonts.pacifico(fontSize: 24)),
              Row(
                children: [
                  const SizedBox(width: 15),
                  SvgPicture.asset(
                    'lib/core/data/icons/bee.svg',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ],
          ),
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Play'),
              Tab(text: 'Guessed'),
              Tab(text: 'Info'),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: GameScreen()),
          Center(child: GuessedWordsWidget()),
          Center(child: InfoScreen()),
        ],
      ),
    );
  }
}
