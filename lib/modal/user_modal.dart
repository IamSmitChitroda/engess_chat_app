class UserModal {
  var uid;
  var name;
  var email;
  var mobileNo;
  var profilePic;
  var password;

  UserModal(
      {required this.name,
      required this.email,
      required this.uid,
      required this.mobileNo,
      required this.profilePic,
      required this.password});

  factory UserModal.fromMap(Map<String, dynamic> data) => UserModal(
        name: data["name"],
        email: data["email"],
        uid: data["uid"],
        mobileNo: data["mobile_no"],
        profilePic: data["profile_pic"],
        password: data["password"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "uid": uid,
        "mobile_no": mobileNo,
        "profile_pic": profilePic,
        "password": password
      };
}
