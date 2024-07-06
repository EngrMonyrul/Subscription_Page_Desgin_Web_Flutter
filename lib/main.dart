import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription/views/subscription/screen/subscription_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "subscription",
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        useMaterial3: true,
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          primary: Colors.green,
          onPrimary: Colors.white,
          secondary: Colors.orange,
          onSecondary: Colors.white,
          tertiary: CupertinoColors.systemGrey3,
          onTertiary: Colors.white,
        ),
      ),
      home: const SubscriptionScreen(),
    );
  }
}
