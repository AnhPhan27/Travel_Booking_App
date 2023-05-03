// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:practice_simple_travel_app/models/data_models.dart';

import 'package:practice_simple_travel_app/services/data_services.dart';

import 'cubit_states.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late List<DataModel> places;
  // final DataServices dataServices;
  late List<DataModel> place;
  Future<void> getData() async {
    try {
      emit(LoadingState());
      places = (await data.getInfo())!;
      emit(LoadedState(places));
    } catch (e) {
      emit(
        ErrorState(e.toString()),
      );
    }
  }

  detailPage(DataModel place) async {
    emit(DetailState(place));
  }

  goHome() {
    emit(LoadedState(places));
  }

  signUp() {
    emit(SignUpState());
  }

  signIn() {
    emit(SignInState());
  }

  forgotPassword() {
    emit(ForgotPasswordState());
  }

  otpVerification() {
    emit(OTPVerificationState());
  }

  newPassword() {
    emit(NewPasswordState());
  }

  logOut() {
    emit(LogOutState());
  }
}
