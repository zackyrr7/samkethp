class Data {
  int saldo;
  String tanggal;
  String status;

  Data({required this.saldo, required this.tanggal, required this.status});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        saldo: json['saldo'], tanggal: json['tanggal'], status: json['status']);
  }
}
