import '../../../../../core/resources/validation.dart';
import '../../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../../main_index.dart';

class SelectionTypeAccount extends BaseStatelessWidget {
  final bool isDisabled;
  final String? title1;
  final String? title2;
  final TextEditingController companyNameController;
  final TextEditingController registrationNoController;
  final TextEditingController nationalIdController;
  final Function(bool)? onSelectionChanged;

  SelectionTypeAccount(
      {super.key,
      this.onSelectionChanged,
      this.isDisabled = false,
      this.title1,
      this.title2,
      required this.companyNameController,
      required this.registrationNoController,
      required this.nationalIdController});

  StreamStateInitial<bool> isCompaniesStream = StreamStateInitial();

  String type = '';

  @override
  Widget build(BuildContext context) {
    type = title1 ?? strings.individuals;
    return Column(
      children: [
        StatefulBuilder(
          builder: (context, setState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildChip(
                    setState: setState,
                    title: title1 ??  strings.individuals ,
                    isCompanies: true),
                _buildChip(
                    setState: setState,
                    title: title2 ?? strings.companies,
                    isCompanies: false),
              ],
            );
          },
        ),
        10.ph,
        // if (!isDisabled)
        //   StreamBuilder<bool>(
        //       stream: isCompaniesStream.stream,
        //       initialData: true,
        //       builder: (context, snapshot) {
        //         bool isCompanies = snapshot.data!;
        //         return Row(
        //           children: [
        //             Expanded(
        //               child: isCompanies
        //                   ? CustomTextField(
        //                       hintText: strings.company_name,
        //                       controller: companyNameController,
        //                       keyboardType: TextInputType.text,
        //                       validator: (name) {
        //                         if (name!.isEmpty) {
        //                           return injector<ServicesLocator>()
        //                               .strings
        //                               .this_field_is_required;
        //                         }
        //
        //                         return null;
        //                       },
        //                     )
        //                   : CustomTextField(
        //                       hintText: strings.national_id,
        //                       controller: nationalIdController,
        //                       keyboardType: TextInputType.number,
        //                       validator: (name) {
        //                         if (name!.isEmpty) {
        //                           return injector<ServicesLocator>()
        //                               .strings
        //                               .this_field_is_required;
        //                         }
        //
        //                         if (name.length < 10) {
        //                           return strings.must_be_10_digits;
        //                         }
        //                         return null;
        //                       },
        //                     ),
        //             ),
        //             if (isCompanies) ...[
        //               10.pw,
        //               Expanded(
        //                 child: CustomTextField(
        //                   hintText: strings.commercial_register_number,
        //                   controller: registrationNoController,
        //                   keyboardType: TextInputType.number,
        //                   validator: (name) {
        //                     if (name!.isEmpty) {
        //                       return injector<ServicesLocator>()
        //                           .strings
        //                           .this_field_is_required;
        //                     }
        //                     if (name.length < 10) {
        //                       return strings.must_be_10_digits;
        //                     }
        //                     return null;
        //                   },
        //                 ),
        //               ),
        //             ]
        //           ],
        //         );
        //       }),
      ],
    );
  }

  Widget _buildChip({
    required void Function(void Function()) setState,
    // required String type,
    required String title,
    bool isCompanies = true,
  }) {
    return ChoiceChip(
      showCheckmark: false,
      label: SizedBox(
          width: 100,
          child: Text(title,
              textAlign: TextAlign.center,
              style: context!.titleLarge.copyWith(
                fontSize: 16,
                color: type == title ? context?.cardColor : null,
              ))),
      selected: type == title,
      backgroundColor: const Color(0xffCDD4D9),
      selectedColor: context!.primaryColor,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      shape: RoundedRectangleBorder(
          borderRadius: isCompanies
              ? const BorderRadiusDirectional.only(
                  topStart: Radius.circular(10),
                  bottomStart: Radius.circular(10),
                )
              : const BorderRadiusDirectional.only(
                  topEnd: Radius.circular(10),
                  bottomEnd: Radius.circular(10),
                )),
      onSelected: isDisabled
          ? (bool selected) {}
          : (bool selected) {
              isCompanies
                  ? companyNameController.clear()
                  : nationalIdController.clear();
              isCompaniesStream.setData(isCompanies);
              print('type: ${type == title}');
              type = title;
              setState(() {
                // isCompaniesStream.setData(type == title);
              });
            },
    );
  }
}
