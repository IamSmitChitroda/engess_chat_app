import 'package:engess_chat_app/headers.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.email,
    required this.pass,
    required this.controller,
  });
  final email, pass;
  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Logger().d("Login up button tap !!!");
        controller.loading();
        try {
          if (pass.text != "" && email.text != "") {
            Logger().d('If password and email not empty');

            await AuthServices.instance
                .signInWithEmailAndPassword(
              email: email.text,
              password: pass.text,
            )
                .then((value) {
              Logger().i("Sign in Success: ${email.text}");
            }).onError((e, s) {
              Logger().e("Sign in Error: $e");
            });
          }
          FirestoreServices.instance.getEmail();

          Navigator.pushReplacementNamed(context, Routes.homePage,
                  arguments: email.text)
              .then((v) {
            Logger().i("Login: $v");
          }).onError((e, s) {
            Logger().e("Login Failed:  $e");
          });
          controller.loading();
        } catch (e) {
          Logger().e("Sign in Error: $e");
          controller.loading();
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          "Login",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: primaryColor),
        ),
      ),
    );
  }
}
