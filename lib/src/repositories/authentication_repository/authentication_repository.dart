import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_art/src/exceptions/delete_account_exception.dart';
import 'package:my_art/src/exceptions/reset_password_exception.dart';
import 'package:my_art/src/exceptions/sign_in_with_email_and_password_failure.dart';
import 'package:my_art/src/exceptions/sign_up_with_email_and_password_failure.dart';
import 'package:my_art/src/features/auth/pages/welcome/welcome_screen.dart';
import 'package:my_art/widgets/navbar_roots.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  //Will be load when app launches this func will be called and set the firebaseUser state
  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => NavBarRoots());
  }

  //  -- Create Account with Email and Passsword
  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => NavBarRoots())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }

//  -- Sign In with Email and Passsword
  Future<String?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = SignInWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch (_) {
      const ex = SignInWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }

  // SignOut
  Future<void> logout() async => await _auth.signOut();

  // -- Reset Password
  Future<String?> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      final ex = ResetPasswordFailure.code(e.code);
      return ex.message;
    } catch (_) {
      const ex = ResetPasswordFailure();
      return ex.message;
    }
    return null;
  }

  // Delete Firebase User Account
  void deleteUser() async {
    try {
      await firebaseUser.value?.delete();
      Get.offAll(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = DeleteUserFailure.code(e.code);
      Get.snackbar("Error", ex.message);
    } catch (_) {
      const ex = DeleteUserFailure();
      Get.snackbar("Error", ex.message);
    }
  }

  // Sign up with Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        print('Google Sign-In was cancelled.');
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
      await googleUser.authentication;

      if (googleAuth == null) {
        print('Failed to get Google authentication details.');
        return null;
      }

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      final response =
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Check if the user is successfully created in Firebase
      if (response.user != null) {
        // Save created user in Firestore
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(response.user?.uid)
            .set({
          'Email': response.user?.email,
          'Password': "Not Provided",
          'Fullname': response.user?.displayName,
          'PhoneNo': response.user?.phoneNumber ?? "Not Provided",
          'CreatedAt': DateTime.now().toString().substring(0, 10),
          'DateofBirth': "Not Provided",
          'Location': "Not Provided",
        });

        return response;
      } else {
        // If some errors occur, return null
        print('Failed to create user in Firebase.');
        return null;
      }
    } catch (e, stackTrace) {
      print('Error signing in with Google: $e');
      print(stackTrace);
      return null;
    }
  }
}
