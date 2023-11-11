class FCMtokens {
  final String email;
  final String token;
  final String uid;
  final String? createdAt;

  const FCMtokens({
    required this.email,
    required this.token,
    required this.uid,
    required this.createdAt,
  });

  factory FCMtokens.fromJson(Map<String, dynamic> json) => FCMtokens(
        email: json['email'],
        token: json['token'],
        uid: json['uid'],
        createdAt: json['createdAt'],
      );

  factory FCMtokens.empty() =>
      const FCMtokens(email: '', token: '', uid: '', createdAt: '');

  Map<String, dynamic> toJson() => {
        "email": email,
        "token": token,
        "uid": uid,
        "createdAt": createdAt,
      };
}
