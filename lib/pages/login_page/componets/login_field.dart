import 'package:engess_chat_app/headers.dart';

class LoginField extends StatelessWidget {
  const LoginField({super.key, required this.email, required this.pass});
  final email, pass;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Input(
          hintText: 'Enter Email',
          controller: email,
          title: 'Email',
          keyBoard: TextInputType.emailAddress,
          icon: const Icon(
            Icons.email,
            size: 23,
          ),
        ),
        Input(
          hintText: 'Enter Password',
          controller: pass,
          title: 'Password',
          keyBoard: TextInputType.streetAddress,
          icon: const Icon(
            Icons.password,
            size: 23,
          ),
        ),
      ],
    );
  }
}
