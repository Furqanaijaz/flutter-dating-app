abstract class ButtonState {}

class ButtonInitState extends ButtonState {}

class ButtonLoadingState extends ButtonState {}

class ButtonLoadedState extends ButtonState {}

class ButtonErrorState extends ButtonState {
  final String message;

  ButtonErrorState({required this.message});
}
