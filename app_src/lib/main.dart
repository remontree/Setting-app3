
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/settings_model.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const SettingsCloneApp());
}

class SettingsCloneApp extends StatelessWidget {
  const SettingsCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SettingsModel(),
      child: MaterialApp(
        title: '설정',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1976D2)),
          scaffoldBackgroundColor: const Color(0xFFF2F4F6),
          listTileTheme: const ListTileThemeData(
            iconColor: Colors.black87,
            titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            subtitleTextStyle: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: false,
            titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0.2,
            surfaceTintColor: Colors.white,
          ),
          cardTheme: CardTheme(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 0,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
