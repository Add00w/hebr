class User {
  final String? id;
  final String? fullName;
  final String? email;
  final String? userName;
  final String? password;
  final String? userRole;

  User({
    this.userName,
    this.password,
    this.id,
    this.fullName,
    this.email,
    this.userRole,
  });

  User.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        userRole = data['userRole'],
        userName = data['userName'],
        password = data['password'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'userRole': userRole,
      'userName': userName,
      'password': password,
    };
  }
}
