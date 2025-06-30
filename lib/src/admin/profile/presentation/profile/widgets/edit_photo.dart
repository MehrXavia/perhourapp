import 'package:flutter/material.dart';
import 'package:onservice24/src/admin/profile/data/models/ProfileDto.dart';

import '../../../../../../core/assets/app_icons.dart';
import '../../../../../../core/components/base_stateless_widget.dart';
import '../../../../../../core/widgets/buttons/app_icon.dart';
import '../../../../../../core/widgets/images/image_network.dart';

class EditPhoto extends BaseStatelessWidget {
  EditPhoto({super.key, required this.profileDto});
  ProfileDataDto profileDto;
  @override
  Widget build(BuildContext context) {
    return profileDto.imageUrl == null
        ? profileDto.gender == "male"
            ? Image.asset(
                AppIcons.boy,
                width: 100,
                height: 100,
              )
            : Image.asset(
                AppIcons.girl,
                width: 100,
                height: 100,
              )
        : ImageNetworkCircle(
            size: 100,
            image: profileDto.imageUrl,
          );
  }
}
