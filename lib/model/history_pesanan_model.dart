class ListPesanan {
  final String tanggal;
  final String jenis;
  final String status;

  ListPesanan({
    required this.tanggal,
    required this.jenis,
    required this.status,
  });

  factory ListPesanan.fromJson(Map<String, dynamic> json) {
    return ListPesanan(
        tanggal: json['tanggal'], jenis: json['jenis'], status: json['status']);
  }
}
