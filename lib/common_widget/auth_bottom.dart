import 'package:engess_chat_app/headers.dart';

class AuthBottom extends StatelessWidget {
  const AuthBottom({
    super.key,
    required this.label,
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Logger().f('Going to $label page');
        Navigator.pushReplacementNamed(
            context, label == 'Login' ? Routes.loginPage : Routes.registerPage);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label == 'Login'
                ? "Don't have an account?  "
                : "Already have an account?  ",
            style: const TextStyle(
                color: primaryColor, fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text(
            label,
            style: const TextStyle(
                color: secondaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          )
        ],
      ),
    );
  }
}
