import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:matrix/features/shared_kernel/application/di/injection.dart';
import 'package:matrix/features/shared_kernel/presentation/navigation/routes.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_input/bloc/matrix_input_bloc.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_input/bloc/matrix_input_event.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_input/bloc/matrix_input_model.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_input/bloc/matrix_input_side_effect.dart';
import 'package:matrix/features/shared_kernel/presentation/page/matrix_input/bloc/matrix_input_status.dart';
import 'package:matrix/platform/bloc/bloc_side_effect_listener.dart';

class MatrixInputPage extends StatelessWidget {
  const MatrixInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<MatrixInputBloc>()
                ..add(const MatrixInputEvent.initialized()),
      child: BlocSideEffectListener<MatrixInputBloc, MatrixInputSideEffect>(
        listener: (context, sideEffect) {
          switch (sideEffect) {
            case MatrixInputEffectShowToast():
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(sideEffect.message),
                  duration: const Duration(seconds: 2),
                ),
              );
            case MatrixInputEffectNavigateTo():
              context.pushNamed(sideEffect.route, extra: sideEffect.arguments);
            case MatrixInputEffectShowError():
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(sideEffect.message),
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 3),
                ),
              );
          }
        },
        child: const MatrixInputContent(),
      ),
    );
  }
}

class MatrixInputContent extends StatelessWidget {
  const MatrixInputContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatrixInputBloc, MatrixInputModel>(
      builder: (context, state) {
        return MatrixInputBody(
          child: switch (state.status) {
            MatrixInputStatusInitial() => const Center(
              child: CircularProgressIndicator(),
            ),
            MatrixInputStatusLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            MatrixInputStatusReady() => _MatrixInputForm(state: state),
            MatrixInputStatusRotationSuccess() => _SuccessView(
              success: state.status as MatrixInputStatusRotationSuccess,
              state: state,
            ),
            MatrixInputStatusError(:final message) => _ErrorView(
              message: message,
              state: state,
            ),
          },
        );
      },
    );
  }
}

class _MatrixInputForm extends StatelessWidget {
  const _MatrixInputForm({required this.state});

  final MatrixInputModel state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Enter a square matrix (NxN) as a JSON array of arrays:',
            style: Theme.of(context).textTheme.titleMedium,
          ),

          // Añadir selector de tamaño aquí para hacerlo más prominente
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                'Matrix size: ',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(width: 8),
              DropdownButton<int>(
                value: state.matrixSize,
                items:
                    List.generate(8, (i) => i + 1)
                        .map(
                          (size) => DropdownMenuItem(
                            value: size,
                            child: Text('$size x $size'),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  if (value != null) {
                    context.read<MatrixInputBloc>().add(
                      MatrixInputEvent.matrixDimensionsChanged(size: value),
                    );
                  }
                },
              ),
              const Spacer(),
              // Añadir un botón para generar matriz aleatoria
              TextButton.icon(
                onPressed: () {
                  context.read<MatrixInputBloc>().add(
                    const MatrixInputEvent.generateRandomMatrix(),
                  );
                },
                icon: const Icon(Icons.shuffle),
                label: const Text('Random'),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Text(
            'Example: [[1,2],[3,4]] for a 2x2 matrix',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 16),
          if (!state.isVisualInputMode)
            _TextInputMode(state: state)
          else
            _VisualInputMode(state: state),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed:
                      () => context.read<MatrixInputBloc>().add(
                        const MatrixInputEvent.inputModeToggled(),
                      ),
                  icon: Icon(
                    state.isVisualInputMode ? Icons.text_fields : Icons.grid_on,
                  ),
                  label: Text(
                    state.isVisualInputMode ? 'Text Mode' : 'Visual Mode',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed:
                      state.isValidInput
                          ? () => context.read<MatrixInputBloc>().add(
                            const MatrixInputEvent.rotateButtonPressed(),
                          )
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Rotate Matrix (90° Counter-Clockwise)'),
                ),
              ),
            ],
          ),
          if (state.errorMessage != null) ...[
            const SizedBox(height: 16),
            Text(
              state.errorMessage!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ],
        ],
      ),
    );
  }
}

class _TextInputMode extends StatefulWidget {
  const _TextInputMode({required this.state});

  final MatrixInputModel state;

  @override
  State<_TextInputMode> createState() => _TextInputModeState();
}

class _TextInputModeState extends State<_TextInputMode> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.state.matrixInput);
  }

  @override
  void didUpdateWidget(_TextInputMode oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Actualiza el controlador si el texto cambió pero el foco no está en este campo
    if (widget.state.matrixInput != _controller.text &&
        !_controller.selection.isValid) {
      _controller.text = widget.state.matrixInput;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: '[[1,2],[3,4]]',
            labelText: 'Matrix Input',
            errorText: widget.state.errorMessage,
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                _controller.clear(); // Limpia el controlador
                context.read<MatrixInputBloc>().add(
                  const MatrixInputEvent.clearButtonPressed(),
                );
              },
            ),
          ),
          maxLines: 5,
          onChanged:
              (value) => context.read<MatrixInputBloc>().add(
                MatrixInputEvent.matrixInputChanged(input: value),
              ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _VisualInputMode extends StatelessWidget {
  const _VisualInputMode({required this.state});

  final MatrixInputModel state;

  @override
  Widget build(BuildContext context) {
    if (state.matrixValues == null) {
      return const Center(child: Text('No matrix data available'));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: state.matrixValues!.length * 56.0,
            height: state.matrixValues!.length * 56.0,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: state.matrixValues!.length,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount:
                  state.matrixValues!.length * state.matrixValues!.length,
              itemBuilder: (context, index) {
                final row = index ~/ state.matrixValues!.length;
                final col = index % state.matrixValues!.length;
                return TextFormField(
                  initialValue: state.matrixValues![row][col].toString(),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: (value) {
                    final intValue = int.tryParse(value) ?? 0;
                    context.read<MatrixInputBloc>().add(
                      MatrixInputEvent.matrixCellChanged(
                        row: row,
                        column: col,
                        value: intValue,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.state});

  final String message;
  final MatrixInputModel state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
          ElevatedButton(
            onPressed:
                () => context.read<MatrixInputBloc>().add(
                  const MatrixInputEvent.initialized(),
                ),
            child: const Text('Return to Input'),
          ),
        ],
      ),
    );
  }
}

class _SuccessView extends StatelessWidget {
  const _SuccessView({required this.success, required this.state});

  final MatrixInputStatusRotationSuccess success;
  final MatrixInputModel state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Matrix Rotation Successful',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: _MatrixDisplay(
                  title: 'Original',
                  matrix: success.originalMatrix,
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.arrow_forward),
              const SizedBox(width: 16),
              Expanded(
                child: _MatrixDisplay(
                  title: 'Rotated',
                  matrix: success.rotatedMatrix,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed:
                () => context.read<MatrixInputBloc>().add(
                  const MatrixInputEvent.initialized(),
                ),
            child: const Text('Rotate Another Matrix'),
          ),
        ],
      ),
    );
  }
}

class _MatrixDisplay extends StatelessWidget {
  const _MatrixDisplay({required this.title, required this.matrix});

  final String title;
  final List<List<int>> matrix;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
                matrix.map((row) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        row.map((value) {
                          return Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Text(value.toString()),
                          );
                        }).toList(),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}

class MatrixInputBody extends StatelessWidget {
  const MatrixInputBody({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matrix Rotation'),
        actions: [
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
