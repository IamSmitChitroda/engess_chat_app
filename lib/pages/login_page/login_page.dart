import 'package:engess_chat_app/headers.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    LoginController mutable = Provider.of<LoginController>(context);
    LoginController immutable =
        Provider.of<LoginController>(context, listen: false);

    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SignupHeaders(
                    lable: "Login To continue",
                  ),
                  const SizedBox(height: 50),
                  LoginField(email: email, pass: pass),
                  GestureDetector(
                    onTap: () async {
                      Logger().d("Login up button tap !!!");
                      mutable.loading();
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
                        mutable.loading();
                      } catch (e) {
                        Logger().e("Sign in Error: $e");
                        mutable.loading();
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
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: primaryColor),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(Routes.forgotPassword);
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const AuthBottom(label: 'Register'),
                ],
              ),
            ),
            if (mutable.isLoading)
              const AbsorbPointer(
                absorbing: true,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
          ],
        ),
      ),
    );
  }
}
