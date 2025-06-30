import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:onservice24/core/exceptions/extensions.dart';
import 'package:onservice24/core/themes/colors.dart';
import 'package:onservice24/core/utils/date_formatter.dart';
import 'package:onservice24/core/widgets/images/image_network.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../../core/assets/app_icons.dart';
import '../../../../../../../core/components/base_stateless_widget.dart';
import '../../../../../../../core/decorations/decorations.dart';
import '../../../../../../../core/themes/text_styles.dart';
import '../../../../../../../core/utils/helper_methods.dart';
import '../../../../../../../core/utils/navigator.dart';
import '../../../../../../../core/widgets/buttons/app_icon.dart';
import '../../../../../../../core/widgets/dialogs/dialogs_manager.dart';
import '../../../../../../admin/profile/presentation/profile/pages/profile/profile_service_provider_vistor_page.dart';
import '../../../../data/models/Favourite_dto.dart';

class FavouriteItem extends BaseStatelessWidget {
  FavouriteItem(
      {super.key,
      required this.onNotifications,
      required this.favouriteDto,
      required this.onDelete});
  final FavouriteDto favouriteDto;
  final Function(int id) onDelete;
  final Function(int notificationsTypeId, int serviceProviderId)
      onNotifications;
  @override
  Widget build(BuildContext context) {
    print(favouriteDto.gender);
    print("jkjkjkjkkjkjkkj");
    //2024-03-29T18:30:15
    // final date = DateFormatter.formatFromString(favouriteDto.createdDate ?? '');
    // final time =
    //     DateFormatter.formatFromTimeString(favouriteDto.createdDate ?? '');
    DateTime dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss")
        .parse(favouriteDto.createdDate ?? '');
    // convert to timestamp
    String date = DateFormat('dd/MM/yyyy').format(dateTime);
    String time = DateFormat('hh:mm a').format(dateTime);
    return Container(
      margin: 10.paddingHoriz + 10.paddingTop,
      padding: 8.paddingAll,
      decoration: Decorations.baseDecoration(),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              favouriteDto.photoUrl == null || favouriteDto.photoUrl == ''
                  ? favouriteDto.gender == "male"
                      ? Image.asset(
                          AppIcons.boy,
                          width: 40,
                          height: 40,
                        )
                      : Image.asset(
                          AppIcons.girl,
                          width: 40,
                          height: 40,
                        )
                  : ImageNetworkCircle(
                      size: 40,
                      image: favouriteDto.photoUrl,
                    ),
              8.pw,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(favouriteDto.serviceProviderName ?? '',
                      style:
                          kTextRegular.copyWith(fontSize: 16, color: kDark12)),
                  7.ph,
                  SizedBox(
                    width: context.w - 100,
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.service),
                        5.pw,
                        Text(strings.the_service,
                            style: kTextMedium.copyWith(
                                fontSize: 13, color: kDark12)),
                        Expanded(
                          child: Text(
                              getName(
                                favouriteDto.subServiceNameAR ?? '',
                                favouriteDto.subServiceName ?? '',
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: kTextMedium.copyWith(
                                  fontSize: 12, color: kDark12)),
                        ),
                        AppIcon(icon: AppIcons.time, size: 14),
                        5.pw,
                        //
                        Text(
                          "${strings.hour_price} :  ${favouriteDto.price ?? ''} ${translateCurrency(favouriteDto.currency ?? '')} ",
                          style: kTextMedium.copyWith(
                              fontSize: 12, color: kDark12),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          10.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(AppIcons.date),
                      5.pw,
                      Text(date,
                          style: kTextMedium.copyWith(
                              fontSize: 13, color: kDark12)),
                    ],
                  ),
                  7.ph,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(AppIcons.time),
                      5.pw,
                      Text(time,
                          style: kTextMedium.copyWith(
                              fontSize: 13, color: kDark12)),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                  onTap: () async {
                    await onNotifications(3, favouriteDto.serviceProviderId!);
                    HelperMethods.launchWhatsApp(
                      favouriteDto.phoneNumber ?? '',
                    );
                  },
                  child: Padding(
                    padding: 5.paddingAll,
                    child: const Icon(FontAwesomeIcons.whatsapp,
                        color: kBlueColorE4, size: 20),
                  )),
              10.pw,
              InkWell(
                  onTap: () async {
                    await onNotifications(2, favouriteDto.serviceProviderId!);
                    launchPhoneDialer(favouriteDto.phoneNumber ?? '');
                  },
                  child: Padding(
                    padding: 5.paddingAll,
                    child: const Icon(Icons.phone_enabled_outlined,
                        size: 20, color: kBlueColorE4),
                  )),
              10.pw,
              InkWell(
                onTap: () {
                  push(
                      context,
                      ProfileServiceProviderVistorPage(
                          id: favouriteDto.serviceProviderId ?? 0));
                },
                child: Padding(
                  padding: 5.paddingAll,
                  child: const AppIcon(
                    icon: AppIcons.person1,
                    size: 20,
                  ),
                ),
              ),
              10.pw,
              InkWell(
                onTap: () {
                  DialogsManager.showAlertDialog(
                      context,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const AppIcon(
                            icon: AppIcons.alert,
                            size: 100,
                          ),
                          20.ph,
                          Text(strings.delete_message,
                              style: kTextMedium.copyWith(color: Colors.black)),
                          40.ph,
                          Padding(
                            padding: 20.paddingHoriz,
                            child: Row(
                              children: [
                                InkWell(
                                  child: Text(strings.ok,
                                      style: kTextMedium.copyWith(
                                          color: kBlueColorE4)),
                                  onTap: () {
                                    pop();
                                    onDelete(favouriteDto.id ?? 0);
                                  },
                                ),
                                30.pw,
                                InkWell(
                                    onTap: () {
                                      pop();
                                    },
                                    child: Text(strings.no,
                                        style: kTextMedium.copyWith(
                                            color: kGreyColor))),
                              ],
                            ),
                          ),
                        ],
                      ));
                },
                child: Padding(
                  padding: 5.paddingAll,
                  child: const AppIcon(
                    icon: AppIcons.delete,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
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
}
