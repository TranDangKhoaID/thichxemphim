import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:thichxemphim/locator.config.dart';

GetIt locator = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
GetIt configureDependencies() => $initGetIt(locator);
