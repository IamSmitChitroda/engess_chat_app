import 'package:engess_chat_app/headers.dart';

class SignupButtonButton extends StatelessWidget {
  const SignupButtonButton(
      {super.key,
      required this.name,
      required this.email,
      required this.phoneNo,
      required this.pass,
      required this.conPass,
      required this.controller});
  final name, email, phoneNo, pass, conPass, controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Logger().d("Sign up button tap !!!");
        controller.loading();
        try {
          if (pass.text == conPass.text &&
              pass.text != "" &&
              name.text != "" &&
              email.text != "" &&
              phoneNo.text != "") {
            await AuthServices.instance.signUpWithEmailAndPassword(
              email: email.text,
              password: pass.text,
            );
            await FirestoreServices.instance.setUser(
              name: name.text,
              email: email.text,
              phoneNo: phoneNo.text,
              password: pass.text,
            );
          }
          controller.loading();
          Navigator.pushReplacementNamed(context, Routes.loginPage);
        } catch (e) {
          controller.loading();
        }
      },
      child: GestureDetector(
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
            "Register",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: primaryColor),
          ),
        ),
      ),
    );
  }
}
