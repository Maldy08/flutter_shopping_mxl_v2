class FCMnotification {
  final String email;
  final String messageId;
  final String title;
  final String body;
  final String sentDate;
  final Map<String, dynamic>? data;
  final String? imageUrl;

  const FCMnotification(
      {required this.email,
      required this.messageId,
      required this.title,
      required this.body,
      required this.sentDate,
      this.data,
      this.imageUrl});

  factory FCMnotification.fromJson(Map<String, dynamic> json) =>
      FCMnotification(
          email: json['email'],
          messageId: json['messageId'],
          title: json['title'],
          body: json['body'],
          sentDate: json['sentDate'],
          data: json["data"] ?? Map.from(json["data"]));

  factory FCMnotification.empty() => FCMnotification(
      email: '',
      messageId: '',
      title: '',
      body: '',
      sentDate: DateTime.now.toString(),
      data: null,
      imageUrl: '');

  Map<String, dynamic> toJson() => {
        "email": email,
        "messageId": messageId,
        "title": title,
        "body": body,
        "sentDate": sentDate,
        "data": data,
        "imageUrl": imageUrl,
      };
}
