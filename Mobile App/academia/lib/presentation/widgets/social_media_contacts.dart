import 'package:flutter/cupertino.dart';

import '../resources/assets_manager.dart';
import '../resources/values_manager.dart';
import 'elements/social_media_icons.dart';

class SocialMediaContacts extends StatelessWidget {
  const SocialMediaContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SocialMediaIcons(iconPath: ImageAssets.whatsapp),
        SizedBox(width: AppSize.s10),
        SocialMediaIcons(iconPath: ImageAssets.facebook),
        SizedBox(width: AppSize.s10),
        SocialMediaIcons(iconPath: ImageAssets.linkedin),
        SizedBox(width: AppSize.s10),
        SocialMediaIcons(iconPath: ImageAssets.microsoft),
      ],
    );
  }
}
