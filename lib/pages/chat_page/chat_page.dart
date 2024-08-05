import 'package:engess_chat_app/headers.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController chatController = TextEditingController();
    UserModal friend = ModalRoute.of(context)!.settings.arguments as UserModal;
    return Scaffold(
      appBar: AppBar(title: Text(friend.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FirestoreServices.instance.getChat(friend: friend),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ChatModal> allChats = snapshot.data?.docs
                            .map((e) => ChatModal.fromMap(e.data()))
                            .toList() ??
                        [];

                    return allChats.isNotEmpty
                        ? ChatListView(allChats: allChats)
                        : const StartConversationText();
                  } else {
                    return const LoadingIndicator();
                  }
                },
              ),
            ),
            ChatTextField(chatController: chatController, friend: friend),
          ],
        ),
      ),
    );
  }
}
