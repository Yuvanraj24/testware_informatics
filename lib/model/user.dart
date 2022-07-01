class User {
  int? id;
  String? name;
  String? mailId;
  String? mobNo;
  String? password;

  userMap() {
    var mapping = Map<String, dynamic>();

    mapping['id'] = id ?? null;
    mapping['name'] = name!;
    mapping['mailId'] = mailId!;
    mapping['mobNo'] = mobNo!;
    mapping['password'] = password!;
    return mapping;
  }
}
