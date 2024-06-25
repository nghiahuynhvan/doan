import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_style.dart';
import '../../../domain/models/tournament/group_team_list_model.dart';
import '../../../shared/widget/app_bg_body_view.dart';
import '../../../shared/widget/scroll_view/single_chill_scroll_load_more_widget.dart';

class TourTableDetails extends StatefulWidget {
  const TourTableDetails({super.key});

  @override
  State<TourTableDetails> createState() => _TourTableDetailsState();
}

class _TourTableDetailsState extends State<TourTableDetails> {
  GroupTeamListModel itemGroup = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return AppBgBodyView(
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.center,
            child: Text(
              'Chi tiết bảng đấu',
              style: AppTextStyles.bold19.copyWith(color: AppColors.bgWhite),
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: AppColors.appbarWhiteLow,
          elevation: 0,
        ),
        body: Container(
          // decoration: BoxDecoration(
          //   color: AppColors.bgWhiteLow1,
          //   borderRadius: BorderRadius.circular(8),
          //   border: Border.all(color: AppColors.bgwhiteLow2),
          margin:  EdgeInsets.symmetric(
              horizontal: 8.w, vertical:8.h ),
          child:  SingleChildScrollLoadView(
            child: Column(

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(child: Text('Đội bóng',style: AppTextStyles.bold13.copyWith(color: Colors.white),),width: 100.w,),
                    Text('Trận',style: AppTextStyles.bold13.copyWith(color: Colors.white),),
                    Text('thắng',style: AppTextStyles.bold13.copyWith(color: Colors.white),),
                    Text('thua',style: AppTextStyles.bold13.copyWith(color: Colors.white),),
                    Text('Hòa',style: AppTextStyles.bold13.copyWith(color: Colors.white),),
                    Text('BT',style: AppTextStyles.bold13.copyWith(color: Colors.white),),
                    Text('SBT',style: AppTextStyles.bold13.copyWith(color: Colors.white),),
                    Text('Điểm',style: AppTextStyles.bold13.copyWith(color: Colors.white),),



                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: itemGroup.groupTeamDTOS!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var item = itemGroup.groupTeamDTOS![index];
                    return GestureDetector(
                      onTap: () async{
                        // await applicationController.getUserDetails(item.member!.id);
                        // Get.to(InforMemberTeam(),arguments: item);

                      },
                      child: Container(
                          margin:  EdgeInsets.symmetric(
                              horizontal: 8.w, vertical:8.h ),

                          // decoration: BoxDecoration(
                          //   color: AppColors.bgWhiteLow1,
                          //   borderRadius: BorderRadius.circular(8),
                          //   border: Border.all(color: AppColors.bgwhiteLow2),
                          // ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(child: Text(item.teamName!,style: AppTextStyles.bold13.copyWith(color: Colors.white),),width: 100.w,),
                                  Text(item.matchesPlayed!.toString(),style: AppTextStyles.bold16.copyWith(color: Colors.white),),
                                  Text(item.win!.toString(),style: AppTextStyles.bold16.copyWith(color: Colors.white),),
                                  Text(item.loss!.toString(),style: AppTextStyles.bold16.copyWith(color: Colors.white),),
                                  Text(item.draw!.toString(),style: AppTextStyles.bold16.copyWith(color: Colors.white),),
                                  Text(item.goalsFor!.toString(),style: AppTextStyles.bold16.copyWith(color: Colors.white),),
                                  Text(item.goalsAgainst!.toString(),style: AppTextStyles.bold16.copyWith(color: Colors.white),),
                                  Text(item.point!.toString(),style: AppTextStyles.bold16.copyWith(color: Colors.white),),



                                ],
                              ),

                            ],
                          )
                      ),
                    );
                  },
                ),
              ],
            )

          ),
        ),
      ),
    );

  }
}
