class User {
  final String id;
  final String fullname;
  final String email;

  User({this.email,this.id ,this.fullname});

  User.fromData(Map<String, dynamic> data)
      : email = data['email'],
        id = data['id'],
        fullname = data['fullname'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': fullname,
      'email': email, 
    };
  }
}
