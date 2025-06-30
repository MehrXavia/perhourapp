import 'package:country_picker/country_picker.dart';
import 'package:onservice24/core/widgets/drop_down/drop_down.dart';

import '../../../../../core/resources/validation.dart';
import '../../../../../core/widgets/text-field/text_field_surfix.dart';
import '../../../../main_index.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController phoneNumberController;
  final Function(String)? onPhoneChanged;
  String? Function(String?)? validator;

    PhoneTextField(
      {super.key, required this.phoneNumberController, this.onPhoneChanged,this.validator});

  @override
  Widget build(BuildContext context) {
    // phoneNumberController.text = '+966';
    StreamStateInitial<Country> countryStream = StreamStateInitial();
    return StreamBuilder<Country>(
        stream: countryStream.stream,
        initialData: CountryService().getAll().firstWhereOrNull((element) => element.phoneCode == '92'),
        builder: (context, snapshot) {
          return TextFieldSuffix(
            hintText: context.strings.phone_number ,
            // hintText: snapshot.data?.phoneCode,
            controller: phoneNumberController,
            keyboardType: TextInputType.number,
            suffixOutText: '+${snapshot.data?.phoneCode}',
            suffixInText: countryCodeToEmoji(snapshot.data?.countryCode ?? ''),
            suffixIcon: AppIcons.arrow_down,
            // inputFormatters: [
            //   FilteringTextInputFormatter.digitsOnly,
            // ],
            contentPadding: 10.paddingStart,
            // suffixWidget: Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Text(
            //       '${snapshot.data?.phoneCode}+',
            //       style: context.displaySmall,
            //     ),
            //     5.pw,
            //     Container(
            //       clipBehavior: Clip.hardEdge,
            //       width: 65,
            //       padding: 10.paddingStart,
            //       decoration: BoxDecoration(
            //         // color: Colors.red,
            //         borderRadius: const BorderRadiusDirectional.only(
            //           // topStart: Radius.circular(12),
            //           // bottomStart: Radius.circular(12),
            //           bottomEnd: Radius.circular(15),
            //           topEnd: Radius.circular(15),
            //         ),
            //         // border only for bottom
            //         // border: BorderDirectional(
            //         //   start: BorderSide(
            //         //     color: context.dividerColor,
            //         //     width: 1,
            //         //   ),
            //         // ),
            //         border: Border.all(
            //           color: context.dividerColor,
            //           width: 1,
            //         ),
            //         // color: context.colorScheme.background,
            //       ),
            //       child: DropDownField(
            //         radius: 0,
            //         width: 200,
            //         borderColor: Colors.transparent,
            //         // contentPadding: 20.paddingBottom,
            //         fontSize: 20,
            //         // hint: countryCodeToEmoji('SA'),
            //         value: '966',
            //         items: CountryService()
            //             .getAll()
            //             .map((e) => DropDownItem(
            //                 id: e.phoneCode.toString(),
            //                 title: '${countryCodeToEmoji(e.countryCode ?? '')} ${e.name}',
            //                 value: e.countryCode,
            //         ))
            //             .toList(),
            //
            //         onChanged: (value) {
            //           // print('Select country: ${CountryService()
            //           //     .getAll()?.first.e164Key}');
            //           // print('Select country: ${CountryService()
            //           //     .getAll()?.first.e164Sc}');
            //           // print('Select country: ${CountryService()
            //           //     .getAll()?.first.countryCode}');
            //           // print('Select country: ${CountryService()
            //           //     .getAll()?.first.name}');
            //
            //           print('Select title: ${value?.title}');
            //           print('Select value: ${value?.value}');
            //           print('Select id: ${value?.id}');
            //           print('Select country: ${ CountryService().getAll().first.toJson()}');
            //           Country country = CountryService().getAll().firstWhereOrNull((element) => element.countryCode == value?.value);
            //           // phoneNumberController.text = '${country.phoneCode}+';
            //           onPhoneChanged!('+${country.phoneCode}');
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            validator: validator,
            onTap: () {
              showCountryPicker(
                context: context,
                showPhoneCode: true,
                // optional. Shows phone code before the country name.
                countryListTheme: CountryListThemeData(
                  flagSize: 30,
                  backgroundColor: context.colorScheme.background,
                  textStyle: context.textTheme.bodyMedium,
                  bottomSheetHeight: 400,
                ),
                onSelect: (Country country) {
                  print('Select country: ${country.toJson()}');
                  countryStream.setData(country);
                  onPhoneChanged!('+${country.phoneCode}');
                },
              );
            },
          );
        });
  }

  static String countryCodeToEmoji(String countryCode) {
    if (countryCode.isEmpty) return '';
    // 0x41 is Letter A
    // 0x1F1E6 is Regional Indicator Symbol Letter A
    // Example :
    // firstLetter U => 20 + 0x1F1E6
    // secondLetter S => 18 + 0x1F1E6
    // See: https://en.wikipedia.org/wiki/Regional_Indicator_Symbol
    final int firstLetter = countryCode.codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = countryCode.codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }
}
