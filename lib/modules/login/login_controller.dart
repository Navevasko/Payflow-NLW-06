import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/auth/auth_controller.dart';

import '../../shared/models/user_model.dart';

class LoginController {
  Future<void> googleSignIn(BuildContext context) async {
    final authController = AuthController();

    GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      final response = await googleSignIn.signIn();
      final user = UserModel(
        name: response!.displayName!,
        photoUrl: response.photoUrl,
      );
      authController.setUser(context, user);
    } catch (error) {
      authController.setUser(context, null);
      print(error);
    }
  }
}
