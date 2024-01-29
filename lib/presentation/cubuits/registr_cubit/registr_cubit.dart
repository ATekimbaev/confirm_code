import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:token/data/models/registr_model.dart';
import 'package:token/data/repositories/auth_repositroy.dart';

part 'registr_state.dart';

class RegistrCubit extends Cubit<RegistrState> {
  RegistrCubit({required this.repositroy}) : super(RegistrInitial());

  Future<void> registr({required RegitsrModel model}) async {
    emit(RegistrLoading());
    try {
      String message = await repositroy.registr(model: model);
      emit(
        RegistrSuccess(
          message: message,
        ),
      );
    } catch (e) {
      emit(
        RegistrError(
          errorText: e.toString(),
        ),
      );
    }
  }

  final AuthRepositroy repositroy;
}
