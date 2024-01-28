import 'package:flutter/material.dart';

class ValidatorButton extends StatelessWidget {
  const ValidatorButton({
    super.key,
    required this.color,
    required this.text,
    required this.textStyle,
    required this.function,
  });

  final Color color;
  final String text;
  final TextStyle textStyle;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15),
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                blurStyle: BlurStyle.solid,
                offset: Offset(2, 2),
                color: Colors.grey,
                blurRadius: 5,
              )
            ],
          ),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
