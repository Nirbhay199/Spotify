import 'package:flutter/material.dart';

import '../constant/color.dart';

class AppButton extends StatelessWidget {
  final String buttonLabel;
  final void Function()? onPressed;
  final Color? buttonColor;
  final Color? textColor;
  final BorderSide? side;
  final double top, bottom, width, height;
  const AppButton(
      {super.key,
      required this.buttonLabel,
      this.onPressed,
      this.buttonColor,
      this.textColor,
      this.side,
      this.top = 0.0,
      this.bottom = 0.0,
      this.width = 337,
      this.height = 49});

  @override
  Widget build(BuildContext context) {
    var myOverlayEntry = OverlayEntry(
      builder: (context) => Center(
        child: CircularProgressIndicator(
          color: greenColor,
        ),
      ),
    );
    return Padding(
      padding: EdgeInsets.fromLTRB(0, top, 0, bottom),
      child: TextButton(
        onPressed: () {
          Overlay.of(context)?.insert(myOverlayEntry);
          if (onPressed != null) {
            onPressed!();
          }
          WidgetsBinding.instance.addPostFrameCallback((_) {
            myOverlayEntry.remove();
          });
        },
        style: TextButton.styleFrom(
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(45),
                side: side ?? BorderSide.none),
            fixedSize: Size(width, height)),
        child: Text(
          buttonLabel,
          style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
