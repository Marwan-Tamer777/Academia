import 'package:academia/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'clip_path_backgound.dart';

class Background extends StatelessWidget {
  final int height;
  const Background({this.height = 220, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              // const BackgroundPattern(),
              ClipPath(
                clipBehavior: Clip.antiAlias,
                clipper: CurveClipper(),
                child: Container(
                  color: Theme.of(context)
                      .extension<CustomThemeExtension>()
                      ?.patternAppBarColor,
                  height: height.toDouble(),
                ),
              ),
              ClipPathBackground(height: height),
            ],
          ),
        ],
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 15;
    Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
