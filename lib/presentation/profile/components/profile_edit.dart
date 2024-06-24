import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballmanager/domain/models/user/user_detail_model.dart';
import 'package:footballmanager/presentation/profile/profile_controller.dart';
import 'package:footballmanager/shared/widget/app_bg_body_view.dart';
import 'package:get/get.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_style.dart';

class Edit_ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Edit_ProfilePage> {
  ProfileController profileController = ProfileController.to;

  final _nameController = TextEditingController();
  final _facebookController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _addressController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBgBodyView(
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.center,
            child: Text(
              'Hồ sơ',
              style: AppTextStyles.bold19.copyWith(color: AppColors.bgWhite),
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: AppColors.appbarWhiteLow,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                style:
                    AppTextStyles.regular16.copyWith(color: AppColors.bgWhite),
                controller: _nameController,
                decoration: InputDecoration(
                  labelStyle: AppTextStyles.regular16
                      .copyWith(color: AppColors.bgWhite),
                  labelText: 'Họ và tên',
                ),
              ),
              SizedBox(height: 16.0.h),
              TextField(
                style:
                    AppTextStyles.regular16.copyWith(color: AppColors.bgWhite),
                controller: _facebookController,
                decoration: InputDecoration(
                  labelStyle: AppTextStyles.regular16
                      .copyWith(color: AppColors.bgWhite),
                  labelText: 'Facebook',
                ),
              ),
              SizedBox(height: 16.0.h),
              TextField(
                style:
                    AppTextStyles.regular16.copyWith(color: AppColors.bgWhite),
                controller: _birthdayController,
                decoration: InputDecoration(
                  labelStyle: AppTextStyles.regular16
                      .copyWith(color: AppColors.bgWhite),
                  labelText: 'Ngày sinh nhật',
                ),
              ),
              SizedBox(height: 16.0.h),
              TextField(
                style:
                    AppTextStyles.regular16.copyWith(color: AppColors.bgWhite),
                controller: _addressController,
                decoration: InputDecoration(
                  labelStyle: AppTextStyles.regular16
                      .copyWith(color: AppColors.bgWhite),
                  labelText: 'Địa chỉ',
                ),
              ),
              SizedBox(height: 16.0.h),
              TextField(
                style:
                    AppTextStyles.regular16.copyWith(color: AppColors.bgWhite),
                controller: _descriptionController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelStyle: AppTextStyles.regular16
                      .copyWith(color: AppColors.bgWhite),
                  labelText: 'Mô tả',
                ),
              ),
              SizedBox(height: 16.0.h),
              ElevatedButton(
                onPressed: () {
                 profileController.updateUser(profileController.userDetail.value!.id! ,UserModel(
                   id:profileController.userDetail.value!.id! ,
                   phoneNumber: "123456789",
                   fullName: "nghiahuynh",
                   nickName: "vanpersi",
                   favoritePosition: "GOALKEEPER",
                   description: "mot minh ta chap het",
                   username: profileController.userDetail.value!.username,
                   email: profileController.userDetail.value!.email,
                 ));

                  Get.back();
                },
                child: Container(
                    alignment: Alignment.bottomCenter, child: Text('Lưu')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
