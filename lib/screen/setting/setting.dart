// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class SettingPage extends StatelessWidget {
//   const SettingPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Setting'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/screen/setting/profile.dart';
import 'package:tmdb_movie_app/screen/setting/theme_page.dart';

import '../about/about_page.dart';
import '../popup_logout.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text('Setting'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: ListView(
          children: [
            // Profile Section
            ListTile(
              title: const Text(
                'Profile',
                style: TextStyle(fontSize: 20),
              ),
              leading: const Icon(
                Icons.account_circle_outlined,
                color: Colors.deepPurple,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.pinkAccent,
                size: 18,
              ),
              onTap: () {
                // Navigate to Profile page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
            const Divider(
              height: 30,
              thickness: 2.0,
            ),
            ListTile(
              title: const Text(
                'Theme',
                style: TextStyle(fontSize: 20),
              ),
              leading: const Icon(
                Icons.wb_sunny,
                color: Colors.deepPurple,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.pinkAccent,
                size: 18,
              ),
              onTap: () {
                // Navigate to Profile page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThemePage()),
                );
              },
            ),
            const Divider(
              height: 30,
              thickness: 2.0,
            ),

            // Theme Section (Toggle for Light/Dark Mode)
            // ListTile(
            //   title: const Text('Theme'),
            //   trailing: BlocBuilder<NavigationBloc, NavigationState>(
            //     builder: (context, state) {
            //       final isDarkMode = state is ThemeState && state.themeMode == ThemeMode.dark;
            //       return Switch(
            //         value: isDarkMode,
            //         onChanged: (value) {
            //           context.read<NavigationBloc>().add(ToggleThemeEvent());
            //         },
            //       );
            //     },
            //   ),
            // ),
            //const Divider(),

            // Notifications Section (Toggle for Notifications)
            ListTile(
              title: const Text(
                'Notifications',
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(
                Icons.notifications_sharp,
                color: Colors.deepPurple,
              ),
              trailing: Switch(
                value:
                    true, // You can change this based on app's notification state
                onChanged: (value) {
                  // Handle notification toggle
                  // Update your app state accordingly
                },
              ),
            ),
            const Divider(
              height: 30,
              thickness: 2.0,
            ),

            // General Info Section
            ListTile(
              title: const Text(
                'General Info',
                style: TextStyle(fontSize: 20),
              ),
              leading: const Icon(
                Icons.info_outline_rounded,
                color: Colors.deepPurple,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.pinkAccent,
                size: 18,
              ),
              onTap: () {
                // Navigate to General Info page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
            const Divider(
              height: 30,
              thickness: 2.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.center, // Aligns the button in the center
                child: OutlinedButton(
                  onPressed: () {
                    showAlertDialog(context);
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyle(fontSize: 20, color: Colors.pink.shade500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//       ),
//       body: Center(
//         child: Text('Profile Settings Page'),
//       ),
//     );
//   }

class GeneralInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('General Info'),
      ),
      body: const Center(
        child: Text('General App Info goes here.'),
      ),
    );
  }
}
