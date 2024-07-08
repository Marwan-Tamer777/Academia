import 'package:flutter/cupertino.dart';
import '../../resources/values_manager.dart';

class PostImage extends StatelessWidget {
  final String image;
  const PostImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16,),
      height: AppSize.s250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s16),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
