// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:likha_varv/core/data/letters.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.abc),
            label: 'Alphabet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rule),
            label: 'Rules',
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: const [
          AlphabetTab(),
          RulesTab(),
        ],
      ),
    );
  }
}

class AlphabetTab extends StatelessWidget {
  const AlphabetTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      padding: const EdgeInsets.all(16),
      children: letterList
          .map((letter) => Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    letter,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ))
          .toList(),
    );
  }
}

class RulesTab extends StatelessWidget {
  const RulesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'How to Play',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          const Text('1. Game starts with generated random letters. '
              'You can also manually shuffle the letters by tapping the shuffle button.\n\n'
              '2. Find as many words as you can from the available letters by tapping '
              'on the letter tiles in any order.\n\n'
              '3. To score points, the word must be at least 2 letters long and must '
              'be in the list of possible words generated from the given letters. '
              'The longer the word, the more points you score.\n\n'
              '4. Each word can only be used once per game. '
              'You can view the words you have already found by tapping the '
              '"Guessed" tab at the top of the screen.\n\n'
              '5. The game ends when you have found all the possible words '
              'or when you tap "Finish". Good luck!'),
        ],
      ),
    );
  }
}
