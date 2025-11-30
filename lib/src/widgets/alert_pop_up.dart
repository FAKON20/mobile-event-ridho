import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/colors.dart';

class DialogGeneral extends StatefulHookConsumerWidget {
  DialogGeneral(
      {required this.text,
        this.width,
        this.height,
        this.textstyle,
        this.ontap,
        this.ontap2,
        this.textButton,
        this.textButton2,
        super.key});

  String text;
  String? textButton;
  String? textButton2;
  TextStyle? textstyle;
  double? height;
  double? width;
  VoidCallback? ontap;
  VoidCallback? ontap2;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DialogGeneralState();
}

class _DialogGeneralState extends ConsumerState<DialogGeneral> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // height: widget.height ?? 260,
        width: widget.width ?? 260,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFC4C4C4)),
            borderRadius: BorderRadius.circular(20),
            // color: Color(0xFF272727)
            color:Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                color: Colors.transparent,
                child: Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: widget.textstyle ??
                      TextStyle(
                          fontSize: 12,
                          color:Colors.black),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (widget.textButton?.isNotEmpty == true)
                    MyElevatedButtonNonGradient(
                        onPressed: widget.ontap,
                        borderRadius: BorderRadius.circular(20),
                        height: 40,
                        width: 100,
                        colors: EMColors.blue,
                        child: Center(
                          child: Text(
                            '${widget.textButton}',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white),
                          ),
                        )),
                  if (widget.textButton2?.isNotEmpty == true)
                    MyElevatedButtonNonGradient(
                        onPressed: widget.ontap2,
                        borderRadius: BorderRadius.circular(20),
                        height: 40,
                        width: 100,
                        colors: EMColors.red,
                        child: Center(
                          child: Text(
                            '${widget.textButton2}',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white),
                          ),
                        )),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class MyElevatedButtonNonGradient extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Color colors;
  final VoidCallback? onPressed;
  final Widget child;

  const MyElevatedButtonNonGradient({
    Key? key,
    required this.onPressed,
    required this.child,
    required this.colors,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    // this.gradient = const LinearGradient(colors: [Colors.cyan, Colors.indigo]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        // gradient: gradient,
        color: colors,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}