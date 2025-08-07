class UserCreationReq {
  final String fullName;
  final String email;
  final String password;
  final bool profileCompleted;

  UserCreationReq({
    required this.fullName,
    required this.email,
    required this.password,
    this.profileCompleted = false,
  });
}
