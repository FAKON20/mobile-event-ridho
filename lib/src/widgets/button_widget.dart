import 'package:e_music/src/utils/colors.dart';
import 'package:flutter/material.dart';

class EMButton extends StatelessWidget {
  const EMButton({
    super.key,
    // required this.ref,
    required this.text,
    required this.onTap,
    this.backgroundColors,
    this.textColors,
    this.textSize,
    this.height,
    this.width,
  });
  final String text;
  final Color? backgroundColors;
  final Color? textColors;
  final double? textSize;
  final double? height;
  final double? width;
  final Function() onTap;
  // final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Material(
        color: backgroundColors ?? EMColors.blue,
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onTap,
          child: Container(
            height: height ?? 50,
            width: width ?? double.infinity,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30)
            ),
            child: Center(
                child: Text(text, style: TextStyle(fontSize: textSize ?? 12, color: textColors ?? Colors.white, fontWeight: FontWeight.bold),)),
          ),
        ),
      ),
    );
  }
}
