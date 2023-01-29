import 'package:flutter/material.dart';
import 'package:mero_kagaj_patra/src/camera.dart';

class RecognizeMainScreen extends StatelessWidget {
  const RecognizeMainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LicenseCamera(),
          AlignedButton(
            toolTip: "Instructions",
            icon: Icons.info_outline,
            alignment: Alignment.bottomRight,
            onPressed: () {
              Navigator.of(context).pushNamed('/validation');
            },
          ),
          AlignedButton(
            toolTip: "Manual Input",
            icon: Icons.keyboard,
            alignment: Alignment.bottomLeft,
            onPressed: () {
              Navigator.of(context).pushNamed('/validation');
            },
          ),
        ],
      ),
    );
  }
}

class AlignedButton extends StatelessWidget {
  const AlignedButton({
    Key? key,
    required this.toolTip,
    required this.icon,
    required this.alignment,
    required this.onPressed,
  }) : super(key: key);

  final String toolTip;
  final IconData icon;
  final AlignmentGeometry alignment;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final containerSize = size.width * 0.16;
    final containerMarginTop = MediaQuery.of(context).padding.top +
        size.height * 0.01; // size.height * 0.07;
    final containerMarginSymmetric = size.width * 0.03;
    final iconSize = size.width * 0.1;

    return Align(
      alignment: alignment,
      child: Container(
        width: containerSize,
        height: containerSize,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 6,
              offset: Offset(2, 2),
              spreadRadius: 1,
            ),
          ],
          border: Border.all(
            color: Colors.blue,
            width: 0,
          ),
          borderRadius: BorderRadius.circular(50),
          color: Colors.blue,
        ),
        margin: EdgeInsets.only(
          top: containerMarginTop,
          left: containerMarginSymmetric,
          right: containerMarginSymmetric,
          bottom: containerMarginSymmetric,
        ),
        child: IconButton(
          tooltip: toolTip,
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: iconSize,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
