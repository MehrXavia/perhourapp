//import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:onservice24/core/widgets/buttons/custom_button.dart';
import 'package:onservice24/src/admin/subscriptions/presentation/pages/subscriptions_details_screen.dart';
import 'package:onservice24/src/main_index.dart';

import '../../../../../core/utils/navigator.dart';
import '../../data/models/AddSubsriptionsPrams.dart';
import '../../data/models/AllSubscriptionDto.dart';

class SubscriptionsSliderWidget extends BaseStatelessWidget {
  final List<AllSubscriptionDto> allSubscriptionDto;
  final Function(AddSubsriptionsPrams addSubsriptionsPrams) addSubsriptions;

  SubscriptionsSliderWidget({
    super.key,
    required this.allSubscriptionDto,
    required this.addSubsriptions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Decorations.kDecorationBorderRadius(
          color: Colors.white, radius: 20, borderColor: Colors.white),
      // child: CarouselSlider(
      //   options: CarouselOptions(
      //     height: 500,
      //     enlargeFactor: .5,
      //     viewportFraction: 1,
      //     enableInfiniteScroll:allSubscriptionDto.length==1?false: true,
      //     reverse: false,
      //     autoPlay: allSubscriptionDto.length==1?false:true,
      //     autoPlayInterval: const Duration(seconds: 6),
      //     autoPlayAnimationDuration: const Duration(milliseconds: 800),
      //     enlargeCenterPage: true,
      //     scrollDirection: Axis.horizontal,
      //   ),
      //   items: allSubscriptionDto
      //       .map(
      //         (allSubscriptionDto) => Column(
      //           children: [
      //             Container(
      //               margin: 10.paddingHoriz + 10.paddingTop,
      //               padding: 15.paddingAll,
      //               decoration: Decorations.baseDecoration(
      //                   borderColor: const Color(0xffA0BCFF),
      //                   color: Colors.white,
      //
      //                   radius: 12),
      //               width: double.infinity,
      //               child: Column(
      //                 children: [
      //                   40.ph,
      //                   Text(
      //                  getName(allSubscriptionDto.name ?? "", allSubscriptionDto.enName ?? "")   ,
      //                     style:
      //                         kTextBold.copyWith(fontSize: 20, color: kDark12),
      //                   ),
      //                   20.ph,
      //                   Text(
      //                   getName(allSubscriptionDto.description ?? "", allSubscriptionDto.enDescription ?? "")  ,
      //                     style: kTextMedium.copyWith(
      //                         fontSize: 14, color: kDark12),
      //                   ),
      //                   20.ph,
      //                 ],
      //               ),
      //             ),
      //             10.ph,
      //             Container(
      //               margin: 3.paddingAll + 5.paddingHoriz,
      //               padding: 10.paddingAll,
      //               decoration: Decorations.baseDecoration(
      //                   color: const Color(0xffA0BCFF)),
      //               child: Text(
      //                 allSubscriptionDto.amount == "0"? "${strings.free} ${allSubscriptionDto.period} ${strings.months} "
      //                     : "${strings.package_price} : ${allSubscriptionDto.amount} ${strings.sr} - ${strings.subscription_duration} ${allSubscriptionDto.period} ${strings.months}",
      //                 style: kTextMedium.copyWith(
      //                     color: Colors.white, fontSize: 11),
      //               ),
      //             ),
      //             customButton(
      //                 buttonText: strings.subscribe,
      //                 buttonWidth: 150 ,
      //                 buttonColor: kBlueColorE4,
      //                 buttonTextColor: Colors.white,
      //                 buttonFunc: () {
      //                   push(context,SubscriptionsDetailsScreen(allSubscriptionDto:allSubscriptionDto ,));
      //
      //                 })
      //           ],
      //         ),
      //       )
      //       .toList(),
      // ),
    );
  }
}
