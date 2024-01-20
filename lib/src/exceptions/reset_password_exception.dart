class ResetPasswordFailure {
  final String message;

  const ResetPasswordFailure({this.message = "Something went wrong"});
  factory ResetPasswordFailure.code(String code) {
    switch(code) {
      case "invalid-email":
        return const ResetPasswordFailure(message: "Email is not valid or badly formatted.");
      case "user-disabled":
        return const ResetPasswordFailure(message: "This user has been disabled. Please contact support for help.");
      case "user-not-found":
        return const ResetPasswordFailure(message: "No user found for that email.");
      case "wrong-password":
        return const ResetPasswordFailure(message: "Wrong password provided for that user.");
      default:
        return const ResetPasswordFailure();
    }
  }
}