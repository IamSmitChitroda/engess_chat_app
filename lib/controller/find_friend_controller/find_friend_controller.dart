import 'package:engess_chat_app/headers.dart';

class FindFriendController extends ChangeNotifier {
  bool isLoading = false;
  void loading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
