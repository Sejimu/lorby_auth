class UserRegister {
  final int id;
  final String email;
  final String username;
  final String password;
  final String password_confirm;

  UserRegister(
      {required this.id,
      required this.email,
      required this.username,
      required this.password,
      required this.password_confirm});
}
