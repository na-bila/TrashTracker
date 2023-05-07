import 'package:flutter/material.dart';
class SquareTile extends StatelessWidget {
  final Function()? onTap;
  const SquareTile({
    super.key,
    required this.onTap,
  });



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey,
      ),
      child: Image.asset(
        "assets/images/google.png",
        height: 72,

      ),
    ),
    );
  }
}
