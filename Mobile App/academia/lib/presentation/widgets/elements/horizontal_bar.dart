import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalBar extends StatelessWidget {
  const HorizontalBar({
    super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
