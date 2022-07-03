
class MsnUser {

  String email;

  String password;

  MsnUser(this.email, this.password);

  MsnUser.fromJson(Map<String,Object?> json)
      : this(json['email']! as String, json['password'] as String);

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password
    };
  }

}