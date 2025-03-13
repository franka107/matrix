import 'package:flutter/material.dart';

/// The entry point of the application.
///
/// This function initializes and runs the Flutter application by
/// creating an instance of [MyApp].
void main() {
  runApp(const MyApp());
}

/// The root widget of the Matrix application.
///
/// This stateless widget defines the application theme and initial route.
/// It serves as the container for the entire application and establishes
/// the MaterialApp context.
class MyApp extends StatelessWidget {
  /// Creates a MyApp instance.
  ///
  /// The [key] parameter is optional and is passed to the parent class.
  const MyApp({super.key});

  /// Builds the widget tree for this application.
  ///
  /// This method defines the theme, title, and home page for the application.
  ///
  /// Returns a [MaterialApp] configured with the application settings.
  ///
  /// [context] is the build context provided by the Flutter framework.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Uses deep purple as the seed color for the application theme
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/// The home page of the Matrix application.
///
/// This stateful widget displays a counter that can be incremented by tapping
/// a floating action button. It demonstrates state management in Flutter.
class MyHomePage extends StatefulWidget {
  /// Creates a HomePage instance.
  ///
  /// The [title] parameter is required and sets the app bar title.
  /// The [key] parameter is optional and is passed to the parent class.
  const MyHomePage({super.key, required this.title});

  /// The title displayed in the app bar.
  final String title;

  /// Creates the mutable state for this widget.
  ///
  /// This method creates an instance of [_MyHomePageState] which maintains
  /// the widget's state.
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// The state class for [MyHomePage].
///
/// This class maintains the counter value and provides methods to manipulate
/// the state of the [MyHomePage] widget.
class _MyHomePageState extends State<MyHomePage> {
  /// The counter value that is displayed and incremented.
  int _counter = 0;

  /// Increments the counter and updates the UI.
  ///
  /// This method is called when the user taps the floating action button.
  /// It increments [_counter] by 1 and calls [setState] to rebuild the widget
  /// with the updated value.
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  /// Builds the UI of the home page.
  ///
  /// This method creates a [Scaffold] containing:
  /// - An app bar with the title provided in [MyHomePage.title]
  /// - A centered column containing a text label and the counter value
  /// - A floating action button that increments the counter when pressed
  ///
  /// [context] is the build context provided by the Flutter framework.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        /// Callback function that is called when the button is pressed.
        /// Calls [_incrementCounter] to update the counter state.
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
