
class MsnUser {

  String email;

  String password;

  String nom;

  String prenom;

  String numeroTel;

  MsnUser(this.email, this.password, this.nom, this.prenom, this.numeroTel);

  MsnUser.fromJson(Map<String,Object?> json)
      : this(json['email']! as String, json['password'] as String, json['nom'] as String, json['prenom'] as String, json['numeroTel'] as String);

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'nom': nom,
      'prenom': prenom,
      'numeroTel': numeroTel
    };
  }

}