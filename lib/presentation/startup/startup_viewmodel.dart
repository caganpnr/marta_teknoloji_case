import 'package:marta_teknoloji_case/app/app.locator.dart';
import 'package:marta_teknoloji_case/app/app.router.dart';
import 'package:marta_teknoloji_case/app/enums/view_state.dart';
import 'package:marta_teknoloji_case/app/errors/failures.dart';
import 'package:marta_teknoloji_case/domain/usecases/get_location_usecase.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final UCGetLocation _ucGetLocation;
  final _navigationService = locator<NavigationService>();

  late final double lat;
  late final double long;
  PermissionFailure? failure;
  ViewState viewState = ViewState.loading;

  StartupViewModel({
    required UCGetLocation ucGetLocation,
  }) : _ucGetLocation = ucGetLocation;

  Future<void> getLocationData() async {
    viewState = ViewState.loading;
    notifyListeners();
    final location = await _ucGetLocation.call();
    location.fold(
      (failure) {
        this.failure = failure;
        viewState = ViewState.failure;
      },
      (locationData) {
        lat = locationData.$1;
        long = locationData.$2;
        _navigationService.navigateToWeatherView(lat: lat, long: long);
      },
    );
    notifyListeners();
  }
}
