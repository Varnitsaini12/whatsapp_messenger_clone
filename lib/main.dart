import 'package:flutter/material.dart';
import 'package:whatsapp_messenger/common/theme/dark_theme.dart';
import 'package:whatsapp_messenger/common/theme/light_theme.dart';
import 'package:whatsapp_messenger/features/auth/pages/login_page.dart';
import 'package:whatsapp_messenger/features/auth/pages/user_info_page.dart';
import 'package:whatsapp_messenger/features/auth/pages/verification_page.dart';
// import 'package:whatsapp_messenger/features/welcome/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LightTheme(),
      darkTheme: DarkTheme(),
      themeMode: ThemeMode.system,
      title: 'WhatsApp Me',
      home: const UserInfoPage(),
    );
  }
}
