import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:marta_teknoloji_case/presentation/weather/weather_view.dart';
import 'package:marta_teknoloji_case/presentation/startup/startup_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: WeatherView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class App {}
