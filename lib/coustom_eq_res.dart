import 'package:flutter/material.dart';
class CoustomEqRes extends StatefulWidget {
  const CoustomEqRes({super.key, required this.text});
  final String text;

  @override
  State<CoustomEqRes> createState() => _CoustomEqResState();
}

class _CoustomEqResState extends State<CoustomEqRes> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container (
          child: Align(alignment:Alignment.topRight,
            child: Text(widget.text,style: TextStyle(color: Colors.white,fontSize: 35),)),
        ),
      ),
    );
  }
}
