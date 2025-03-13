import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/features/shared_kernel/application/di/injection.dart';
import 'package:matrix/features/shared_kernel/presentation/navigation/routes.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_result/bloc/matrix_result_bloc.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_result/bloc/matrix_result_event.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_result/bloc/matrix_result_model.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_result/bloc/matrix_result_side_effect.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_result/bloc/matrix_result_status.dart';
import 'package:matrix/platform/bloc/bloc_side_effect_listener.dart';

class MatrixResultPage extends StatelessWidget {
  const MatrixResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Extraer los datos de la matriz del router
    final Map<String, dynamic>? routeParams =
        GoRouterState.of(context).extra as Map<String, dynamic>?;
    final originalMatrix = routeParams?['originalMatrix'] as List<List<int>>?;
    final rotatedMatrix = routeParams?['rotatedMatrix'] as List<List<int>>?;

    return BlocProvider(
      create:
          (context) =>
              getIt<MatrixResultBloc>()..add(
                MatrixResultEvent.initialized(
                  originalMatrix: originalMatrix,
                  rotatedMatrix: rotatedMatrix,
                ),
              ),
      child: BlocSideEffectListener<MatrixResultBloc, MatrixResultSideEffect>(
        listener: (context, sideEffect) {
          switch (sideEffect) {
            case MatrixResultEffectShowToast():
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(sideEffect.message),
                  duration: const Duration(seconds: 2),
                ),
              );
            case MatrixResultEffectNavigateTo():
              context.pushNamed(sideEffect.route, extra: sideEffect.arguments);
            case MatrixResultEffectShowError():
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(sideEffect.message),
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 3),
                ),
              );
            case MatrixResultEffectCopyToClipboard():
              Clipboard.setData(ClipboardData(text: sideEffect.content));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Copied to clipboard'),
                  duration: Duration(seconds: 1),
                ),
              );
          }
        },
        child: const MatrixResultContent(),
      ),
    );
  }
}

class MatrixResultContent extends StatelessWidget {
  const MatrixResultContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatrixResultBloc, MatrixResultModel>(
      builder: (context, state) {
        return MatrixResultBody(
          child: switch (state.status) {
            MatrixResultStatusInitial() => const Center(
              child: CircularProgressIndicator(),
            ),
            MatrixResultStatusLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            MatrixResultStatusReady() => _buildResultView(context, state),
            MatrixResultStatusRotationSuccess(
              :final originalMatrix,
              :final rotatedMatrix,
            ) =>
              _SuccessView(
                originalMatrix: originalMatrix,
                rotatedMatrix: rotatedMatrix,
                animationEnabled: state.showAnimation,
              ),
            MatrixResultStatusError(:final message) => _ErrorView(
              message: message,
            ),
            MatrixResultStatusMatrixHistory() => _HistoryView(
              matrices: state.matrixHistory,
            ),
          },
        );
      },
    );
  }

  Widget _buildResultView(BuildContext context, MatrixResultModel state) {
    if (state.originalMatrix == null || state.rotatedMatrix == null) {
      return const Center(
        child: Text(
          'No matrix data available. Please go back and rotate a matrix.',
        ),
      );
    }

    return _SuccessView(
      originalMatrix: state.originalMatrix!,
      rotatedMatrix: state.rotatedMatrix!,
      animationEnabled: state.showAnimation,
    );
  }
}

class _SuccessView extends StatefulWidget {
  const _SuccessView({
    required this.originalMatrix,
    required this.rotatedMatrix,
    this.animationEnabled = true,
  });

  final List<List<int>> originalMatrix;
  final List<List<int>> rotatedMatrix;
  final bool animationEnabled;

  @override
  State<_SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<_SuccessView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    if (widget.animationEnabled) {
      _controller.forward();
    } else {
      _controller.value = 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Matrix Rotation Result',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              // En pantallas pequeñas, mostramos las matrices una encima de otra
              if (isSmallScreen) {
                return Column(
                  children: [
                    Opacity(
                      opacity: 1 - _animation.value * 0.5,
                      child: _MatrixDisplay(
                        title: 'Original Matrix',
                        matrix: widget.originalMatrix,
                        highlightColor: Colors.blue.shade100,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_downward,
                              size: 24 + (_animation.value * 8),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            Positioned(
                              right: 0,
                              child: Text(
                                '90° CCW',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: _animation.value,
                      child: _MatrixDisplay(
                        title: 'Rotated Matrix',
                        matrix: widget.rotatedMatrix,
                        highlightColor: Colors.green.shade100,
                      ),
                    ),
                  ],
                );
              } else {
                // En pantallas más grandes, mantenemos el diseño horizontal
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Opacity(
                        opacity: 1 - _animation.value * 0.5,
                        child: _MatrixDisplay(
                          title: 'Original Matrix',
                          matrix: widget.originalMatrix,
                          highlightColor: Colors.blue.shade100,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            size: 24 + (_animation.value * 8),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          Positioned(
                            bottom: 0,
                            child: Text(
                              '90° CCW',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Opacity(
                        opacity: _animation.value,
                        child: _MatrixDisplay(
                          title: 'Rotated Matrix',
                          matrix: widget.rotatedMatrix,
                          highlightColor: Colors.green.shade100,
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
          const SizedBox(height: 32),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  final originalJson = _matrixToJson(widget.originalMatrix);
                  context.read<MatrixResultBloc>().add(
                    MatrixResultEvent.copyMatrixToClipboard(
                      matrix: originalJson,
                      isOriginal: true,
                    ),
                  );
                },
                icon: const Icon(Icons.copy),
                label: const Text('Copy Original'),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  final rotatedJson = _matrixToJson(widget.rotatedMatrix);
                  context.read<MatrixResultBloc>().add(
                    MatrixResultEvent.copyMatrixToClipboard(
                      matrix: rotatedJson,
                      isOriginal: false,
                    ),
                  );
                },
                icon: const Icon(Icons.copy),
                label: const Text('Copy Rotated'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              context.read<MatrixResultBloc>().add(
                const MatrixResultEvent.rotateAgain(),
              );
            },
            icon: const Icon(Icons.rotate_90_degrees_ccw),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            label: const Text('Rotate Again (90° CCW)'),
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: () => context.pushNamed(Routes.matrixInput),
            icon: const Icon(Icons.arrow_back),
            label: const Text('Back to Matrix Input'),
          ),
        ],
      ),
    );
  }

  String _matrixToJson(List<List<int>> matrix) {
    return '[${matrix.map((row) => '[${row.join(',')}]').join(',')}]';
  }
}

class _MatrixDisplay extends StatelessWidget {
  const _MatrixDisplay({
    required this.title,
    required this.matrix,
    this.highlightColor,
  });

  final String title;
  final List<List<int>> matrix;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    // Calcular el tamaño dinámico de las celdas según el tamaño de la matriz
    final matrixSize = matrix.length;
    // Para matrices grandes, reducimos el tamaño de las celdas
    final cellSize =
        matrixSize <= 4
            ? 40.0
            : matrixSize <= 6
            ? 35.0
            : matrixSize <= 8
            ? 30.0
            : 25.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.fullscreen, size: 20),
              onPressed: () => _showExpandedMatrix(context),
              tooltip: 'Ver matriz completa',
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
            color: highlightColor ?? Colors.transparent,
          ),
          constraints: BoxConstraints(
            maxHeight: 240,
            maxWidth: MediaQuery.of(context).size.width * 0.45,
          ),
          child: SingleChildScrollView(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:
                      matrix.map((row) {
                        return Row(
                          children:
                              row.map((value) {
                                return Container(
                                  width: cellSize,
                                  height: cellSize,
                                  margin: const EdgeInsets.all(1),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(
                                          alpha: 0.05,
                                        ),
                                        blurRadius: 2,
                                        offset: const Offset(0, 1),
                                      ),
                                    ],
                                  ),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      value.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                        );
                      }).toList(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showExpandedMatrix(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$title (${matrix.length}x${matrix[0].length})',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.6,
                      maxWidth: MediaQuery.of(context).size.width * 0.8,
                    ),
                    child: InteractiveViewer(
                      boundaryMargin: const EdgeInsets.all(20),
                      minScale: 0.5,
                      maxScale: 4.0,
                      child: SingleChildScrollView(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children:
                                matrix.map((row) {
                                  return Row(
                                    children:
                                        row.map((value) {
                                          return Container(
                                            width: 48,
                                            height: 48,
                                            margin: const EdgeInsets.all(2),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: Colors.grey.shade300,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withValues(alpha: 0.05),
                                                  blurRadius: 2,
                                                  offset: const Offset(0, 1),
                                                ),
                                              ],
                                            ),
                                            child: Text(
                                              value.toString(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                  );
                                }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      final matrixJson = _matrixToString();
                      Clipboard.setData(ClipboardData(text: matrixJson));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Matrix copied to clipboard'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: const Text('Copy Matrix'),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Close'),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  String _matrixToString() {
    return '[${matrix.map((row) => '[${row.join(',')}]').join(',')}]';
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: Theme.of(context).colorScheme.error,
            size: 60,
          ),
          const SizedBox(height: 16),
          Text('Error', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => context.pushNamed(Routes.matrixInput),
            icon: const Icon(Icons.arrow_back),
            label: const Text('Return to Matrix Input'),
          ),
        ],
      ),
    );
  }
}

class _HistoryView extends StatelessWidget {
  const _HistoryView({required this.matrices});

  final List<Map<String, dynamic>> matrices;

  @override
  Widget build(BuildContext context) {
    if (matrices.isEmpty) {
      return const Center(child: Text('No rotation history available'));
    }

    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: matrices.length,
      separatorBuilder: (context, _) => const Divider(),
      itemBuilder: (context, index) {
        final matrix = matrices[index];
        final originalMatrix = matrix['originalMatrix'] as List<List<int>>;
        final rotatedMatrix = matrix['rotatedMatrix'] as List<List<int>>;
        final timestamp = matrix['timestamp'] as DateTime;

        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rotation #${index + 1}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      _formatDate(timestamp),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Adaptable layout para matrices en el historial
                if (isSmallScreen)
                  Column(
                    children: [
                      _MatrixDisplay(title: 'Original', matrix: originalMatrix),
                      const SizedBox(height: 12),
                      const Icon(Icons.arrow_downward),
                      const SizedBox(height: 12),
                      _MatrixDisplay(title: 'Rotated', matrix: rotatedMatrix),
                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: _MatrixDisplay(
                          title: 'Original',
                          matrix: originalMatrix,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.arrow_forward),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _MatrixDisplay(
                          title: 'Rotated',
                          matrix: rotatedMatrix,
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 8),
                Center(
                  child: TextButton(
                    onPressed: () {
                      context.read<MatrixResultBloc>().add(
                        MatrixResultEvent.loadMatrixFromHistory(
                          originalMatrix: originalMatrix,
                          rotatedMatrix: rotatedMatrix,
                        ),
                      );
                    },
                    child: const Text('Load this matrix'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year} '
        '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}

class MatrixResultBody extends StatelessWidget {
  const MatrixResultBody({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matrix Rotation Result'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed:
                () => context.read<MatrixResultBloc>().add(
                  const MatrixResultEvent.viewMatrixHistory(),
                ),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.pushNamed(Routes.settings),
          ),
        ],
      ),
      body: SafeArea(child: SingleChildScrollView(child: child)),
    );
  }
}
