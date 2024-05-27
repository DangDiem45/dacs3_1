import 'dart:convert';

import 'package:dacs3_1/common/entities/entities.dart';
import 'package:dacs3_1/common/services/http_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRepo{
  static Future<UserCredential> firebaseSignIn(String email, String password) async{
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password);
    return credential;
  }

  static Future<UserLoginResponseEntity> login({LoginRequestEntity? params}) async{
    print("given info ${jsonEncode(params)}");
    var response = await HttpUtil().post(
      "api/login",
      queryParameters: params?.toJson()
      // queryParameters: {
      //   'name': "abc",
      //   'email': "abc456@gmail.com",
      //   'avatar': "xyz",
      //   'open_id': "asdfgh",
      //   'type': 1
      // }

    );
    return UserLoginResponseEntity.fromJson(response);
  }
}