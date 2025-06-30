import 'package:onservice24/core/widgets/buttons/custom_button.dart';
import 'package:onservice24/src/main_index.dart';
 import '../../../../../core/widgets/text-field/custom_text_field.dart';
import '../../data/models/AllSubCategory.dart';
import '../../data/models/GetAllService.dart';
import '../../data/models/add_service_pramt.dart';

class AddServiceScreen extends BaseStatelessWidget {
  final GetAllService? getAllService;
  var descriptionController = TextEditingController();
  var experienceController = TextEditingController();
  var priceController = TextEditingController();
  ScrollController controller = ScrollController();

  Function(AddServicePramt) onAdd;
  final List<AllSubCategory> data;
  final StreamStateInitial<bool> streamStateInitial;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StreamStateInitial<List<AllSubCategory>> dataStram = StreamStateInitial();
final String currencyTr;
  AddServiceScreen(
      {super.key,
      required this.onAdd,
      required this.currencyTr,
      //required this.idServiceProvider,
      required this.streamStateInitial,
      required this.getAllService,
      required this.data});

  int? id;
  String? currency;


  @override
  Widget build(BuildContext context) {
    id = int.parse(getAllService?.service?.id.toString() ?? '${data[0].id}');
    descriptionController =
        TextEditingController(text: getAllService?.description ?? "");
    experienceController =
        TextEditingController(text: getAllService?.experience.toString() ?? "");
    priceController =
        TextEditingController(text: getAllService?.price.toString() ?? '');
    currency =  translateCurrency( getAllService?.currency??"");
    return SingleChildScrollView(
      padding: 10.paddingHoriz,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Stack(
                children: [
                  //  Container(),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        getAllService != null
                            ? strings.service_modification
                            : strings.add_a_service,
                        style: kTextBold,
                      )),
                  PositionedDirectional(
                    end: 0,
                    top: 0,
                    child: IconButton(
                        onPressed: () {
                          streamStateInitial.setData(false);
                        },
                        icon: const CircleAvatar(
                          radius: 16,
                          backgroundColor: kBlueColorE4,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.close,
                              color: kBlueColorE4,
                              size: 16,
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: 60.paddingHoriz + 15.paddingBottom,
              child: const Divider(
                height: 2,
                color: Color(0xffE2E2E2),
              ),
            ),
            Container(
              // margin: 20.paddingHoriz,
              decoration: Decorations.baseDecoration(),
              child: Column(
                children: [
                  3.ph,
                  CustomTextFieldWithoutBorder(
                    hintText: strings.search_by_service_name,
                    padding: EdgeInsets.zero,
                    radius: 3,
                    onChanged: (value) {
                      final newData = data;
                      final filterList =
                          newData.cast<AllSubCategory>().where((element) {
                        return getName(
                                element.arName ?? '', element.enName ?? '')
                            .toString()
                            .toLowerCase()
                            .contains(value.toLowerCase());
                      }).toList();
                      if (filterList.isNotEmpty) dataStram.setData(data);
                      dataStram.setData(filterList);
                    },
                  ),
                  const Divider(
                    color: Color(0xffCDD4D9),
                  ),
                  StreamBuilder<List<AllSubCategory>>(
                      stream: dataStram.stream,
                      initialData: data,
                      builder: (context, snapshot) {
                        int initialItem = 0;
                        if (getAllService != null) {
                          for (int i = 0; i < snapshot.data!.length; i++) {
                            if (snapshot.data![i].id ==
                                getAllService?.service?.id) {
                              initialItem = i;
                              break;
                            }
                          }
                        }
                        return SizedBox(
                          height: 120,
                          child: ListWheelScrollView(
                            itemExtent: 30,
                            diameterRatio: .8,
                            useMagnifier: true,
                            magnification: 1.3,
                            controller: FixedExtentScrollController(
                                initialItem: initialItem),
                            onSelectedItemChanged: (index) {
                              id = snapshot.data![index].id!;
                              print(id);
                              print("jknvdlkx");
                            },
                            children: snapshot.data!
                                .map((e) => Text(
                                      getName(
                                            e.arName ?? '',
                                            e.enName ?? '',
                                          ) ??
                                          '',
                                      style: kTextSemiBold.copyWith(
                                          fontSize: 10,
                                          color: Colors.black,
                                          overflow: TextOverflow.ellipsis),
                                    ))
                                .toList(),
                          ),
                        );
                      }),
                ],
              ),
            ),
            20.ph,
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: strings.enter_service_details,
                    controller: descriptionController,
                    maxLines: 4,
                  ),
                ),
                10.pw,
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      StatefulBuilder(builder: (context, setState) {
                        return CustomTextField(
                          hintText: strings.hour_price,
                          controller: priceController,
                          keyboardType: TextInputType.number,

                          suffixIcon: InkWell(
                            onTap: () {
                              showAppModalBottomSheet(
                                  sized: const SizedBox(),
                                  isScrollControlled: false,
                                  title: strings.select,
                                  context: context,
                                  child: SizedBox(
                                    height: 300,
                                    child: ListView.builder(
                                      itemCount: currencies.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                            onTap: () {
                                              setState(() {
                                                currency = getName(
                                                    currencies[index]
                                                            .currencyAr ??
                                                        "",
                                                    currencies[index]
                                                            .currencyEn ??
                                                        "");
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: Padding(
                                              padding: 10.paddingVert,
                                              child: Text(
                                                getName(
                                                    currencies[index]
                                                            .currencyAr ??
                                                        "",
                                                    currencies[index]
                                                            .currencyEn ??
                                                        ""),
                                                style: kTextSemiBold.copyWith(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ));
                                      },
                                    ),
                                  ));
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 8,
                                  height: 50,
                                  child: VerticalDivider(
                                    color: context.dividerColor,
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding: 2.paddingHoriz+1.paddingEnd,
                                  child: SizedBox(
                                    width:MediaQuery.of(context).size.height *0.05,
                                    child: Text(
                                      currency!,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: context.displaySmall.copyWith(
                                          color: const Color(0xff121212),
                                          fontSize: 10),
                                    ),
                                  ),
                                ),
                                const Icon(Icons.keyboard_arrow_down_rounded,        color: Color(0xff121212), size: 17,)
                              ],
                            ),
                          ),

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return context.strings.this_field_is_required;
                            } else if (int.parse(value) > 1000) {
                              return strings.watch_price_validate;
                            }
                            return null;
                          },
                        );
                      }),
                      14.ph,
                      CustomTextField(
                        hintText: strings.years_of_experience,
                        keyboardType: TextInputType.number,
                        controller: experienceController,
                        suffixText: strings.year,
                          suffixTextSize:11,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return context.strings.this_field_is_required;
                          } else if (int.parse(value) > 40) {
                            return strings.experience_validate;
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            5.ph,
            SizedBox(
              width: 200,
              child: customButton(
                  buttonText: strings.addition,
                  buttonColor: kBlueColorE4,
                  buttonTextColor: Colors.white,
                  buttonFunc: () {
                    if (formKey.currentState!.validate()) {
                      onAdd(AddServicePramt(
                          id: getAllService == null
                              ? 0
                              : int.parse(getAllService!.id.toString()),
                          description: descriptionController.text,
                          experience: int.parse(experienceController.text),
                          price: int.parse(priceController.text),
                          serviceId: id,
                          currency: currency
                          //serviceProviderId: idServiceProvider
                          ));
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }


}
