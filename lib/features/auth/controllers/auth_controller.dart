import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:polygon/features/auth/controllers/model/signup_entry_model.dart';
import 'package:polygon/features/auth/data/Auth_Repository.dart';


// General Auth Controller Access
final authControllerProvider = Provider((ref) {
  final authController = AuthController(ref);
  return authController;
});

class AuthController {
  AuthController(this.ref);
  final Ref ref;

// NOTE: AMAZON SIGN IN METHOD
// TODO: add logic to validate result
  Future<SignInResult?> amazonSignIn() async {
    return ref.read(authRepositoryProvider).amazonSignIn();
  }
// NOTE: GOOGLE SIGN IN METHOD
// TODO: add logic to validate result
  Future<SignInResult?> googleSignIn() async {
    return ref.read(authRepositoryProvider).googleSignIn();
  }

// NOTE: MANUAL SIGN UP
  Future<SignUpResult?> signUp( 
    {
    required String email,
    required String password,
    required String phoneNum,
    BuildContext? context,
    } 
) async {

    final entry = SignUpEntry(email: email, password: password, phoneNum: phoneNum, context: context);

    return ref.read(authRepositoryProvider).manualSignUp(entry);
  }

// NOTE: MANUAL SIGN IN
// TODO: ADD PARAMETERS *********
// TODO: add logic to validate result
  Future<void> manualSignIn() async {
    await ref.read(authRepositoryProvider).manualSignIn();
  }

// NOTE: USER PERSONAL DATA ACCESS & ALTER
  Future<AuthUser> getCurrentUser() async {
    return ref.read(authRepositoryProvider).getCurrentUser();
  }
  Future<void> deactivateUser() async {
    await ref.read(authRepositoryProvider).deactivateUser();
  }
  Future<bool> deleteUser() async {
    return ref.read(authRepositoryProvider).deleteUser();
  }
}
