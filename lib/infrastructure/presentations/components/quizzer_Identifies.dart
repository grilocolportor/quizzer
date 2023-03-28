
import 'package:flutter/material.dart';

class QuizzerIdentifier extends StatefulWidget {
  const QuizzerIdentifier({super.key, this.backgroundColor, this.text});

  final Color? backgroundColor;
  final String? text;

  @override
  State<QuizzerIdentifier> createState() => _QuizzerIdentifierState();
}

class _QuizzerIdentifierState extends State<QuizzerIdentifier> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.04,
      width: size.width * 0.09,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.amber,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.9),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(4, 4), // changes position of shadow
          ),
        ],
      ),
      child: Center(
          child: Text(widget.text ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold))),
    );
  }
}
