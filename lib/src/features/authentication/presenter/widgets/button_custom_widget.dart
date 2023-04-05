import 'package:flutter/material.dart';

class ButtonCustomWidget extends StatelessWidget {
  final String title;
  final double fontSize;
  final double? height;
  final double? width;

  final void Function()? onPressed;
  const ButtonCustomWidget(
      {required this.onPressed,
      required this.title,
      required this.height,
      required this.width,
      required this.fontSize,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.secondary),
          fixedSize: MaterialStateProperty.all(
            const Size(348, 48),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
