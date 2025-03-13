
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

/// A function that defines the base of dependency injection system.
/// Implement it in main.dart to initialize all dependencies.
@InjectableInit(
  initializerName: 'init', 
  preferRelativeImports: true, 
  asExtension: true
)
void configureDependencies() => getIt.init();