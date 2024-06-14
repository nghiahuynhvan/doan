
import 'package:flutter/material.dart';

import '../../core/styles/app_images.dart';


/// {@template app_background_body_view}
/// [AppBgBodyView] returns a widget that has stateless widget.
/// A body contain a tab bar view in home page with background default for
/// all of screens.
///
/// {@endtemplate}
class AppBgBodyView extends StatelessWidget {
  const AppBgBodyView(
      {super.key, required this.child, this.isUsedBackgroundImage});

  final Widget child;
  final bool? isUsedBackgroundImage;

  @override
  Widget build(BuildContext context) {
    final bool isUsedBackgroundImage = this.isUsedBackgroundImage ?? true;

    return Container(
      decoration: BoxDecoration(
        color: isUsedBackgroundImage ? null : Colors.black,
        image: isUsedBackgroundImage
            ? const DecorationImage(
          image: AssetImage(AppImages.imgAppBackground),
          fit: BoxFit.fill,
        )
            : null,
      ),
      child: child,
    );
  }
}
