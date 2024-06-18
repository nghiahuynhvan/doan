import 'package:flutter/material.dart';
import 'package:footballmanager/common/enum/e_gender.dart';
import 'package:footballmanager/common/enum/e_role_footballTeam.dart';
import 'package:footballmanager/core/styles/app_text_style.dart';
import 'package:footballmanager/domain/models/team/member_team_model.dart';
import 'package:footballmanager/presentation/profile/profile_controller.dart';
import 'package:footballmanager/presentation/team/discovery/discovery_details_controller.dart';
import 'package:footballmanager/shared/widget/app_bg_body_view.dart';
import 'package:get/get.dart';

import '../../../domain/models/team/team_by_user_model.dart';
import '../../../domain/models/user/user_detail_model.dart';

class UserInfor extends StatefulWidget {
  const UserInfor({Key? key, required this.item}) : super(key: key);

  final TeamByUserModel item;

  @override
  State<UserInfor> createState() => _UserInforState();
}

class _UserInforState extends State<UserInfor> {
  DiscoveryController discoveryController = DiscoveryController.to;
  ProfileController profileController = ProfileController.to;
  final _formKey = GlobalKey<FormState>();
  ERole? selectedRole;

  final _fullNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _nickNameController = TextEditingController();
  final _favoritePositionController = TextEditingController();
  final _genderController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var item = profileController.userDetail;
    var itemTeam = widget.item;
    return AppBgBodyView(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Thông tin cá nhân'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.0),
                  _widgetTextForm(_fullNameController, 'Full Name'),
                  SizedBox(height: 16.0),
                  _widgetTextForm(_phoneNumberController, 'Phone Number'),
                  SizedBox(height: 16.0),
                  _widgetTextForm(_nickNameController, 'Nick Name'),
                  SizedBox(height: 16.0),
                  _widgetTextForm(
                      _favoritePositionController, 'Favorite Position'),
                  SizedBox(height: 16.0),
                  _widgetTextForm(_genderController, 'Gender'),
                  SizedBox(height: 16.0),
                  _widgetTextForm(_birthdayController, 'Birthday'),
                  SizedBox(height: 16.0),
                  _widgetTextForm(_usernameController, 'Username'),
                  SizedBox(height: 16.0),
                  DropdownButtonFormField<ERole>(
                    value: selectedRole,
                    onChanged: (ERole? newValue) {
                      setState(() {
                        selectedRole = newValue;
                      });
                    },
                    items:
                        ERole.values.map<DropdownMenuItem<ERole>>((ERole role) {
                      return DropdownMenuItem<ERole>(
                        value: role,
                        child: Text(role.title),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      labelText: 'Select a role',
                      border: OutlineInputBorder(),
                    ),
                    dropdownColor: Colors.blue[50],
                    iconEnabledColor: Colors.blue,
                    iconDisabledColor: Colors.grey,
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Obx(
                    () => Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                          child: Text('Submit'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _widgetTextForm(TextEditingController controller, String labelText) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 4),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Colors.white, width: 1.0),
      ),
    ),
    child: TextField(
      controller: controller,
      style: AppTextStyles.regular18.copyWith(color: Colors.white),
      readOnly: false,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTextStyles.regular18.copyWith(color: Colors.white),
      ),
    ),
  );
}
