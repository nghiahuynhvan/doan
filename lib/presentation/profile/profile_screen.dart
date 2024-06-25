import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:footballmanager/presentation/profile/components/profile_edit.dart';
import 'package:footballmanager/presentation/profile/profile_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants/pref_constants.dart';
import '../../core/routing/route_path.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/app_images.dart';
import '../../core/styles/app_text_style.dart';
import '../../domain/serviceable/auth_serviceable.dart';
import '../../shared/widget/app_bg_body_view.dart';
import '../../shared/widget/dialog/app_custom_dialog.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileController profileController = ProfileController.to;
  final authStoreService = AuthStore.to;
  final storage = Get.find<SharedPreferences>();

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    return AppBgBodyView(
        child: Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Cá nhân',
            style: AppTextStyles.bold19.copyWith(color: AppColors.bgWhite),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: AppColors.appbarWhiteLow,
        elevation: 0,
      ),
      body: authStoreService.isLogged.value == true ?Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () => {},
                  child: Container(
                    width: double.infinity,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.bgWhite.withOpacity(0.1),
                    ),
                    child: Obx(
                      () => profileController.userDetail.value != null
                          ? Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                  child: profileController.userDetail.value!.avatarUrl != null ?
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                        profileController
                                            .userDetail.value!.avatarUrl!),
                                  ) :
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage:
                                    AssetImage(
                                        AppImages.userEmpty),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 4),
                                  child: Column(
                                    children: [
                                      Text(
                                        profileController
                                            .userDetail.value!.fullName!,
                                        style: AppTextStyles.regular18
                                            .copyWith(color: AppColors.bgWhite),
                                      ),
                                      Text(
                                        profileController
                                            .userDetail.value!.favoritePosition ?? '',
                                        style: AppTextStyles.regular16.copyWith(
                                            color: AppColors.bgWhiteLow5),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          : Container(),
                    ),
                  ),
                ),
                Container(
                    width: double.infinity,
                    padding : EdgeInsets.symmetric(
                        horizontal: 8.w, vertical: 8.h),
                    // decoration: BoxDecoration(
                    //   color: AppColors.bgWhiteLow1,
                    //   borderRadius:  BorderRadius.circular(
                    //     16.r
                    //   ),
                    // ),
                    child: Obx(
                      () => profileController.userDetail.value != null
                          ? Column(
                              children: <Widget>[
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 16),
                                      child: Text(
                                        'THÔNG TIN CÁ NHÂN',
                                        style: AppTextStyles.regular16
                                            .copyWith(color: AppColors.bgWhite),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () async => {
                                          await Get.to(Edit_ProfilePage()),
                                          setState(() {}),
                                        },
                                        child: Container(
                                          alignment: Alignment.centerRight,
                                          padding:
                                              const EdgeInsets.only(right: 16),
                                          child: Text(
                                            'Sửa',
                                            style: AppTextStyles.regular16
                                                .copyWith(
                                                    color: AppColors.bgWhite),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                if (profileController.userDetail.value != null)
                                  _itemInformation(
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 16),
                                        child: Icon(
                                          Icons.account_box_outlined,
                                          color: AppColors.bgWhite,
                                          size: 24,
                                        ),
                                      ),
                                      profileController
                                          .userDetail.value!.email ?? ''),
                                if (profileController.userDetail.value != null)
                                  _itemInformation(
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 16),
                                        child: Icon(
                                          Icons.access_time,
                                          color: AppColors.bgWhite,
                                          size: 24,
                                        ),
                                      ),
                                      profileController
                                          .userDetail.value!.birthday
                                          .toString()),
                                _itemInformation(
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 16),
                                      child: Icon(
                                        Icons.phone,
                                        color: AppColors.bgWhite,
                                        size: 24,
                                      ),
                                    ),
                                    profileController
                                        .userDetail.value!.phoneNumber ?? ''),
                                _itemInformation(
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 16),
                                      child: Icon(
                                        Icons.description,
                                        color: AppColors.bgWhite,
                                        size: 24,
                                      ),
                                    ),
                                    profileController.userDetail.value!.description ?? "Chưa có mô tả"),
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 16),
                                      child: Text(
                                        'THÀNH TÍCH CÁ NHÂN',
                                        style: AppTextStyles.regular16
                                            .copyWith(color: AppColors.bgWhite),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () => {},
                                        child: Container(
                                          alignment: Alignment.centerRight,
                                          padding:
                                              const EdgeInsets.only(right: 16),
                                          child: Text(
                                            'Tất cả',
                                            style: AppTextStyles.regular16
                                                .copyWith(
                                                    color: AppColors.bgWhite),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 100.h,
                                  child: ListView.builder(
                                    itemCount:
                                        profileController.listAchieve.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var itemAchieve =
                                          profileController.listAchieve[index];
                                      return Container(
            
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: AppColors.bgWhiteLow1,
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 8),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              child: Text(
                                                itemAchieve.number.toString(),
                                                style: AppTextStyles.bold20
                                                    .copyWith(
                                                        color:
                                                            AppColors.bgWhite),
                                              ),
                                              width: 100.w,
                                            ),
                                            Container(
                                              child: Text(
                                                itemAchieve.text,
                                                style: AppTextStyles.regular18
                                                    .copyWith(
                                                        color:
                                                            AppColors.bgWhite),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return AppCustomDialog(
                                          title:
                                              'Bạn có chắc chắn muốn đăng xuất?',
                                          confirmButton: AppDialogButton(
                                            text: 'Đăng xuất',
                                            onPressed: () async {
                                              await authStoreService.logout(
                                                  isGoToLogin: false);
                                              Get.offNamed(Routers.login);
                                            },
                                          ),
                                          closeButton: AppDialogButton(
                                            text: 'Hủy',
                                            onPressed: () async {
                                              Get.back();
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  },
                                  child: Container(
            
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(
                                        top: 16, left: 16, right: 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.bgWhite.withOpacity(0.1),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding : EdgeInsets.symmetric(
                                              horizontal: 8.w, vertical: 8.h),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Text(
                                            'Đăng xuất',
                                            style: AppTextStyles.regular18
                                                .copyWith(
                                                    color: AppColors.bgWhite),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
            
                              ],
                            )
                          :Container()
                    ),)
              ],
            ),
          )
        ],
      ): GestureDetector(
        onTap: (){
          Get.offNamed(Routers.login);
        },
        child: Container(

          width: double.infinity,
          margin: const EdgeInsets.only(
              top: 16, left: 16, right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.bgWhite.withOpacity(0.1),
          ),
          child: Row(
            children: [
              Container(
                padding : EdgeInsets.symmetric(
                    horizontal: 8.w, vertical: 8.h),
                margin: const EdgeInsets.symmetric(
                    horizontal: 16),
                child: Text(
                  'Đăng nhập',
                  style: AppTextStyles.regular18
                      .copyWith(
                      color: AppColors.bgWhite),
                ),
              ),
            ],
          ),
        ),
      ) ,
    ));
  }
}

_itemInformation(Widget widget, String text) {
  return Container(
    child: Row(
      children: [
        widget,
        Container(
          width: 200.w,
          child: Text(
            text,
            style: AppTextStyles.regular16.copyWith(color: AppColors.bgWhite),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    ),
  );
}
