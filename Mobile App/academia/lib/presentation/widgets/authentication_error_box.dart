import 'package:academia/presentation/widgets/custom_text.dart';
import 'package:flutter/Material.dart';

class AuthenticationErrorBox extends StatelessWidget {
  final String message;
  const AuthenticationErrorBox({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.red[100],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.red)),
        child: Row(
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: CustomText(
                text: message,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
