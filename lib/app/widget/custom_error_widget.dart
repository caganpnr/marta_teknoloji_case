import 'package:flutter/material.dart';
import 'package:marta_teknoloji_case/app/constants/app_strings.dart';
import 'package:marta_teknoloji_case/app/errors/failures.dart';
import 'package:marta_teknoloji_case/core/extensions/context_extensions.dart';

/// Takes  [Failure] as a parameter and displays the error message accodingly
///
/// Takes an optional onPressed function for the retry action
class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({required this.failure, super.key, this.onPressed});

  final Failure failure;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          switch (failure) {
            NetworkFailure() => AppStrings.networkFailure,
            UnknownFailure() => AppStrings.unknownFailure,
            NullResponseFailure() => AppStrings.nullResponseFailure,
          },
          style: context.textTheme.bodyLarge,
        ),
        TextButton.icon(
          label: const Text(AppStrings.retry),
          onPressed: onPressed,
          icon: const Icon(Icons.refresh_rounded),
        )
      ],
    );
  }
}
