import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballmanager/domain/models/user/user_detail_model.dart';
import 'package:footballmanager/presentation/profile/profile_controller.dart';
import 'package:footballmanager/shared/widget/app_bg_body_view.dart';
import 'package:get/get.dart';

import '../../../common/enum/e_role_footballTeam.dart';
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
    String? _selectedSkillLevel;
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
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Họ Tên', style: AppTextStyles.bold16.copyWith(color: Colors.white),),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: AppColors.bgWhiteLow5, // Thay đổi màu sắc border ở đây
                          width: 1.0, // Thay đổi độ rộng border ở đây
                        ),
                      ),
                      child: TextField(
                        style: AppTextStyles.regular16.copyWith(color: AppColors.bgWhite),
                        controller: _nameController,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Số điện thoại', style: AppTextStyles.bold16.copyWith(color: Colors.white),),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: AppColors.bgWhiteLow5, // Thay đổi màu sắc border ở đây
                          width: 1.0, // Thay đổi độ rộng border ở đây
                        ),
                      ),
                      child: TextField(
                        style: AppTextStyles.regular16.copyWith(color: AppColors.bgWhite),
                        controller: _facebookController,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ví trí yêu thích',
                      style: AppTextStyles.bold16
                          .copyWith(color: Colors.white),
                    ),
                    Container(
                      child: DropdownButtonFormField<String>(
                        value: _selectedSkillLevel,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedSkillLevel = newValue;
                            profileController
                                .selectedPosition
                                .value = _selectedSkillLevel!;
                          });
                        },
                        items: ERole.getAllRolesTile()
                            .map<DropdownMenuItem<String>>((String role) {
                          return DropdownMenuItem<String>(
                            value: role,
                            child: Text(role),
                          );
                        }).toList(),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        dropdownColor: Colors.lightBlueAccent,
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.white,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mô tả', style: AppTextStyles.bold16.copyWith(color: Colors.white),),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: AppColors.bgWhiteLow5, // Thay đổi màu sắc border ở đây
                        width: 1.0, // Thay đổi độ rộng border ở đây
                      ),
                    ),
                    child: TextField(
                      style: AppTextStyles.regular16.copyWith(color: AppColors.bgWhite),
                      controller: _descriptionController,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
              ElevatedButton(
                onPressed: () {
                 profileController.updateUser(profileController.userDetail.value!.id! ,UserModel(
                   id:profileController.userDetail.value!.id!,
                   fullName: _nameController.text,
                   phoneNumber: _facebookController.text,
                   favoritePosition:  profileController
                       .selectedPosition
                       .value,
                   description: _descriptionController.text,
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
