import 'package:onservice24/src/admin/service/presentation/widget/item_service.dart';
import 'package:onservice24/src/admin/service/presentation/widget/slider_widget.dart';
import 'package:onservice24/src/main_index.dart';
import '../../data/models/GetAllService.dart';
import '../../data/models/Slider_dto.dart';

class ServiceScreen extends BaseStatelessWidget {
  final Function(GetAllService getAllService) onEditFunction;

  final Function(int id) onDelete;
  final List<GetAllService> data;
  List<SliderDto> slider;
  ServiceScreen(
      {super.key,
      required this.onDelete,
      required this.data,
      required this.onEditFunction,
      required this.slider});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.ph,
        Padding(
          padding:15.paddingAll,
          child: SliderWidget(slider: slider),
        ),
        15.ph,
        Expanded(
          child: data.isNotEmpty
              ? ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ItemService(
                        onEditFunction: onEditFunction,
                        onDelete: onDelete,
                        data: data[index],
                    );
                  },
                )
              : Center(
                  child: Text(
                  strings.no_service,
                  style: kTextMedium,
                )),
        ),
      ],
    );
  }
}
