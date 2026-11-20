import 'package:flutter/material.dart';

class Buttom extends StatelessWidget {
  const Buttom({
    super.key,
    required this.text,
    required this.ontap,
    required this.ioOPtype,
  });
  final String text;
  final VoidCallback ontap;
  final bool ioOPtype;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 90,
        width: 90,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: ElevatedButton(
            onPressed: ontap,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: ioOPtype ? Color(0XFF4B5EFC) : Color(0XFF2D2F38),
            ),
          ),
        ),
      ),
    );
  }
}
