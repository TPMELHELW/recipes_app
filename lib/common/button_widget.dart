import 'package:flutter/material.dart';
import 'package:recipes_app/utils/constants/enums.dart';

class ButtonWidget extends StatelessWidget {
  final void Function()? onPress;
  final String text;
  final StatusRequest statusRequest;
  const ButtonWidget({
    super.key,
    this.onPress,
    required this.text,
    this.statusRequest = StatusRequest.none,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: statusRequest == StatusRequest.loading
          ? const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : Text(text),
    );
  }
}
