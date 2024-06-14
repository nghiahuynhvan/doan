import 'package:flutter/material.dart';
import 'package:footballmanager/common/enum/e_role_footballTeam.dart';
import 'package:footballmanager/core/styles/app_text_style.dart';
import 'package:footballmanager/domain/models/team/member_team_model.dart';
import 'package:footballmanager/presentation/team/discovery/discovery_details_controller.dart';
import 'package:footballmanager/shared/widget/app_bg_body_view.dart';

import '../../../domain/models/team/team_by_user_model.dart';

class UserInfor extends StatefulWidget {
  const UserInfor({Key? key, required this.item}) : super(key: key);

  final TeamByUserModel item;

  @override
  State<UserInfor> createState() => _UserInforState();
}

class _UserInforState extends State<UserInfor> {
  DiscoveryController discoveryController = DiscoveryController.to;
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
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        print('!!!!${itemTeam.id}');
                        discoveryController.requestApply(MemberData(
                          teamId: itemTeam.id!,
                          member: MemberInfo(
                              createAt: '01-06-2024 22:15',
                              updateAt: '01-06-2024 22:15',
                              id: '063a0ee7-2ad6-46bc-9309-a5d446ada10b',
                              phoneNumber: "070-311-3730 x065",
                              fullName: "Matthijs de Ligt",
                              nickName: "Pedro Little",
                              favoritePosition: "Strategist",
                              description:
                                  "Eos voluptatem aspernatur nesciunt asperiores esse.",
                              gender: "FEMALE",
                              birthday: "09-01-1962 06:56",
                              signInMethod: "GOOGLE",
                              status: "ACTIVE",
                              avatarUrl:
                                  "https://images.unsplash.com/photo-1683142028215-8529d43701fc?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bG9nbyUyMGZvb3RiYWxsfGVufDB8fDB8fHww",
                              username: "username58",
                              email: "blake.keebler@yahoo.com",
                              verifyEmail: true),
                        ));
                        if (_formKey.currentState!.validate()) {
                          // Handle form submission
                          print('Form submitted successfully!');
                          print('${selectedRole?.title}');
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 24.0),
                        child: Text('Submit'),
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
