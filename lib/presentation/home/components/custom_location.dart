import 'package:flutter/material.dart';
import 'package:footballmanager/presentation/home/home_controller.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_constants.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_style.dart';

class CustomLocation extends StatefulWidget {
  const CustomLocation({super.key});

  @override
  State<CustomLocation> createState() => _CustomLocationState();
}

class _CustomLocationState extends State<CustomLocation> {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController.to;
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.btGrey900,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16)),
          ),
          width: double.infinity,
          //  height: 120.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  'Trạng thái',
                  style: AppTextStyles.bold19.copyWith(color: Colors.white),
                ),
              ),
              Container(
                margin:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                width: double.infinity,
                height: (56 * 4) + 24,
                child: ListView.builder(
                  itemCount: AppConstants.listLocation.length,
                  itemBuilder: (context, index) {
                    var item = AppConstants.listLocation[index];
                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.btGrey800),
                      ),
                      onPressed: () {
                        // orderController.resetTimeSlotOrder(item.id);
                        // orderController.saveSelectedFacility(item.id);
                        // orderController.updateSelectedFacilityName();
                        homeController.updateLocation(item);
                        Get.back();
                      },
                      child: Text(
                        item,
                        style: AppTextStyles.bold19
                            .copyWith(color: AppColors.bgWhite),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );;
  }
}
