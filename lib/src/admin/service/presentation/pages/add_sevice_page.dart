import 'package:onservice24/core/components/base_widget_bloc.dart';
import '../../../../main_index.dart';
import '../../data/models/AllSubCategory.dart';
import '../../data/models/GetAllService.dart';
import '../cubit/service_cubit.dart';
import 'add_sevice_screen.dart';

class AddServicePage
    extends BaseBlocWidget<DataSuccess<List<AllSubCategory>>, ServiceCubit> {
  final GetAllService ?data;
  final String currency;
  final StreamStateInitial<bool> streamStateInitial;
  Function ()onRefrach;
  AddServicePage({super.key,   this.data,required this.onRefrach,required this.currency, required this.streamStateInitial});
  @override
  void loadInitialData(BuildContext context) {
    bloc.getAllSubService();
  }

  @override
  Widget buildWidget(
      BuildContext context, DataSuccess<List<AllSubCategory>> state) {
    print('state.data ${state.data}');

    return AddServiceScreen(
      currencyTr:currency ,
      data: state.data ?? [],
      getAllService: data,
        streamStateInitial: streamStateInitial,
      onAdd: (addServicePramt) {
        data==null?
        bloc.addService(addServicePramt):  bloc.editService(addServicePramt);
      },
    );
  }

  @override
  bool? isDrawer(BuildContext context) {
    return false;
  }

  @override
  void onSuccessDismissed() {
    onRefrach();
  }
  }
