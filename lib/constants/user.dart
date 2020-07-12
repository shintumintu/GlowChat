class User {
  final String id;
  final String fullname;
  final String email;
  final String userimage;
  final String phonenumber;
  final String bio;
  final String userRole;

  User(
      {this.email,
      this.id,
      this.fullname,
      this.userimage,
      this.phonenumber,
      this.bio,
      this.userRole});

  User.fromData(Map<String, dynamic> data)
      : email = data['email'],
        id = data['id'],
        fullname = data['fullname'],
        userimage = data['userimage'],
        phonenumber = data['phonenumber'],
        bio = data['bio'],
        userRole = data['userRole'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': fullname,
      'email': email,
      'userimage': userimage,
      'phonenumber': phonenumber,
      'bio': bio,
      'userRole': userRole,
    };
  }
}
