class User {
  late String uid;
  late String email;

  User(this.uid, this.email);

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
    };
  }
}
