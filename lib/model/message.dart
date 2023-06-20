class Message {
  final String message;
  final String senderUsername;
  final String messageId;
  final DateTime sentAt;

  Message({
    required this.message,
    required this.senderUsername,
    required this.messageId,
    required this.sentAt,
  });

  factory Message.fromJson(Map<String, dynamic> message) {
    return Message(
      messageId: message['id'],
      message: message['message'],
      senderUsername: message['senderUsername'],
      sentAt: DateTime.fromMillisecondsSinceEpoch(message['sentAt']),
    );
  }
}
