import 'package:engess_chat_app/headers.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key, required this.allChats});

  final List<ChatModal> allChats;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allChats.length,
      itemBuilder: (c, i) {
        ChatModal chat = allChats[i];
        return Row(
          mainAxisAlignment: chat.status == "sent"
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: chat.status == "sent"
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(
                      bottom: 2,
                      top: 10,
                    ),
                    decoration: BoxDecoration(
                      color: chat.status == "sent"
                          ? Colors.grey.shade200
                          : primaryColor,
                    ),
                    child: Text(
                      chat.message,
                      style: TextStyle(
                        color:
                            chat.status == "sent" ? primaryColor : Colors.white,
                      ),
                    ),
                  ),
                ),
                Text(
                    '${chat.time.hour.toString()}:${chat.time.minute.toString()}'),
              ],
            ),
          ],
        );
      },
    );
  }
}
