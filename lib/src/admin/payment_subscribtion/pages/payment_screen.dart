import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onservice24/core/widgets/text-field/custom_text_field.dart';
import 'package:onservice24/src/main_index.dart';

import '../../subscriptions/data/models/AddSubsriptionsPrams.dart';
import '../../subscriptions/data/models/AllSubscriptionDto.dart';
import '../../subscriptions/presentation/widgets/common_text.dart';




class PaymentScreen extends BaseStatelessWidget {
  PaymentScreen({super.key,required this.addSubsriptions,required this.allSubscriptionDto});
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 AllSubscriptionDto allSubscriptionDto;
Function(AddSubsriptionsPrams addSubsriptionsPrams)addSubsriptions;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
       child: Form(
         key: formKey,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
            70.ph,
             CommonText(allSubscriptionDto:allSubscriptionDto),
             60.ph,
             CustomTextField(
               controller: nameController,
               hintText: strings.name_of_card_holder,
             ),
             8.ph,
             CustomTextField(
               suffixIcon:  const Padding(
                 padding: EdgeInsets.all(8.0),
                 child: AppIcon(icon:AppIcons.card,),
               ) ,
               controller: cardNumberController,
               hintText: strings.card_number,
             ),
             8.ph,
             Row(
               children: [
                 Expanded(
                   child: CustomTextField(
                     controller: dateController,
                     hintText: strings.expiry_date,
                   ),
                 ),
                 10.pw,
                 Expanded(
                   child: CustomTextField(
                     controller: codeController,
                     hintText: "${strings.code} CCV",
                   ),
                 ),
               ],
             ),
             60.ph,
             const AppIcon(icon: AppIcons.payment),
             100.ph,
             PrimaryButton(
               title: strings.pay,
               margin: 10.paddingAll,
               onPressed: (){
                 DateTime now = DateTime.now() ;
                 String formattedDate =
                 DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(now);

                 addSubsriptions(AddSubsriptionsPrams(
                   id: 0,
                   serviceProviderId: 0,
                   subsriptionsMangementId: allSubscriptionDto.id,
                   createdDate: formattedDate,
                 ));
               },

             )
           ],
         ),
       ),
      ),
    );
  }


}


