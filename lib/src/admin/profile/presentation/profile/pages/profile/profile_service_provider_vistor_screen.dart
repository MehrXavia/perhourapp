import 'package:flutter/material.dart';
import 'package:onservice24/src/admin/profile/data/models/ProfileDto.dart';
import 'package:onservice24/src/admin/profile/presentation/profile/widgets/social_media.dart';
import 'package:onservice24/src/main_index.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../../core/utils/helper_methods.dart';
import '../../../../../../../core/utils/navigator.dart';
import '../../../../../../../core/widgets/buttons/custom_button.dart';
import '../../../../../../admin/service/data/models/GetAllService.dart';
import '../../widgets/rating.dart';
import '../../widgets/edit_photo.dart';
import '../../widgets/service_body.dart';

class ProfileServiceProviderVistorScreen extends BaseStatelessWidget {
  ProfileServiceProviderVistorScreen(
      {super.key, required this.profileDto, required this.onNotifications, required this.listService});
  final scrollController = ScrollController();
  final Function(int notificationsTypeId, int serviceProviderId)
  onNotifications;
  final ProfileDataDto profileDto;
  final List<GetAllService> listService;
  onLaunch(String url) async {
    final _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        controller: scrollController,
        floatHeaderSlivers: true,
        scrollBehavior: const ScrollBehavior(),
        physics: const AlwaysScrollableScrollPhysics(),
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                30.ph,
                EditPhoto(profileDto: profileDto),
                12.ph,
                Rating(
                    rating: double.parse(profileDto.rateing.toString() ?? "0")),
                10.ph,
                SocialMediaWidget(profileDto: profileDto),
                ((profileDto.facebook == null || profileDto.facebook == '') &&
                    (profileDto.twitter == null || profileDto.twitter == '') &&
                    (profileDto.insagram == null ||
                        profileDto.insagram == '') &&
                    (profileDto.linkedin == null || profileDto.linkedin == ''))
                    ? SizedBox()
                    : 10.ph,

                Text(
                  "${profileDto.firstName ?? ""} ${profileDto.lastName ?? ""} ",
                  style:
                      kTextBold.copyWith(fontSize: 17, color: kBlackColor_12),
                ),
                5.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppIcons.earth),
                    6.pw,
                    Text(
                      profileDto.nationalityName ?? "",
                      style: kTextRegular.copyWith(
                          fontSize: 12, color: kBlackColor_12),
                    ),
                    15.pw,
                    SvgPicture.asset(AppIcons.sort),
                    6.pw,
                    Text(
                      profileDto.gender ?? "",
                      style: kTextRegular.copyWith(
                          fontSize: 12, color: kBlackColor_12),
                    )
                  ],
                ),
                10.ph,


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () async {

                          int userId = await HelperMethods.getUserId();
                          if (userId == 0) {
                            DialogsManager.showAlertDialog(context, dialogLogin());
                          } else {
                            await onNotifications(3, profileDto.id!);
                            HelperMethods.launchWhatsApp(
                                profileDto.phoneNumber ?? '');
                          }

                        },
                        child: const AppIcon(
                          icon: AppIcons.whats,
                          size: 50,
                        )),
                    20.pw,
                    InkWell(
                      onTap: () async {
                        int userId = await HelperMethods.getUserId();
                        if (userId == 0) {
                          DialogsManager.showAlertDialog(context, dialogLogin());
                        } else {
                          await onNotifications(2, profileDto.id!);
                          launchPhoneDialer(profileDto.phoneNumber ?? '');
                        }
                       },
                      child: AppIcon(
                        icon: AppIcons.phone,
                        size: 50,
                      ),
                    )
                  ],
                ),

              ],
            )),
          ];
        },
        body: Column(
          children: [

            Text(
              strings.my_services,
              style: kTextBold.copyWith(fontSize: 25, color: kMainColor),
            ),
            Expanded(
                child: ServiceBody(
              listService: listService,
            )),
          ],
        ));
  }
  Future<void> launchPhoneDialer(String contactNumber) async {
    final Uri _phoneUri = Uri(scheme: "tel", path: contactNumber);
    try {
      if (await canLaunch(_phoneUri.toString()))
        await launch(_phoneUri.toString());
    } catch (error) {
      throw ("Cannot dial");
    }
  }
  dialogLogin() {
    return Container(
      height: 100,
      margin: 20.paddingHoriz,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            strings.please_login,
            style: kTextSemiBold.copyWith(color: kPrimaryDark),
          ),
          20.ph,
          customButton(
              buttonText: strings.login,
              buttonColor: kBlueColorE4,
              buttonTextColor: Colors.white,
              buttonFunc: () {
                Navigators.pushNamedAndRemoveUntil(Routes.onBoardingPage);
              })
        ],
      ),
    );
  }
}
