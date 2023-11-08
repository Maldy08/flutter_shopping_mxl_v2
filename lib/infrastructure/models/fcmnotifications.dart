class FCMnotification {
  final String email;
  final String messageId;
  final String title;
  final String body;
  final String sentDate;
  final bool readed;
  final Map<String, dynamic>? data;
  final String? imageUrl;

  const FCMnotification(
      {required this.email,
      required this.messageId,
      required this.title,
      required this.body,
      required this.sentDate,
      required this.readed,
      this.data,
      this.imageUrl});

  FCMnotification copyWith(
          {String? email,
          String? messageId,
          String? title,
          String? body,
          String? sentDate,
          bool? readed,
          Map<String, dynamic>? data,
          String? imageUrl}) =>
      FCMnotification(
          email: email ?? this.email,
          messageId: messageId ?? this.messageId,
          title: title ?? this.title,
          body: body ?? this.body,
          sentDate: sentDate ?? this.sentDate,
          readed: readed ?? this.readed,
          data: data ?? this.data,
          imageUrl: imageUrl ?? this.imageUrl);

  // Todo copyWith({
  //   String? id,
  //   String? description,
  //   DateTime? completedAt,
  // }) =>
  //     Todo(
  //       id: id ?? this.id,
  //       description: description ?? this.description,
  //       completedAt: completedAt,
  //     );

  factory FCMnotification.fromJson(Map<String, dynamic> json) =>
      FCMnotification(
          email: json['email'],
          messageId: json['messageId'],
          title: json['title'],
          body: json['body'],
          sentDate: json['sentDate'],
          readed: json['readed'],
          data: json["data"] ?? Map.from(json["data"]));

  factory FCMnotification.empty() => FCMnotification(
      email: '',
      messageId: '',
      title: '',
      body: '',
      sentDate: DateTime.now.toString(),
      readed: false,
      data: null,
      imageUrl: '');

  Map<String, dynamic> toJson() => {
        "email": email,
        "messageId": messageId,
        "title": title,
        "body": body,
        "sentDate": sentDate,
        "readed": readed,
        "data": data,
        "imageUrl": imageUrl,
      };
}
