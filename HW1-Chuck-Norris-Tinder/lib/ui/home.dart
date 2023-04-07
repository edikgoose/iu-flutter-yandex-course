import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw1_chuck_norris_tinder/ui/pages/about_me_page.dart';
import 'package:hw1_chuck_norris_tinder/ui/pages/favorite_jokes_page.dart';
import 'package:hw1_chuck_norris_tinder/ui/pages/joke_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum TabItem { random, favorite }

const tabs = [TabItem.random, TabItem.favorite];

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeScreenConsumerState();
}

class _HomeScreenConsumerState extends ConsumerState<HomeScreen> {
  TabItem _selectedTab = TabItem.random;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chuck Norris Tinder'),
        ),
        body: FutureBuilder(
          future: _buildBody(),
          builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
            if (snapshot.hasData) {
              return snapshot.data!;
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Random',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            )
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.question_mark),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("About author"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  elevation: 16,
                  content: const AboutPage(),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<Widget> _buildBody() async {
    return await Connectivity().checkConnectivity().then((connectivityResult) {
      if (connectivityResult != ConnectivityResult.mobile &&
          connectivityResult != ConnectivityResult.wifi) {
        return const Center(
          child: Text("No internet connection"),
        );
      }
      switch (_selectedTab) {
        case TabItem.random:
          return const JokePage();
        case TabItem.favorite:
          return const FavoriteJokesPage();
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _selectedTab = tabs[index];
    });
  }
}
