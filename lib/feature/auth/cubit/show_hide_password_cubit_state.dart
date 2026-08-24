part of 'show_hide_password_cubit_cubit.dart';

@immutable
sealed class ShowHidePasswordCubitState {}

final class ShowHidePasswordCubitInitial extends ShowHidePasswordCubitState {
  final bool isObscure;

  ShowHidePasswordCubitInitial({this.isObscure = true});
}
