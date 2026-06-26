import 'package:bazarly_app/features/auth/data/models/login_request_model.dart';
import 'package:bazarly_app/features/auth/data/repo/auth_repo.dart';
import 'package:bloc/bloc.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginInitial());

  Future<void> login({required LoginRequestModel loginRequestModel}) async {
    emit(LoginLoading());
    final result = await authRepo.login(loginRequestModel: loginRequestModel);
    result.fold(
      (failure) => emit(LoginFailure(failure)),
      (success) => emit(LoginSuccess(success)),
    );
  }
    
}
