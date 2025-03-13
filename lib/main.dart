import 'package:flutter/material.dart';
import 'package:matrix/features/shared_kernel/application/di/injection.dart';
import 'package:matrix/features/shared_kernel/presentation/navigation/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Matrix Rotation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Lufga'
      ),
      themeMode: ThemeMode.system,
      // Use the router configuration from AppRouter
      routerConfig: AppRouter.router,
    );
  }
}
