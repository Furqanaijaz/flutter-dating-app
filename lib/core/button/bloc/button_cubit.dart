import 'package:dartz/dartz.dart';
import 'package:dating_app/core/button/bloc/button_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class ButtonCubit<Usecase, params> extends Cubit<ButtonState> {
//   ButtonCubit() : super(ButtonInitState());
//   void execute({dynamic params, required Usecase usecase}) async {
//     emit(ButtonLoadingState());
//     Either result = await usecase(params);
//     result.fold(
//       (error) {
//         emit(ButtonErrorState(message: error));
//       },
//       (data) {
//         emit(ButtonLoadedState());
//       },
//     );
//   }
// }

// class ButtonCubit<Params> extends Cubit<ButtonState> {
//   final Future<Either<dynamic, dynamic>> Function(Params) usecase;

//   ButtonCubit({required this.usecase}) : super(ButtonInitState());

//   void execute(Params params) async {
//     emit(ButtonLoadingState());

//     final result = await usecase(params);

//     result.fold(
//       (error) => emit(ButtonErrorState(message: error)),
//       (data) => emit(ButtonLoadedState()),
//     );
//   }
// }
