import 'package:bazarly_app/features/auth/data/models/sign_up_request_model.dart';
import 'package:bazarly_app/features/auth/data/repo/auth_repo.dart';
import 'package:bloc/bloc.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  Future<void> signup({required SignUpRequestModel signupRequestModel}) async {
    emit(SignUpLoading());
    final result = await authRepo.signup(
      signupRequestModel: signupRequestModel,
    );
    result.fold(
      (failure) => emit(SignUpFailure(failure)),
      (success) => emit(SignUpSuccess(success)),
    );
  }
}
