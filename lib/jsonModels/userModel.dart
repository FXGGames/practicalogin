class Users {
  final int? userId;
  final String userName;
  final String userPass;
  final String? userEmail; // Hacer userEmail opcional

  Users({
    this.userId,
    required this.userName,
    required this.userPass,
    this.userEmail, // Hacer userEmail opcional en el constructor
  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
    userId: json["userId"],
    userName: json["userName"],
    userPass: json["userPass"],
    userEmail: json["userEmail"],
  );

  Map<String, dynamic> toMap() => {
    "userId": userId,
    "userName": userName,
    "userPass": userPass,
    "userEmail": userEmail
  };
}
