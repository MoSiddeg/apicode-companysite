class UserModel {
  String fname;
  String lname;
  String email;
  String createdAt;
  String phoneNumber;
  String uid;

  UserModel({
    required this.lname,
    required this.fname,
    required this.email,
    required this.createdAt,
    required this.phoneNumber,
    required this.uid,
  });

  // from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fname: map['first name'] ?? '',
      lname: map['last name'] ?? '',
      email: map['email'] ?? '',
      uid: map['uid'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      createdAt: map['createdAt'] ?? '',
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "first name": fname,
      "last name": lname,
      "email": email,
      "uid": uid,
      "phoneNumber": phoneNumber,
      "createdAt": createdAt,
    };
  }
}
