import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_movie_app/bloc/upcoming/upcoming_bloc.dart';
import 'package:tmdb_movie_app/screen/Popular_navigation/popular_movies.dart';
import 'package:tmdb_movie_app/screen/about/about_page.dart';
import 'package:tmdb_movie_app/screen/home/home_screen.dart';
import 'package:tmdb_movie_app/screen/popup_logout.dart';
import 'package:tmdb_movie_app/screen/search/search.dart';
import 'package:tmdb_movie_app/screen/setting/setting.dart';

import 'bloc/navigation/navigation_bloc.dart';
import 'bloc/popular/popular_bloc.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Homes'),
  BottomNavigationBarItem(
      icon: Icon(Icons.local_fire_department), label: 'Popular'),
  BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
  BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
];
List<Widget> bottomNavScreen = <Widget>[
  const Padding(
    padding: EdgeInsets.only(top: 20),
    child: TrendingMovies(['Movie 1', 'Movie 2', 'Movie 3', 'Movie 4']),
  ),
  SizedBox(
    //color: Colors.green,
    //height: MediaQuery.of(context).size.height * 0.45,
    child: BlocProvider(
      create: (context) => PopularBloc(),
      child: const PopularMovies(),
    ),
  ),
  BlocProvider(
    create: (context) => UpcomingBloc(),
    child: const MovieSearch(),
  ),
  // const Text('Index 2:,Setting'),
  const SettingPage(),
];

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  String userName = 'Guest';
  bool isLoading = true; // To manage loading state//default name
  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('name') ?? 'Guest';
      isLoading = false; // Fallback to 'Guest'
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationBloc, NavigationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: _getAppBar,
          drawer: _getDrawer(context),
          body: Center(
            child: bottomNavScreen.elementAt(state.navIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
              items: bottomNavItems,
              currentIndex: state.navIndex,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                BlocProvider.of<NavigationBloc>(context)
                    .add(TabChange(navIndex: index));
              }),
        );
      },
    );
  }

  AppBar get _getAppBar {
    return AppBar(
      title: const Text('Movie Explorer'),
      // backgroundColor: Colors.lightBlue,
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.movie_creation),
          onPressed: () {},
        ),
      ],
    );
  }

  Container _getDrawer(BuildContext context) {
    return Container(
      //width: 300,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // Remove default padding
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: isLoading
                  ? const CircularProgressIndicator() // Show loading indicator until userName is loaded
                  : Center(
                      child: Text(
                        'Hello $userName', // Display the user's name
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.deepPurple,
              ),
              title: const Text(
                'Home',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationPage()),
                );
              },
            ),
            // ListTile(
            //   leading: const Icon(
            //     Icons.settings,
            //     color: Colors.deepPurple,
            //   ),
            //   title: const Text(
            //     'Settings',
            //     style: TextStyle(fontSize: 20),
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => const SettingPage()),
            //     );
            //   },
            // ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: Colors.deepPurple,
              ),
              title: const Text(
                'About',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutPage()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout_rounded,
                color: Colors.deepPurple,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                showAlertDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
