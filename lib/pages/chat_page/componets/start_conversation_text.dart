import 'package:engess_chat_app/headers.dart';

class StartConversationText extends StatelessWidget {
  const StartConversationText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Start Conversation !!!",
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w600,
          color: primaryColor,
        ),
      ),
    );
  }
}
