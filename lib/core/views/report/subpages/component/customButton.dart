import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                EdgeInsetsDirectional.symmetric(vertical: 15))),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
