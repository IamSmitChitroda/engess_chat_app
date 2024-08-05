import 'package:engess_chat_app/headers.dart';

class SignupHeaders extends StatelessWidget {
  const SignupHeaders({super.key, this.lable = "Register to continue"});
  final String lable;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        const Center(child: FlutterLogo(size: 90)),
        const SizedBox(height: 10),
        const Text(
          "Welcome to Chat App",
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.w600, color: primaryColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 10,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(500)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 7, right: 7),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(500)),
            ),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(500)),
            ),
          ],
        ),
        Text(
          lable,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
