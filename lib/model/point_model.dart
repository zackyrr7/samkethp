class Saldo {
  final int total;
  final String status;

  Saldo({required this.total, required this.status});

  factory Saldo.fromJson(Map<String, dynamic> json) {
    return Saldo(total: json['total'], status: json['status']);
  }
}
