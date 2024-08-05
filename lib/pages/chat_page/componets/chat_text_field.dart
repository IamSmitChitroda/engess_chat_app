import 'package:engess_chat_app/headers.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField(
      {super.key, required this.chatController, required this.friend});
  final TextEditingController chatController;
  final UserModal friend;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: TextField(
        controller: chatController,
        decoration: InputDecoration(
          hintText: 'Enter message',
          hintStyle: TextStyle(color: Colors.grey.shade500),
          filled: true,
          fillColor: Colors.grey.shade200,
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          prefixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.emoji_emotions),
          ),
          suffixIcon: IconButton(
            onPressed: () async {
              if (chatController.text.isNotEmpty) {
                FirestoreServices.instance
                    .sendChat(msj: chatController.text, friend: friend);
                chatController.clear();
                FocusScope.of(context).unfocus();
              }
            },
            icon: Transform.rotate(angle: 276, child: const Icon(Icons.send)),
          ),
        ),
      ),
    );
  }
}
