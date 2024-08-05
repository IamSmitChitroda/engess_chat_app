import 'package:engess_chat_app/headers.dart';

class FirestoreServices {
  FirestoreServices._();

  Future<void> getEmail() async {
    currentUser = null;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString('email') ?? "";

    if (email != "") {
      await getCurrentUser();
    }
  }

  static final FirestoreServices instance = FirestoreServices._();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String userCollection = 'users collection';
  String friendCollection = 'friends collection';
  String chatCollection = 'chats collection';
  UserModal? currentUser;
  String email = '';
  Future<void> getCurrentUser() async {
    var data = await firestore
        .collection(userCollection)
        .doc(email)
        .get()
        .then((value) => value.data());

    currentUser = UserModal.fromMap(data!);
  }

  Future<void> addFriend({required UserModal friend}) async {
    try {
      await firestore
          .collection(userCollection)
          .doc(email)
          .collection(friendCollection)
          .doc(friend.email)
          .set(friend.toMap())
          .then(
            (value) => Logger().i("Friend added in Current User"),
          );

      await firestore
          .collection(userCollection)
          .doc(friend.email)
          .collection(friendCollection)
          .doc(email)
          .set(currentUser!.toMap())
          .then(
            (value) => Logger().i("Current added in Friend User"),
          );
    } catch (e) {
      Logger().e("Friends cant be added : $e");
    }
  }

  Future<void> setUser({
    required String name,
    required String email,
    required String phoneNo,
    required String password,
  }) async {
    User user = AuthServices.instance.auth.currentUser!;

    currentUser = UserModal(
      uid: user.uid,
      name: name,
      mobileNo: phoneNo,
      email: email,
      profilePic: user.photoURL ??
          "https://avatar-management--avatars.us-west-2.prod.public.atl-paas.net/default-avatar.png",
      password: password,
    );

    try {
      await firestore
          .collection(userCollection)
          .doc(email)
          .set(currentUser!.toMap());

      Logger().i("User added: $currentUser");
    } catch (e) {
      Logger().e("User cant be added: $e");
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getFriends({required String e}) {
    try {
      return firestore
          .collection(userCollection)
          .doc(e)
          .collection(friendCollection)
          .snapshots();
    } catch (e) {
      Logger().e('Get friends error: $e');
      return const Stream.empty();
    }
  }

  Future<UserModal?> getUser({required String email}) async {
    DocumentSnapshot<Map<String, dynamic>> data =
        await firestore.collection(userCollection).doc(email).get();

    return data.data() != null ? UserModal.fromMap(data.data()!) : null;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers() {
    try {
      return firestore.collection(userCollection).snapshots();
    } catch (e) {
      Logger().e('All user get error: $e');
      return const Stream.empty();
    }
  }

  Future<void> sendChat(
      {required String msj, required UserModal friend}) async {
    ChatModal chat =
        ChatModal(message: msj, time: DateTime.now(), status: "sent");

    try {
      await firestore
          .collection(userCollection)
          .doc(email)
          .collection(friendCollection)
          .doc(friend.email)
          .collection(chatCollection)
          .doc(chat.time.millisecondsSinceEpoch.toString())
          .set(chat.toMap());

      chat.status = "received";

      await firestore
          .collection(userCollection)
          .doc(friend.email)
          .collection(friendCollection)
          .doc(email)
          .collection(chatCollection)
          .doc(chat.time.millisecondsSinceEpoch.toString())
          .set(chat.toMap());
    } catch (e) {
      Logger().e('Chat cant sent error: ${e.toString()}');
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getChat(
      {required UserModal friend}) {
    try {
      return firestore
          .collection(userCollection)
          .doc(email)
          .collection(friendCollection)
          .doc(friend.email)
          .collection(chatCollection)
          .snapshots();
    } catch (e) {
      Logger().e('Get chat error: $e');
      return const Stream.empty();
    }
  }
}
