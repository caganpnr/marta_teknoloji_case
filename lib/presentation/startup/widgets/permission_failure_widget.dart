import 'package:flutter/material.dart';
import 'package:marta_teknoloji_case/app/constants/app_strings.dart';
import 'package:marta_teknoloji_case/app/errors/failures.dart';
import 'package:marta_teknoloji_case/core/extensions/context_extensions.dart';
import 'package:marta_teknoloji_case/core/utility/app_settings/app_settings_utils.dart';

class PermissionFailureWidget extends StatefulWidget {
  const PermissionFailureWidget({
    super.key,
    required this.permissionFailure,
    required this.onRetryPressed,
  });

  final PermissionFailure permissionFailure;
  final void Function() onRetryPressed;

  @override
  State<PermissionFailureWidget> createState() => _PermissionFailureWidgetState();
}

class _PermissionFailureWidgetState extends State<PermissionFailureWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        widget.onRetryPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.paddingAllDefault,
        child: Center(
          child: switch (widget.permissionFailure) {
            NoPermissionFailure() => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.noPermissionFailure,
                    style: context.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: context.defaultValue,
                  ),
                  TextButton(
                    onPressed: widget.onRetryPressed,
                    child: const Text(
                      AppStrings.grantPermission,
                    ),
                  )
                ],
              ),
            PermanentlyDeniedFailure() => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.noPermissionFailure,
                    style: context.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: context.defaultValue,
                  ),
                  TextButton(
                    onPressed: () {
                      AppSettinsUtils.openAppSettings();
                    },
                    child: const Text(
                      AppStrings.openSettings,
                    ),
                  ),
                ],
              ),
            LocationServiceDisabledFailure() => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.locationServiceDisabled,
                    style: context.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: context.defaultValue,
                  ),
                  TextButton(
                    onPressed: () => AppSettinsUtils.openLocationSettings(),
                    child: const Text(
                      AppStrings.openLocationSettins,
                    ),
                  )
                ],
              ),
          },
        ),
      ),
    );
  }
}
