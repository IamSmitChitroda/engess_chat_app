import 'package:engess_chat_app/headers.dart';

class FindFriendPage extends StatelessWidget {
  const FindFriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Find Friends"),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.instance.getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            List<UserModal> allUser = snapshot.data!.docs
                .map(
                  (e) => UserModal.fromMap(
                    e.data(),
                  ),
                )
                .toList();

            allUser.removeWhere((element) => element.email == email);

            return ListView.builder(
              itemCount: allUser.length,
              itemBuilder: (c, i) {
                UserModal user = allUser[i];
                return AddFriendTile(
                  user: user,
                );
              },
            );
          } else {
            return const LoadingIndicator();
          }
        },
      ),
    );
  }
}
