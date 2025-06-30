import 'package:flutter/material.dart';
import 'package:onservice24/core/exceptions/extensions.dart';
import 'package:onservice24/core/utils/helper_methods.dart';
import 'package:onservice24/src/admin/profile/data/models/ProfileDto.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/assets/app_icons.dart';
import '../../../../../../core/themes/colors.dart';
import '../../../../../../core/widgets/buttons/app_icon.dart';

class SocialMediaWidget extends StatelessWidget {
  SocialMediaWidget({super.key, required this.profileDto});
  final ProfileDataDto profileDto;
  onLaunch(String url) async {
    final _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 20.paddingHoriz  ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ((profileDto.facebook == null || profileDto.facebook == '')&&(profileDto.twitter == null || profileDto.twitter == '')&&(profileDto.insagram == null || profileDto.insagram == '')&&(profileDto.linkedin == null || profileDto.linkedin == ''))?SizedBox():  dividerWidget(20),
          profileDto.facebook == null || profileDto.facebook == ''
              ? const SizedBox()
              : InkWell(
                  onTap: () {
               onLaunch(profileDto.facebook ?? "");
                  },
                  child: const CircleAvatar(
                    radius: 22,
                    backgroundColor: kMainColor,
                    child: CircleAvatar(
                        radius: 20,
                        backgroundColor: kPrimaryLight,
                        child: AppIcon(
                          icon: AppIcons.facebook,
                          size: 20,
                        )),
                  ),
                ),
          ((profileDto.facebook == null || profileDto.facebook == '') &&  profileDto.twitter == null || profileDto.twitter == '')
              ? const SizedBox()
              : dividerWidget(
                  20,
                ),
          profileDto.twitter == null || profileDto.twitter == ''
              ? const SizedBox()
              : InkWell(
                  onTap: () {
                    onLaunch(profileDto.twitter ?? "");
                  },
                  child: const CircleAvatar(
                    radius: 22,
                    backgroundColor: kMainColor,
                    child: CircleAvatar(
                        radius: 20,
                        backgroundColor: kPrimaryLight,
                        child: AppIcon(
                          icon: AppIcons.twitter,
                          size: 20,
                        )),
                  ),
                ),
          profileDto.twitter == null || profileDto.twitter == ''
              ? const SizedBox()
              : dividerWidget(
                  20,
                ),
          profileDto.insagram == null || profileDto.insagram == ''
              ? const SizedBox()
              : InkWell(
                  onTap: () {
                    onLaunch(profileDto.insagram ?? "");
                  },
                  child: const CircleAvatar(
                    radius: 22,
                    backgroundColor: kMainColor,
                    child: CircleAvatar(
                        radius: 20,
                        backgroundColor: kPrimaryLight,
                        child: AppIcon(
                          icon: AppIcons.instagram,
                          size: 20,
                        )),
                  ),
                ),
          profileDto.insagram == null || profileDto.insagram == ''
              ? const SizedBox()
              : dividerWidget(20),
          profileDto.linkedin == null || profileDto.linkedin == ''
              ? const SizedBox()
              : InkWell(
                  onTap: () {
                    onLaunch(profileDto.linkedin ?? "");
                  },
                  child: const CircleAvatar(
                    radius: 22,
                    backgroundColor: kMainColor,
                    child: CircleAvatar(
                        radius: 20,
                        backgroundColor: kPrimaryLight,
                        child: AppIcon(
                          icon: AppIcons.linkedin,
                          size: 20,
                        )),
                  ),
                ),
          ((profileDto.facebook == null || profileDto.facebook == '')&&(profileDto.twitter == null || profileDto.twitter == '')&&(profileDto.insagram == null || profileDto.insagram == '')&&(profileDto.linkedin == null || profileDto.linkedin == ''))?SizedBox():   dividerWidget(
            20,
          ),
        ],
      ),
    );
  }

  dividerWidget(
    double? width,
  ) {
    return Container(
      height: 2,
      width: width ?? 20,
      color: kMainColor,
    );
  }
}
