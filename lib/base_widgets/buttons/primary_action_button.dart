import 'package:flutter/material.dart';

class PrimaryActionButton extends StatelessWidget {
  const PrimaryActionButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.enabled = true,
    this.isLoading = false,
    this.width,
  }) : super(key: key);

  final String text;
  final Function() onPressed;
  final bool enabled;
  final bool isLoading;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1.5,
                ),
              )
            : Text(text),
      ),
    );
  }
}
