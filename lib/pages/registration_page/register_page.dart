import 'package:engess_chat_app/common_widget/loading_indicator.dart';
import 'package:engess_chat_app/headers.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNo = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController conPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginController mutable = Provider.of<LoginController>(context);
    LoginController immutable =
        Provider.of<LoginController>(context, listen: false);

    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SignupHeaders(),
                    SignUpField(
                        name: name,
                        email: email,
                        phoneNo: phoneNo,
                        pass: pass,
                        conPass: conPass),
                    SignupButtonButton(
                        name: name,
                        email: email,
                        phoneNo: phoneNo,
                        pass: pass,
                        conPass: conPass,
                        controller: immutable),
                    const SizedBox(height: 50),
                    const AuthBottom(label: 'Login'),
                  ],
                ),
              ),
            ),
            if (mutable.isLoading) const LoadingIndicator()
          ],
        ),
      ),
    );
  }
}
