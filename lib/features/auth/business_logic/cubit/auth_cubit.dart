import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:systel_telecom_task/db/users_database.dart';
import 'package:systel_telecom_task/features/auth/data/model/user.dart';

import '../../../../core/utils.dart';
import '../../data/model/auth_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  bool showError = false;
  List<User> users = [];

  Future<void> addUser(userName, String? walletAmount) async {
    final user = User(
        id: idGenerator(),
        userName: userName,
        walletAmount: walletAmount ?? '0.0');
    await UsersDatabase.instance.create(user);
    emit(AddedUser());
  }

  void hideErrorMessage() {
    showError = false;
    emit(AuthInitial());
  }

  void login(
      {required String username,
      required String email,
      required String password}) async {
    emit(Loading());
    final user = ParseUser(username, password, email);
    var response = await user.login();

    if (response.success) {
      showError = false;
      final currentUser = AuthModel.fromJson(response.result);
      emit(Success(currentUser));
    } else {
      emit(Error(response.error!.message));
      showError = true;
    }
  }

  void register(
      {required String username,
      required String email,
      required String password}) async {
    emit(Loading());
    final user = ParseUser(username, password, email);
    var response = await user.signUp();

    if (response.success) {
      showError = false;
      final currentUser = AuthModel.fromJson(response.result);

      await addUser(username, '500');
      emit(Success(currentUser));
    } else {
      emit(Error(response.error!.message));
      showError = true;
    }
  }
}

/*   if (response.error!.message ==
          'Account already exists for this username.') {
        login(username: username, email: email, password: password);
        
      }  */
