import 'package:onservice24/core/components/base_widget_bloc.dart';
import 'package:onservice24/core/themes/light_theme.dart';
import 'package:onservice24/core/utils/helper_methods.dart';
import 'package:onservice24/src/admin/service/presentation/pages/sevice_screen.dart';

import '../../../../../../core/utils/navigator.dart';
import '../../../../../core/utils/check_version.dart';
import '../../../../main_index.dart';
import '../../../../shared/auth/data/models/profile_dto.dart';
import '../../data/models/GetAllService.dart';
import '../cubit/service_cubit.dart';
import 'add_sevice_page.dart';

// ignore: must_be_immutable

//List<GetService>
class ServicePage extends BaseBlocWidget<DoubleDataSuccess, ServiceCubit> {
  final bool isShowBack;

  ServicePage({super.key, this.isShowBack = false});

  @override
  String? title(BuildContext context) {
    return strings.my_services;
  }

  @override
  loadInitialData(BuildContext context) {
    bloc.loadingData();
  }

  @override
  Widget buildWidget(BuildContext context, DoubleDataSuccess state) {
    AppVersionChecker().checkVersion(context,isWillPop:true,);
    StreamStateInitial<bool> streamStateInitial = StreamStateInitial();
    bool isAdd = false;
    GetAllService? getService;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AppScaffold(
          backgroundColor: Colors.white,
          floatingActionButton: InkWell(
            onTap: () {
              isAdd = !isAdd;
              getService = null;
              streamStateInitial.setData(isAdd);
            },
            child: Container(
              height: 60,
              width: 60,
              padding: 15.paddingAll,
              decoration: Decorations.baseDecoration(
                  radius: 100,
                borderColor: primaryColor,
              ),
                child: AppIcon(icon: AppIcons.plus)),
          ),
          body: RefreshIndicator(

            onRefresh: () async {
             return  bloc.loadingData();
            },
            child: ServiceScreen(
              data: state.data1 ?? [],
              onEditFunction: (getAllService) {
                getService = getAllService;
                isAdd = !isAdd;
                streamStateInitial.setData(isAdd);
              },
              slider: state.data2,
              onDelete: (id) {
                bloc.deleteService(id);
              },
            ),
          ),
        ),
        StreamBuilder<bool>(
            initialData: false,
            stream: streamStateInitial.stream,
            builder: (context, snapshot) {
              return snapshot.data == true
                  ? Container(
                      height: 400,
                      // padding: 20.paddingHoriz,
                      decoration: Decorations.baseDecoration(
                          colorShadow: kGrayColor2, radius: 1),
                      child: AddServicePage(
                        currency: HelperMethods.translateCurrency( getService?.currency??"", context),
                        onRefrach: () {
                          loadInitialData(context);
                        },
                        streamStateInitial: streamStateInitial,
                        data: getService,
                      ),
                    )
                  : 0.ph;
            }),
      ],
    );
  }

  @override
  bool? isBack(BuildContext context) {
    print('isShowBack $isShowBack');
    return isShowBack;
  }

  @override
  void onSuccessDismissed() {
    pop();
    bloc.loadingData();
  }
}
