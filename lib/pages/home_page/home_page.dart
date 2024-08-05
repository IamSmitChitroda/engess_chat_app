import 'package:engess_chat_app/headers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController mutable = Provider.of<HomeController>(context);
    HomeController immutable =
        Provider.of<HomeController>(context, listen: false);
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      drawerEdgeDragWidth: MediaQuery.sizeOf(context).width,
      appBar: AppBar(title: const Text("Chat")),
      drawer: UserDrawer(mutable: mutable, immutable: immutable),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: StreamBuilder(
          stream: FirestoreServices.instance.getFriends(e: email),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              List<UserModal> allFriends = snapshot.data!.docs
                  .map((e) => UserModal.fromMap(e.data()))
                  .toList();
              return ListView.builder(
                itemCount: allFriends.length,
                itemBuilder: (c, i) {
                  UserModal friend = allFriends[i];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(friend.profilePic),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.chatPage,
                            arguments: friend);
                      },
                      title: Text(
                        friend.name,
                        style: const TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(friend.email),
                    ),
                  );
                },
              );
            } else {
              return const LoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}
