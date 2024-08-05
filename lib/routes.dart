import 'package:engess_chat_app/headers.dart';

class Routes {
  static const String splashScreen = '/';
  static const String loginPage = 'login_page';
  static const String registerPage = 'register_page';
  static const String homePage = 'home_page';
  static const String chatPage = 'chat_page';
  static const String findFriend = 'find_friend';
  static const String forgotPassword = 'forgot_password';

  static Map<String, Widget Function(BuildContext)> routes = {
    splashScreen: (context) => const SplashScreen(),
    loginPage: (context) => LoginPage(),
    registerPage: (context) => RegistrationPage(),
    forgotPassword: (context) => const ForgotPasswordPage(),
    homePage: (context) => const HomePage(),
    findFriend: (context) => const FindFriendPage(),
    chatPage: (context) => const ChatPage(),
  };
}
