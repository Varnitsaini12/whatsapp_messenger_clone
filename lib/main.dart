import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_messenger/common/routes/routes.dart';
import 'package:whatsapp_messenger/common/theme/dark_theme.dart';
import 'package:whatsapp_messenger/common/theme/light_theme.dart';
import 'package:whatsapp_messenger/common/utils/coloors.dart';
import 'package:whatsapp_messenger/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_messenger/features/home/pages/home/home_page.dart';
import 'package:whatsapp_messenger/features/welcome/pages/welcome_page.dart';
import 'package:whatsapp_messenger/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      title: 'WhatsApp Me',
      // home: const ContactPage(),
      home: ref.watch(userInfoAuthProvider).when(
        data: (user) {
          if (user == null) {
            return const WelcomePage();
          }
          return const HomePage();
        },
        error: (error, trace) {
          return const Scaffold(
            body: Center(
              child: Text('Something went wrong!'),
            ),
          );
        },
        loading: () {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: Coloors.greenDark),
            ),
          );
        },
      ),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
