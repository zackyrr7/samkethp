class DataP {
  String total;
  String tanggal;
  String jenis;

  DataP({required this.total, required this.tanggal, required this.jenis});

  factory DataP.fromJson(Map<String, dynamic> json) {
    return DataP(
        total: json['total'], tanggal: json['tanggal'], jenis: json['jenis']);
  }
}
