import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:footballmanager/core/bindings/initial_binding.dart';
import 'package:footballmanager/core/routing/app_pages.dart';
import 'package:get/get.dart';

import 'core/routing/route_path.dart';


/// {@template app}
/// Main widget that sets up
/// {@endtemplate}
class App extends StatelessWidget {
  /// {@macro app}
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    _initConfigureScreenUtils(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      initialBinding: InitialBindings(),
      // title: AppConstants.appName,
      initialRoute: Routers.splash,
      getPages: AppPages.routes,
      builder: FlutterSmartDialog.init(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.transparent),
      //supportedLocales: SLang.delegate.supportedLocales,
      supportedLocales: const [Locale('en')],
      // localizationsDelegates: const [
      //   SLang.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
    );
  }

  void _initConfigureScreenUtils(BuildContext context) {
    ScreenUtil.init(context, minTextAdapt: true);
  }
}