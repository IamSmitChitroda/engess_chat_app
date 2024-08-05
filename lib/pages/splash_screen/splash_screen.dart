import 'package:engess_chat_app/headers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLoginAndNavigate();
    FirestoreServices.instance.getEmail();
    super.initState();
  }

  Future<void> checkLoginAndNavigate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? email = preferences.getString('email');

    bool isLogin = email != null && email != '' ? true : false;

    Logger().i("Email: $email");
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (isLogin) {
          Navigator.pushReplacementNamed(context, Routes.homePage,
              arguments: email);
        } else {
          Navigator.pushReplacementNamed(context, Routes.loginPage);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FlutterLogo(size: 170),
            SizedBox(height: 20),
            Text(
              'Chat App',
              style: TextStyle(
                fontSize: 30,
                color: primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
