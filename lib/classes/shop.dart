// class Shop {
//   final int? shopId;
//   final DateTime createdAt;
//   final String userId;
//   String email;
//   String name;
//   String? state;
//   String? country;
//   String? city;
//   String? shopAddress;
//   String? phoneNumber;
//   String? refCode;
//   bool isVerified;
//   bool isPaid;
//   DateTime? verifiedDate;

//   Shop({
//     this.shopId,
//     required this.createdAt,
//     required this.userId,
//     required this.email,
//     required this.name,
//     this.state,
//     this.city,
//     this.shopAddress,
//     this.country,
//     this.phoneNumber,
//     required this.isPaid,
//     required this.isVerified,
//     this.refCode,
//     required this.verifiedDate,
//   });

//   factory Shop.fromJson(Map<String, dynamic> json) {
//     return Shop(
//       shopId: json['shop_id'],
//       country: json['country'],
//       createdAt: DateTime.parse(json['created_at']),
//       userId: json['user_id'],
//       email: json['email'],
//       name: json['name'],
//       state: json['state'],
//       city: json['city'],
//       shopAddress: json['shop_address'],
//       phoneNumber: json['phone_number'],
//       isPaid: json['is_paid'] as bool,
//       isVerified: json['is_verified'] as bool,
//       refCode: (json['ref_code']) as String?,
//       verifiedDate:
//           json['verified_date'] == null
//               ? null
//               : DateTime.parse(json['verified_date']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'created_at': createdAt.toIso8601String(),
//       'user_id': userId,
//       'email': email,
//       'name': name,
//       'state': state,
//       'city': city,
//       'country': country,
//       'shop_address': shopAddress,
//       'phone_number': phoneNumber,
//       'is_verified': isVerified,
//       'is_paid': isPaid,
//       'ref_code': refCode,
//       'verified_date': verifiedDate,
//     };
//   }
// }
