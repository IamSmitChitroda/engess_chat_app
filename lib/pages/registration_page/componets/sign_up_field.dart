import 'package:engess_chat_app/headers.dart';

class SignUpField extends StatelessWidget {
  const SignUpField(
      {super.key,
      required this.name,
      required this.email,
      required this.phoneNo,
      required this.pass,
      required this.conPass});

  final name;
  final email;
  final phoneNo;
  final pass;
  final conPass;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Input(
          hintText: 'Enter name',
          controller: name,
          title: 'Name',
          keyBoard: TextInputType.name,
          icon: const Icon(
            Icons.person,
            size: 23,
          ),
        ),
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
          hintText: 'Enter phone number',
          controller: phoneNo,
          title: 'Phone number',
          keyBoard: TextInputType.phone,
          icon: const Icon(
            Icons.phone,
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
        Input(
          hintText: 'Enter Conform Password',
          controller: conPass,
          title: 'Conform Password',
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
