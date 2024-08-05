import 'package:engess_chat_app/headers.dart';

class HomeController extends ChangeNotifier {
  HomeController();

  bool isLoading = false;
  UserModal? currentUser;
  void loading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
