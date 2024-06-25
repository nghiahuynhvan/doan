import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:footballmanager/presentation/field/components/tour_table_details.dart';
import 'package:get/get.dart';

import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_images.dart';
import '../../../core/styles/app_text_style.dart';
import '../../../domain/models/tournament/group_team_list_model.dart';
import '../../../shared/widget/app_bg_body_view.dart';
import '../../../shared/widget/scroll_view/single_chill_scroll_load_more_widget.dart';

class TableTour extends StatefulWidget {
  const TableTour({super.key});

  @override
  State<TableTour> createState() => _TableTourState();
}

class _TableTourState extends State<TableTour> {
  List<GroupTeamListModel> itemGroup = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return AppBgBodyView(
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.center,
            child: Text(
              'Đội bóng',
              style: AppTextStyles.bold19.copyWith(color: AppColors.bgWhite),
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: AppColors.appbarWhiteLow,
          elevation: 0,
        ),
        body: Container(
          child:  SingleChildScrollLoadView(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: itemGroup.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                var item = itemGroup[index];
                return GestureDetector(
                  onTap: () async{
                    // await applicationController.getUserDetails(item.member!.id);
                    // Get.to(InforMemberTeam(),arguments: item);
                    Get.to(TourTableDetails(), arguments: item);
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
                        children: [
                         Container(
                           child:
                           Column(children: [
                             Text(item.groupName!,style: AppTextStyles.bold16.copyWith(color: Colors.white),),
                             ListView.builder(
                               shrinkWrap: true,
                               padding: EdgeInsets.zero,
                               itemCount: item.groupTeamDTOS!.length,
                               physics: const NeverScrollableScrollPhysics(),
                               itemBuilder:(context, index)
                               {
                                 return Row(
                                   children: [
                                     ClipRRect(
                                       borderRadius: BorderRadius.circular(4),
                                       child: item.groupTeamDTOS![index].img!.isNotEmpty ||  item.groupTeamDTOS![index].img! == null
                                           ? Container(
                                         height: 30.h,
                                         width: 30.h,
                                         margin: const EdgeInsets.symmetric(
                                             vertical: 16, horizontal: 12),
                                         child: CircleAvatar(
                                           radius: 40,
                                           backgroundImage:
                                           NetworkImage( item.groupTeamDTOS![index].img!),
                                         ),
                                       )
                                           : Container(
                                         height: 40.h,
                                         width: 40.h,
                                         margin: const EdgeInsets.symmetric(
                                             vertical: 16, horizontal: 12),
                                         child: const CircleAvatar(
                                           radius: 40,
                                           backgroundImage: AssetImage(
                                               AppImages.userEmpty),
                                         ),
                                       ),
                                     ),
                                     Container(
                                       padding:
                                       EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                                       child: Text(item.groupTeamDTOS![index].teamName!,style: AppTextStyles.bold13.copyWith(color: Colors.white),
                                       maxLines: 1,
                                       overflow: TextOverflow.ellipsis,),
                                     )

                                   ],
                                 );
                               },

                             ),

                           ],),
                         )
                        ],
                      )
                  ),
                );
              },
            ),
            onRefresh: () async {
            },
          ),
        ),
      ),
    );
  }
}
