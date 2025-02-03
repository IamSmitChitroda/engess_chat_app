import 'package:engess_chat_app/headers.dart';

class AuthServices {
  AuthServices._();
  static final AuthServices instance = AuthServices._();

  FirebaseAuth auth = FirebaseAuth.instance;

   Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

  Future<void> signUpWithEmailAndPassword(
      {required email, required password}) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Logger().i("Sign up: ${credential.user!.email}");
    } catch (e) {
      Logger().e("Sign up Error: $e");
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      /*UserCredential credential = */
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((v) {
        Logger().d(v);
      }).onError((e, s) {
        Logger().e(e);
      });

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('email', email);

/*
      await FirestoreServices.instance.getEmail().then((v) {
        {
          Logger().i("Email shoreed: ${FirestoreServices.instance.email}");
        }
      }).onError((e, s) {
        Logger().e("SharedPreferences Error: $e");
      });
*/
      // Logger().i("Sign in Success: ${credential.user!.email}");
    } catch (e) {
      Logger().e("Auth Sign in Error: $e");
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('email', '');
      Logger().i("Sign out");
    } catch (e) {
      Logger().e("Sign out Error: $e");
    }
  }
}
