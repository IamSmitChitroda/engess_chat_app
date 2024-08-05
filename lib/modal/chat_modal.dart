class ChatModal {
  var message;
  var status;
  DateTime time;

  ChatModal({
    required this.message,
    required this.time,
    required this.status,
  });

  factory ChatModal.fromMap(Map<String, dynamic> data) => ChatModal(
        message: data['message'],
        time: DateTime.fromMillisecondsSinceEpoch(int.parse(data['time'])),
        status: data['status'],
      );

  Map<String, dynamic> toMap() => {
        'message': message,
        'time': time.millisecondsSinceEpoch.toString(),
        'status': status,
      };
}
