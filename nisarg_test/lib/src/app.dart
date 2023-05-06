import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nisarg_test/src/core/theme/color_scheme.dart';
import 'package:nisarg_test/src/features/login/presentation/pages/login_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: AppColorScheme.lightScheme,
      ),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.light(),
      home: const LoginPage(),
    );
  }
}
