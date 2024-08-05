import 'package:engess_chat_app/headers.dart';

class AddFriendTile extends StatelessWidget {
  const AddFriendTile({super.key, required this.user});
  final UserModal user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name),
      subtitle: Text(user.email),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.profilePic),
      ),
      trailing: IconButton(
        onPressed: () {
          FirestoreServices.instance.addFriend(friend: user);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: primaryColor,
              duration: const Duration(seconds: 2),
              behavior: SnackBarBehavior.fixed,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              showCloseIcon: true,
              dismissDirection: DismissDirection.horizontal,
              actionOverflowThreshold: 0.5,
              content: Text(
                "Now ${user.name.toString().replaceFirst(user.name[0], user.name[0].toUpperCase())} is your friend !!\nSend message now !",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
          Navigator.pop(context);
        },
        icon: const Icon(Icons.person_add),
      ),
    );
  }
}
