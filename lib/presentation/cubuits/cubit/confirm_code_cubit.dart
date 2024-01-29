import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:token/data/repositories/auth_repositroy.dart';

part 'confirm_code_state.dart';

class ConfirmCodeCubit extends Cubit<ConfirmCodeState> {
  ConfirmCodeCubit({required this.repositroy}) : super(ConfirmCodeInitial());

  Future<void> sendCode({required String code}) async {
    emit(ConfirmCodeLoading());
    try {
      String message = await repositroy.confirmCode(code: code);
      emit(
        ConfirmCodeSuccess(
          message: message,
        ),
      );
    } catch (e) {
      emit(
        ConfirmCodeError(
          errorText: e.toString(),
        ),
      );
    }
  }

  final AuthRepositroy repositroy;
}
