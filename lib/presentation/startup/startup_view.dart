import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:marta_teknoloji_case/app/enums/view_state.dart';
import 'package:marta_teknoloji_case/presentation/startup/widgets/permission_failure_widget.dart';
import 'package:marta_teknoloji_case/domain/usecases/get_location_usecase.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> with WidgetsBindingObserver {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: switch (viewModel.viewState) {
        ViewState.loading => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ViewState.success => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ViewState.failure => PermissionFailureWidget(
            onRetryPressed: () => viewModel.getLocationData(),
            permissionFailure: viewModel.failure!,
          ),
      },
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel(
        ucGetLocation: GetIt.instance<UCGetLocation>(),
      )..getLocationData();
}
