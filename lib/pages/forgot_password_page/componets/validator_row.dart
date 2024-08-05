import 'package:engess_chat_app/headers.dart';

class ValidatorRow extends StatelessWidget {
  const ValidatorRow(
      {super.key, required this.isValidate, required this.label});

  final bool isValidate;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                color: isValidate ? secondaryColor : Colors.transparent,
                border: isValidate
                    ? Border.all(color: Colors.transparent)
                    : Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(5)),
            child: const Center(
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 15,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: isValidate ? primaryColor : Colors.grey.shade400,
            ),
          )
        ],
      ),
    );
  }
}
