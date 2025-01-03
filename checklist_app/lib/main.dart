import 'package:flutter/material.dart';
import 'package:checklist_app/widget/Homepage.dart';
import 'package:provider/provider.dart';
import 'package:checklist_app/provider/Checkerprovider.dart'; 

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    primaryColor: const Color(0x00004eea),
    secondaryHeaderColor: const Color.fromARGB(160, 3, 27, 30),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 14),
      bodySmall: TextStyle(color: Colors.white, fontSize: 12),
    ),
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Checkerprovider>(create: (context) => Checkerprovider()), 
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const Homepage(),  // Home page starts here
      ),
    );
  }
}
