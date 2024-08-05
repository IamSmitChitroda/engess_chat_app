import 'package:engess_chat_app/headers.dart';

class ForgotPassController with ChangeNotifier {
  bool isLoading = false;

  void loading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController forgotPassController = TextEditingController();
  TextEditingController forConPassController = TextEditingController();
  bool isLength8 = true;
  bool isSmallLetter = false;
  bool isCapitalLetter = false;
  bool isNumber = false;
  bool isSpecialChar = false;

  void checkPassword(password) {
    loading();
    if (password.length >= 8) {
      isLength8 = true;
    } else {
      isLength8 = false;
    }
    if (password.contains(RegExp(r'[a-z]'))) {
      isSmallLetter = true;
    } else {
      isSmallLetter = false;
    }
    if (password.contains(RegExp(r'[A-Z]'))) {
      isCapitalLetter = true;
    } else {
      isCapitalLetter = false;
    }
    if (password.contains(RegExp(r'[0-9]'))) {
      isNumber = true;
    } else {
      isNumber = false;
    }
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      isSpecialChar = true;
    } else {
      isSpecialChar = false;
    }

    loading();
  }

  Future<void> getUser({required String email}) async {
    loading();
    UserModal? user = await FirestoreServices.instance.getUser(email: email);
    if (user != null) {}
    loading();
  }
}
