class SignInWithEmailAndPasswordFailure {
  final String message;

  const SignInWithEmailAndPasswordFailure({this.message = "Something went wrong"});
  factory SignInWithEmailAndPasswordFailure.code(String code) {
    switch(code) {
      case "invalid-email":
        return const SignInWithEmailAndPasswordFailure(message: "Email is not valid or badly formatted.");
      case "user-disabled":
        return const SignInWithEmailAndPasswordFailure(message: "This user has been disabled. Please contact support for help.");
      case "user-not-found":
        return const SignInWithEmailAndPasswordFailure(message: "No user found for that email.");
      case "wrong-password":
        return const SignInWithEmailAndPasswordFailure(message: "Wrong password provided for that user.");
      default:
        return const SignInWithEmailAndPasswordFailure();
    }
  }
  
  
} 