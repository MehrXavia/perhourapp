import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onservice24/core/assets/app_icons.dart';
import 'package:onservice24/core/exceptions/extensions.dart';
import 'package:onservice24/core/routes/routes.dart';
import 'package:onservice24/core/widgets/buttons/custom_button.dart';
import 'package:onservice24/core/widgets/dialogs/dialogs_manager.dart';
import 'package:onservice24/src/admin/profile/presentation/profile/pages/profile/profile_service_provider_vistor_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/commen/common_state.dart';
import '../../../../../core/components/base_stateless_widget.dart';
import '../../../../../core/decorations/decorations.dart';
import '../../../../../core/themes/colors.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../../../../core/utils/helper_methods.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/buttons/app_icon.dart';
import '../../../../../core/widgets/buttons/app_icon_button.dart';
import '../../../../../core/widgets/images/image_network.dart';
import '../../../../shared/auth/data/models/profile_dto.dart';
import '../../data/models/ServiceProviderMarker.dart';

class UserInformation extends BaseStatelessWidget {
  final StreamStateInitial<bool> isFavoriteStream;
  final Function(int serviceProviderId, int subServiceId)? onFavorite;
  final Function(int notificationsTypeId, int serviceProviderId)
      onNotifications;
  UserInformation(
      {super.key,
      required this.profileDto,
      required this.onNotifications,
      this.onFavorite,
      required this.isFavoriteStream});

  final ServiceProviderMarker profileDto;
  final bool onTap = false;

  @override
  Widget build(BuildContext context) {
    isFavoriteStream.setData(profileDto.isFavuraite ?? false);
    return Container(
      padding: 15.paddingAll,
      decoration: Decorations.shapeTopShadow(
        radius: 0,
      ),
      child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  profileDto.imageUrl == null || profileDto.imageUrl == ''
                      ? profileDto.gender == "male"
                          ? Image.asset(
                              AppIcons.boy,
                              width: 45,
                              height: 45,
                            )
                          : Image.asset(
                              AppIcons.girl,
                              width: 45,
                              height: 45,
                            )
                      : ImageNetworkCircle(
                          size: 40,
                          image: profileDto.imageUrl,
                        ),
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: FutureBuilder<ProfileDto?>(
                          future: HelperMethods.getProfile(),
                          builder: (context, data) {
                            return SvgPicture.asset(
                                (profileDto.isLogedOut == true ||
                                        data.data?.phoneNumber ==
                                            profileDto.phoneNumber)
                                    ? AppIcons.notActive
                                    : AppIcons.active);
                          }))
                ],
              ),
              10.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${profileDto.firstName ?? ''}  ${profileDto.lastName ?? ''}",
                    style: kTextBold.copyWith(fontSize: 13, color: kDark12),
                  ),
                  //2.ph,
                  rating(),
                ],
              ),
              const Spacer(),
              FutureBuilder(
                  future: HelperMethods.getUserId(),
                  builder: (context, data) {
                    return StreamBuilder<bool>(
                        stream: isFavoriteStream.stream,
                        builder: (context, snapshot) {
                          return data.data == 0
                              ? const SizedBox()
                              : AppIconButton(
                                  // color: snapshot.data == true
                                  //     ? kBlueColorE4
                                  //     : null,
                                  icon: snapshot.data == true
                                      ? AppIcons.fa1
                                      : AppIcons.favorite,
                                  size: 25,
                                  onPressed: () {
                                    // int userId = await HelperMethods.getUserId();
                                    // if (userId == 0) {
                                    //   DialogsManager.showAlertDialog(
                                    //       context, dialogLogin());
                                    // } else {
                                    onFavorite!(
                                        profileDto.id!,
                                        profileDto.serviceProviderService
                                                ?.serviceId ??
                                            0);
                                    //   }
                                  },
                                );
                        });
                  })
            ],
          ),
          14.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  details(
                      text:
                          "${strings.the_service} ${getName(profileDto.serviceProviderService?.service?.arName ?? '', profileDto.serviceProviderService?.service?.enName ?? '')}",
                      appIcon: AppIcons.service,
                      context: context),
                  details(
                      text:
                          "${strings.experience} : ${profileDto.serviceProviderService?.experience} ${strings.years}",
                      appIcon: AppIcons.experiences,
                      context: context),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  details(
                      text:
                          "${strings.watch_price} : ${profileDto.serviceProviderService?.price} ${translateCurrency(profileDto.serviceProviderService?.currency ?? "")}",
                      appIcon: AppIcons.time,
                      context: context),
                  details(
                      text:
                          "${strings.nationality}:  ${profileDto.nationalityName}  ",
                      appIcon: AppIcons.world,
                      context: context),
                ],
              ),
            ],
          ),
          15.ph,
          Text(
            profileDto.serviceProviderService?.description ?? '',
            style: kTextMedium.copyWith(color: kBlackColor_12, fontSize: 15),
          ),
          25.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () async {
                  // int userId = await HelperMethods.getUserId();

                  push(context,
                      ProfileServiceProviderVistorPage(id: profileDto.id ?? 0));
                },
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      color: kBlueColorE4,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                      child: Text(
                    strings.profile,
                    style:
                        kTextBold.copyWith(color: Colors.white, fontSize: 13),
                  )),
                ),
              ),
              Spacer(),
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
          )
        ],
      ),
    );
  }

  RatingBarIndicator rating() {
    return RatingBarIndicator(
      direction: Axis.horizontal,
      rating: double.parse(profileDto.rateing.toString() ?? "0"),
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
      itemSize: 15.0,
      unratedColor: kUnRatedColor,
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );
  }

  Widget details({required String text, required String appIcon, context}) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width / 2.2,
      child: Padding(
        padding: 6.paddingBottom,
        child: Row(
          children: [
            AppIcon(
              icon: appIcon,
              size: 14,
            ),
            5.pw,
            Expanded(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: kTextRegular.copyWith(
                    fontSize: 13,
                    color: kBlackColor_12,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }

  whatsapp({
    required String contact,
    required String user,
  }) async {
    var whatsappUrl = Uri.parse("whatsapp://send?phone=$contact" +
        "&text=${Uri.encodeComponent("Hello $user")}");
    try {
      launchUrl(whatsappUrl);
    } catch (e) {
      debugPrint(e.toString());
    }
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

  // DialogsManager

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
