import 'package:engess_chat_app/headers.dart';

class Input extends StatelessWidget {
  const Input(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.title,
      required this.keyBoard,
      required this.icon});

  final String hintText;
  final TextEditingController controller;
  final String title;
  final TextInputType keyBoard;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            Text(title,
                style: const TextStyle(fontSize: 16, color: primaryColor)),
          ],
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.fromLTRB(12, 2, 5, 2),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            cursorColor: primaryColor,
            style: const TextStyle(color: primaryColor),
            controller: controller,
            decoration: InputDecoration(
              icon: icon,
              focusColor: Colors.transparent,
              border: InputBorder.none,
              hintText: hintText,
            ),
            keyboardType: keyBoard,
          ),
        ),
      ],
    );
  }
}
