import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballmanager/common/enum/e_skillLevel.dart';
import 'package:footballmanager/domain/models/team/team_by_user_model.dart';
import 'package:footballmanager/presentation/team/team_controller.dart';
import 'package:get/get.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_style.dart';
import '../../../domain/models/address/address_city_model.dart';
import '../../../domain/models/address/district_model.dart';
import '../../../shared/widget/app_bg_body_view.dart';

class AddTeam extends StatefulWidget {
  const AddTeam({super.key});

  @override
  State<AddTeam> createState() => _AddTeamState();
}

class _AddTeamState extends State<AddTeam> {
  TeamController teamController = TeamController.to;
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();
  final _emailController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _textAddressController = TextEditingController();
  String? _selectedSkill;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppBgBodyView(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Thông tin cơ bản',
            style: AppTextStyles.bold19.copyWith(color: AppColors.bgWhite),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: AppColors.appbarWhiteLow,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tên đội',
                        style:
                            AppTextStyles.bold16.copyWith(color: Colors.white),
                      ),
                      _buildTextField(_nameController, 'Tên đội', (value) {
                        if (value!.isEmpty) {
                          return 'Vui lòng nhập tên đội';
                        }
                        return null;
                      }),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Số điên thoại',
                        style:
                            AppTextStyles.bold16.copyWith(color: Colors.white),
                      ),
                      _buildTextField(_numberController, 'Số điện thoại',
                          (value) {
                        if (value!.isEmpty) {
                          return 'Vui lòng nhập số điện thoại';
                        }
                        if (value!.length != 10) {
                          return 'Số điện thoại phải có 10 chữ số';
                        }
                        return null;
                      }),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style:
                            AppTextStyles.bold16.copyWith(color: Colors.white),
                      ),
                      _buildTextField(_emailController, 'Email', (value) {
                        if (value!.isEmpty) {
                          return 'Vui lòng nhập email';
                        }
                        if (!GetUtils.isEmail(value)) {
                          return 'Email không hợp lệ';
                        }
                        return null;
                      }),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trình độ',
                        style:
                            AppTextStyles.bold16.copyWith(color: Colors.white),
                      ),
                      Container(
                        child: DropdownButtonFormField<String>(
                          value: _selectedSkill,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedSkill = newValue;
                              teamController.seletedSkill.value =
                                  _selectedSkill!;
                            });
                          },
                          items: SkillLevel.getAllSkillLevels()
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
                Text(
                  'Địa chỉ',
                  style: AppTextStyles.bold18
                      .copyWith(color: Colors.white),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: AppTextStyles.bold16.copyWith(color: AppColors.bgWhite),
                        controller: _textAddressController,
                        decoration: InputDecoration(
                          hintText: '',
                          labelStyle: AppTextStyles.bold16.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    Obx(()=>  Expanded(
                      child: DropdownButton<AddressCityModel>(
                        isExpanded: true,
                        value: teamController.selectedCity.value,
                        onChanged: (value) {
                          setState(() {
                            teamController.selectedCity.value = value!;
                            teamController.getDistrict(value.id!);
                          });
                        },
                        items: teamController.itemAddress.value!.map((option) {
                          return DropdownMenuItem<AddressCityModel>(
                            value: option,
                            child: Text(option!.name!, style: AppTextStyles.bold16.copyWith(
                              color: Colors.white),
                            ),
                          );
                        }).toList(),
                        dropdownColor: Colors.lightBlueAccent,
                      ),
                    ),),
                    SizedBox(width: 16.0),
                    Obx(()=> Expanded(
                      child: DropdownButton<DistrictModel>(
                        isExpanded: true,
                        value: teamController.selectedDistrict.value,
                        onChanged: (value) {
                          setState(() {
                            teamController.selectedDistrict.value = value!;

                          });
                        },
                        items: teamController.itemDistrict.value!.map((option) {
                          return DropdownMenuItem<DistrictModel>(
                            value: option,
                            child: Text(option.name!, style: AppTextStyles.bold16.copyWith(
                              color: Colors.white
                            ),),
                          );
                        }).toList(),
                        dropdownColor: Colors.lightBlueAccent,
                      ),
                    ),),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                  child: _buildMultilineTextField(
                      _descriptionController, 'Giới thiệu'),
                ),
                SizedBox(
                  height: 30.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      teamController.createTeam(
                        TeamByUserModel(
                          id: teamController.authStoreService.idUser,
                          ownerId: teamController.authStoreService.idUser,
                          teamName: _nameController.text,
                          region: _textAddressController.text,
                          district: teamController.selectedDistrict.value!.name,
                          city: teamController.selectedCity.value!.name,
                          contactInformation: _numberController.text,
                          description: _descriptionController.text,
                          skillLevel: SkillLevel.init(
                              teamController.seletedSkill.value),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 48.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text('Thêm'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String labelText,
    FormFieldValidator<String>? validator,
  ) {
    return TextFormField(
      style: AppTextStyles.regular16.copyWith(color: AppColors.bgWhite),
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: AppColors.bgWhite,
            width: 1.0,
          ),
        ),
        labelStyle:
            AppTextStyles.regular16.copyWith(color: AppColors.bgWhiteLow5),
        labelText: labelText,
      ),
    );
  }

  Widget _buildMultilineTextField(
    TextEditingController controller,
    String labelText,
  ) {
    return TextField(
      style: AppTextStyles.regular16.copyWith(color: AppColors.bgWhite),
      controller: controller,
      maxLines: 3,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: AppColors.bgWhite,
            width: 1.0,
          ),
        ),
        labelStyle:
            AppTextStyles.regular16.copyWith(color: AppColors.bgWhiteLow6),
        labelText: labelText,
      ),
    );
  }
}
