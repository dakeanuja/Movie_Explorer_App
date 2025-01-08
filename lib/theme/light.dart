// import 'package:flutter/material.dart';
//
// ThemeData lightTheme() {
//   return ThemeData(
//     primarySwatch: Colors.blue,
//     primaryColor: Colors.deepPurple, // Custom primary color
//     hintColor: Colors.amber, // Customize accent color
//     scaffoldBackgroundColor: Colors.grey[50], // Light background
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//     appBarTheme: const AppBarTheme(
//       backgroundColor: Colors.deepPurple,
//       iconTheme: IconThemeData(color: Colors.white),
//       titleTextStyle: TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.bold,
//         color: Colors.white,
//       ),
//     ),
//     textTheme: TextTheme(
//       displayLarge: const TextStyle(
//           fontSize: 32, fontWeight: FontWeight.bold, color: Colors.deepPurple),
//       bodyLarge: const TextStyle(fontSize: 18, color: Colors.black87),
//       titleMedium: TextStyle(fontSize: 16, color: Colors.grey[700]),
//     ),
//     buttonTheme: ButtonThemeData(
//       buttonColor: Colors.deepPurple, // Default button color
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8), // Rounded corners
//       ),
//       textTheme:
//           ButtonTextTheme.primary, // Ensures the text is white on the button
//     ),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         backgroundColor:
//             Colors.deepPurple.shade300, // Apply global background color
//         foregroundColor: Colors.white, // Apply global text color
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8), // Rounded corners
//         ),
//       ),
//     ),
//   );
// }

// light_theme.dart

import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData get theme {
    return ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: Colors.deepPurple, // Custom primary color
      hintColor: Colors.amber, // Customize accent color
      scaffoldBackgroundColor: Colors.grey[50], // Light background
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple),
        bodyLarge: const TextStyle(
            fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w700),
        titleMedium: TextStyle(fontSize: 16, color: Colors.grey[700]),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.deepPurple, // Default button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        textTheme:
            ButtonTextTheme.primary, // Ensures the text is white on the button
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              Colors.deepPurple.shade300, // Apply global background color
          foregroundColor: Colors.white, // Apply global text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
        ),
      ),
    );
  }
}
