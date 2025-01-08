// import 'package:flutter/material.dart';
//
// class ThemeLight {
//   ThemeData _darkTheme() {
//     return ThemeData(
//       primarySwatch: Colors.deepPurple,
//       primaryColor: Colors.deepPurple[900], // Darker primary color
//       scaffoldBackgroundColor: Colors.black, // Dark background
//       visualDensity: VisualDensity.adaptivePlatformDensity,
//       appBarTheme: const AppBarTheme(
//         backgroundColor: Colors.deepPurple,
//         iconTheme: IconThemeData(color: Colors.white),
//         titleTextStyle: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//       textTheme: TextTheme(
//         displayLarge: const TextStyle(
//             fontSize: 32,
//             fontWeight: FontWeight.bold,
//             color: Colors.deepPurple),
//         bodyLarge: const TextStyle(
//             fontSize: 18, color: Colors.white70), // Lighter text for dark mode
//         titleMedium: TextStyle(
//             fontSize: 16, color: Colors.grey[300]), // Light text color
//       ),
//       buttonTheme: ButtonThemeData(
//         buttonColor: Colors.deepPurple, // Same button color for dark mode
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//         textTheme: ButtonTextTheme.primary,
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.deepPurple.shade700, // Darker background
//           foregroundColor: Colors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       ),
//     );
//   }
// }

// dark_theme.dart

import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData get darktheme {
    return ThemeData(
      primarySwatch: Colors.deepPurple,
      primaryColor: Colors.deepPurple[900], // Darker primary color
      scaffoldBackgroundColor: Colors.black, // Dark background
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
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple),
        bodyLarge: TextStyle(
            fontSize: 18, color: Colors.white70), // Lighter text for dark mode
        titleMedium:
            TextStyle(fontSize: 16, color: Colors.white), // Light text color
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
          backgroundColor: Colors.deepPurple.shade700, // Darker background
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Rounded corners
          ),
        ),
      ),
    );
  }
}
