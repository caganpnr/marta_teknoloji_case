/// A base class for all the failures in the app
sealed class Failure {}

final class UnknownFailure extends Failure {}

final class NetworkFailure extends Failure {}

final class NullResponseFailure extends Failure {}

sealed class PermissionFailure {}

final class NoPermissionFailure extends PermissionFailure {}

final class PermanentlyDeniedFailure extends PermissionFailure {}

final class LocationServiceDisabledFailure extends PermissionFailure {}
