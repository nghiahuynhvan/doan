import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/styles/app_colors.dart';
import '../../core/styles/app_text_style.dart';
import '../../shared/widget/app_bg_body_view.dart';

class FieldPage extends StatefulWidget {
  const FieldPage({super.key});

  @override
  State<FieldPage> createState() => _FieldPageState();
}

class _FieldPageState extends State<FieldPage> {
  @override
  Widget build(BuildContext context) {
    return AppBgBodyView(
        child: Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Tournament',
            style: AppTextStyles.bold19.copyWith(color: AppColors.bgWhite),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: AppColors.appbarWhiteLow,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 20,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  padding: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: AppColors.bgWhiteLow1,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.bgwhiteLow2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                         '',
                          style: AppTextStyles.bold16
                              .copyWith(color: AppColors.bgWhite),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: Text(
                          '',
                          style: AppTextStyles.bold13
                              .copyWith(color: AppColors.bgWhiteLow6),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 4, left: 16, right: 36),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '',
                                style: AppTextStyles.regular13
                                    .copyWith(color: AppColors.bgWhite),
                              ),
                              TextSpan(
                                text: "",
                                style: AppTextStyles.bold13
                                    .copyWith(color: AppColors.bgYellow),
                              ),
                              TextSpan(
                                text: '',
                                style: AppTextStyles.regular13
                                    .copyWith(color: AppColors.bgWhite),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    ));
  }
}
