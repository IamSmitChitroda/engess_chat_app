import 'package:engess_chat_app/headers.dart';
import 'package:engess_chat_app/pages/login_page/componets/login_button.dart';

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
                  LoginButton(email: email, pass: pass, controller: immutable),
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
