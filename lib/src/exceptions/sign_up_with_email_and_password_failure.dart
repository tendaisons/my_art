class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure({this.message = "Something went wrong"});

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch(code) {
      case "email-already-in-use":
        return const SignUpWithEmailAndPasswordFailure(message: "An account already exists for that email.");
      case "invalid-email":
        return const SignUpWithEmailAndPasswordFailure(message: "Email is not valid or badly formatted.");
      case "operation-not-allowed":
        return const SignUpWithEmailAndPasswordFailure(message: "Operation not allowed. Please contact support.");
      case "weak-password":
        return const SignUpWithEmailAndPasswordFailure(message: "Please enter a strong password.");
      case "user-disabled":
        return const SignUpWithEmailAndPasswordFailure(message: "This user has been disabled. Please contact support for help.");
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
} 