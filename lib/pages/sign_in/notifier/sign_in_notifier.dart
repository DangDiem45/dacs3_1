import 'package:dacs3_1/pages/sign_in/notifier/sign_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInNotifier extends StateNotifier<SignInState>{
  SignInNotifier():super(SignInState());

  void onUserEmailChange(String email){
    state = state.copyWith(email: email);
  }

  void onPasswordChange(String password){
    state = state.copyWith(password: password);
  }

}
final signInNotifierProvider = StateNotifierProvider<SignInNotifier, SignInState>((ref)=>SignInNotifier());