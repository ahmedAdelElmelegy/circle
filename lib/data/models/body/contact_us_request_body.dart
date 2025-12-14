class ContactUsRequestBody {
  final String name;
  String? email;
  final String subject;
  final String message;
  final String phone;

  ContactUsRequestBody({
    required this.name,
    this.email,
    required this.subject,
    required this.message,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'subject': subject,
        'message': message,
        'phone': phone,
      };
}
