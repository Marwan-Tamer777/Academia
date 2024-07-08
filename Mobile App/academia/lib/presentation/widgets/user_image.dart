import 'package:academia/presentation/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  final String avatar;
  const UserImage({required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Allow overflow outside of the Stack's bounds
      children: [
        Center(
          child: Container(
            width: 200,
            height: 200,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: ColorManager.buttonColor,
            ),
            child: Image.network(
              avatar.isEmpty ? 
              // formal student image 
              'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png'
              : avatar,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: -10, // Half outside the container
          right: 90, // Half outside the container
          child: Container(
            height: 50, 
            width: 50,
            decoration: BoxDecoration(
              color: ColorManager.buttonColor, 
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              CupertinoIcons.camera,
              color: ColorManager.white,
            ),
          ),
        ),
      ],
    );
  }
}