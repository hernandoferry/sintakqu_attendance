import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'show_hide_password_cubit_state.dart';

class ShowHidePasswordCubitCubit extends Cubit<ShowHidePasswordCubitState> {
  ShowHidePasswordCubitCubit() : super(ShowHidePasswordCubitInitial());

  void togglePasswordVisibility() {
    if (state is ShowHidePasswordCubitInitial) {
      final currentObscure = (state as ShowHidePasswordCubitInitial).isObscure;

      emit(ShowHidePasswordCubitInitial(isObscure: !currentObscure));
    }
  }
}
