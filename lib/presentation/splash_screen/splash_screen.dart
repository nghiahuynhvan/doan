import 'package:flutter/material.dart';

import '../../shared/widget/app_bg_body_view.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBgBodyView(
      child: Scaffold(
        body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
