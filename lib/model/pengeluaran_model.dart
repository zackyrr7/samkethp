class DataP {
  int total;
  String tanggal;
  String status;

  DataP({required this.total, required this.tanggal, required this.status});

  factory DataP.fromJson(Map<String, dynamic> json) {
    return DataP(
        total: json['total'], tanggal: json['tanggal'], status: json['status']);
  }
}
