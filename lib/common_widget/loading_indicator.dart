import 'package:engess_chat_app/headers.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const AbsorbPointer(
      absorbing: true,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
