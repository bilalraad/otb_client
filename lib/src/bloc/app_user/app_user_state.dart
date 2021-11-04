part of 'app_user_cubit.dart';

enum AppUserStatus {
  initial,
  noToken,
  tokenRegistered,
}

class AppUserState extends Equatable {
  final AppUserStatus status;
  final AppUser user;

  const AppUserState({
    this.status = AppUserStatus.initial,
    this.user = AppUser.initial,
  });

  @override
  List<Object> get props => [status, user];

  AppUserState copyWith({
    AppUserStatus? status,
    AppUser? user,
  }) {
    return AppUserState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  bool get stringify => true;
}
