import 'package:engess_chat_app/headers.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routes.routes,
      theme: ThemeData(
        colorSchemeSeed: primaryColor,
        secondaryHeaderColor: secondaryColor,
      ),
    );
  }
}
