class UserData {
  final String userId;
  final String firstName;
  final String lastName;
  final int number;
  final String email;
  final String role;
  List<String>? momoType;
  int? cardNumber;
  String? expiryDate;
  int? cvv;
  String? payPalAddress;

  UserData({
    this.momoType,
    this.cardNumber,
    this.expiryDate,
    this.cvv,
    this.payPalAddress,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.number,
    required this.email,
    required this.role,
  });
}
