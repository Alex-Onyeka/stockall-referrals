class Referree {
  final String id;
  final DateTime createdDate;
  final String name;
  final String email;
  final String phone;
  final String state;
  final String refCode;

  Referree({
    required this.id,
    required this.createdDate,
    required this.name,
    required this.email,
    required this.phone,
    required this.state,
    required this.refCode,
  });

  // 🔁 Factory method to create an instance from JSON
  factory Referree.fromJson(Map<String, dynamic> json) {
    return Referree(
      id: json['id'],
      createdDate: DateTime.parse(json['created_at']),
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      state: json['state'],
      refCode: json['ref_code'],
    );
  }

  // 🔁 Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdDate.toIso8601String(),
      'name': name,
      'email': email,
      'phone': phone,
      'state': state,
      'ref_code': refCode,
    };
  }
}
