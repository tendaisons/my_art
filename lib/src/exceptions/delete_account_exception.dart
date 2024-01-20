class DeleteUserFailure{
  final String message;

  const DeleteUserFailure({this.message = "Something went wrong"});
  factory DeleteUserFailure.code(String code) {
    switch(code) {
      case "user-disabled":
      return const DeleteUserFailure(message: "This user has been disabled. Please contact support for help.");
      case "user-not-found":
        return const DeleteUserFailure(message: "No user found for that email.");
      default:
        return const DeleteUserFailure();
    }
  }
}