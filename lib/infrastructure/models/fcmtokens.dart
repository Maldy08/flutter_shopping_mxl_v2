class FCMtokens {
  final String email;
  final String token;
  final String uid;

  const FCMtokens({
    required this.email,
    required this.token,
    required this.uid,
  });

  factory FCMtokens.fromJson(Map<String, dynamic> json) => FCMtokens(
        email: json['email'],
        token: json['token'],
        uid: json['uid'],
      );

  factory FCMtokens.empty() => const FCMtokens(
        email: '',
        token: '',
        uid: '',
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "token": token,
        "uid": uid,
      };
}
