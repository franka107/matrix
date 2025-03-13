import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/features/shared_kernel/presentation/navigation/routes.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_input/matrix_input_page.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_result/matrix_result_page.dart';
import 'package:matrix/features/shared_kernel/presentation/page/settings/settings_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.root,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(path: Routes.root, redirect: (_, __) => '/${Routes.matrixInput}'),

      GoRoute(
        path: '/${Routes.matrixInput}',
        name: Routes.matrixInput,
        builder: (context, state) => const MatrixInputPage(),
      ),

      GoRoute(
        path: '/${Routes.matrixResult}',
        name: Routes.matrixResult,
        builder: (context, state) {
          // La página ahora extrae los datos directamente de state.extra
          return const MatrixResultPage();
        },
      ),

      GoRoute(
        path: '/${Routes.settings}',
        name: Routes.settings,
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );
}
