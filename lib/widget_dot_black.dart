import 'package:flutter/material.dart';

class WidgetDotBlack extends StatelessWidget {
  final bool isTop;
  final double buttonSize;

  const WidgetDotBlack({
    Key? key,
    required this.isTop,
    required this.buttonSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isTop ? Alignment.topCenter : Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
            top: isTop ? MediaQuery.of(context).size.height / 19 : 0,
            bottom: isTop ? 0 : MediaQuery.of(context).size.height / 10,
            left: MediaQuery.of(context).size.width / 25),

        width: buttonSize * 0.2, // 20% of the button size
        height: buttonSize * 0.2, // 20% of the button size
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
