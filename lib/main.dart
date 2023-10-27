import 'package:flutter/material.dart';
import 'package:technaureus_task/core/config/theme/app_theme.dart';
import 'core/config/router/router.dart';
import 'core/services/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRouter,
    );
  }
}
