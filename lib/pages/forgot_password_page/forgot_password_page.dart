import 'package:engess_chat_app/headers.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPassController mutable = Provider.of<ForgotPassController>(context);
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Center(child: FlutterLogo(size: 90)),
                const SizedBox(height: 10),
                const Text(
                  "Welcome to Chat App",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: primaryColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 10,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(500)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 7, right: 7),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(500)),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(500)),
                    ),
                  ],
                ),
                const Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 40),
                Input(
                  hintText: 'Enter Email',
                  controller: mutable.emailController,
                  title: 'Email',
                  keyBoard: TextInputType.emailAddress,
                  icon: const Icon(
                    Icons.email,
                    size: 23,
                  ),
                ),
                const SizedBox(height: 15),
                const Row(
                  children: [
                    Text('Password',
                        style: TextStyle(fontSize: 16, color: primaryColor)),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.fromLTRB(12, 2, 5, 2),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    cursorColor: primaryColor,
                    style: const TextStyle(color: primaryColor),
                    controller: mutable.forgotPassController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.password),
                      focusColor: Colors.transparent,
                      border: InputBorder.none,
                      hintText: 'Enter New Password',
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                const SizedBox(height: 10),
                ValidatorRow(
                    isValidate: mutable.isLength8,
                    label: "At least 8 characters"),
                ValidatorRow(
                    isValidate: mutable.isSmallLetter,
                    label: "At least  1 lower case letter"),
                ValidatorRow(
                    isValidate: mutable.isCapitalLetter,
                    label: "At least 1 capital case letter"),
                ValidatorRow(
                    isValidate: mutable.isNumber, label: "At least 1 number"),
                ValidatorRow(
                    isValidate: mutable.isSpecialChar,
                    label: "At least 1 special character"),
                Input(
                  hintText: 'Confirm Password',
                  controller: mutable.forConPassController,
                  title: 'Confirm Password',
                  keyBoard: TextInputType.emailAddress,
                  icon: const Icon(
                    Icons.password,
                    size: 23,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Logger().i("Save Password Button Tapped !!!");

                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return BottomSheet(
                          backgroundColor: Colors.white,
                          showDragHandle: true,
                          enableDrag: true,
                          onClosing: () {},
                          builder: (context) => Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Column(
                              children: [
                                const FlutterLogo(size: 90),
                                const SizedBox(height: 20),
                                const Text(
                                  "Password Successfully",
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700,
                                    color: primaryColor,
                                  ),
                                ),
                                const Text(
                                  "Changed",
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700,
                                    color: primaryColor,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 8,
                                      decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(500)),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 4, right: 4),
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(500)),
                                    ),
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(500)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  width: double.infinity,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Text(
                                    "Ok",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "Save Password",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
