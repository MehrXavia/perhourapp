import 'package:onservice24/src/admin/subscriptions/presentation/widgets/content.dart';
import 'package:onservice24/src/admin/subscriptions/presentation/widgets/subscriptions_slider_widget.dart';
import 'package:onservice24/src/main_index.dart';

import '../../data/models/AddSubsriptionsPrams.dart';
import '../../data/models/AllSubscriptionDto.dart';
import '../../data/models/Subscription_dto.dart';

class SubscriptionsScreen extends BaseStatelessWidget {
  SubscriptionsScreen(
      {required this.data2,
      required this.data1,
      required this.addSubsriptions,
      super.key});
  final List<AllSubscriptionDto> data1;
  final List<SubscriptionDto> data2;
  final Function(AddSubsriptionsPrams addSubsriptionsPrams) addSubsriptions;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            30.ph,
            data2.isNotEmpty
                ? SizedBox(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data2.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ContentBody(
                            subscriptionDto: data2[index],
                          );
                        }),
                  )
                : Container(
                    width: double.infinity,
                    height: 150,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xffd5d6d7),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xffd5d6d7).withOpacity(.3),
                          blurRadius: 3,
                          offset: const Offset(1, 1),
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: Text("اشتراكاتك فارغة",
                        style: kTextBold.copyWith(
                          fontSize: 25,
                          color: const Color(0xff8B8B8B),
                        ))),
            50.ph,
            SubscriptionsSliderWidget(
                allSubscriptionDto: data1, addSubsriptions: addSubsriptions),
          ],
        ),
      ),
    );
  }
}
