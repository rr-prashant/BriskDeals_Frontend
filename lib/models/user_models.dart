class User {
  int? id;
  String? token;
  String? email;
  String? name;
  String? location;
  String? phonenumber;
  int? is_user;

  User(
      {this.id,
      this.token,
      this.email,
      this.name,
      this.location,
      this.phonenumber,
      this.is_user});

  factory User.fromJson(json) {
    return User(
        email: json["email"],
        name: json["full_name"],
        id: json["pk"],
        location: json["location"],
        is_user: json["user_type"],
        phonenumber: json["phonenumber"]);
  }
}
