class UserDetail {
  final String name;
  final String email;
  // ignore: non_constant_identifier_names
  final String no_hp;

  // ignore: non_constant_identifier_names
  UserDetail({required this.name, required this.email, required this.no_hp});

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
        name: json['name'], email: json['email'], no_hp: json['no_hp']);
  }
}
