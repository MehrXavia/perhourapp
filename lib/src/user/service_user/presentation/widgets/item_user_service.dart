
import 'package:flutter/material.dart';
import 'package:onservice24/core/widgets/images/image_network.dart';
 import 'package:onservice24/src/main_index.dart';
import 'package:onservice24/src/user/service_user/presentation/service_map/pages/marker_map_page.dart';

import '../../../../../core/utils/navigator.dart';
import '../../data/models/ServiceUserDto.dart';



class ItemServiceUserScreen extends BaseStatelessWidget {

 final  ServiceUserDto serviceUserDto;
 //final Function(double lat,double lon)latLong;

  ItemServiceUserScreen( {super.key, required this.serviceUserDto, });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  10.paddingTop+10.paddingHoriz,
      padding: 5.paddingAll,
      decoration: Decorations.kDecorationRadius(color:const Color(0xff2A60E4).withOpacity(0.2),borderColor: const Color(0xff2A60E4).withOpacity(0.2) ,),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( getName(serviceUserDto.arName??'', serviceUserDto.enName??'', ), style: kTextBold.copyWith(color: kMainColor,fontSize: 17),),
                Text(
                  getName(serviceUserDto.arDescription??'', serviceUserDto.enDescription??'',),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: kTextRegular.copyWith(
                    fontSize: 13,
                    color: kDark12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],

            ),
          ),
          10.pw,
          ImageNetworkCircle(image: serviceUserDto.imageUrl??"",size: 60,color: kBlueColorE4,) ,
        ],
      ),
    );
  }
}
