import 'package:equatable/equatable.dart';
import 'package:practice_simple_travel_app/models/data_models.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  List<Object?> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUpState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignInState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ForgotPasswordState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OTPVerificationState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NewPasswordState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LogOutState extends CubitStates {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedState extends CubitStates {
  final List<DataModel> places;

  LoadedState(this.places);

  @override
  List<Object?> get props => [places];
}

class DetailState extends CubitStates {
  final DataModel place;

  DetailState(this.place);

  @override
  List<Object?> get props => [place];
}

class ErrorState extends CubitStates {
  final String message;

  ErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
