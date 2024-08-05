import 'package:engess_chat_app/headers.dart';

class LoginController with ChangeNotifier {
  bool isLoading = false;

  void loading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
