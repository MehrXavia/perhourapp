import 'package:onservice24/core/components/base_widget_bloc.dart';
import '../../../../../main_index.dart';
import '../../../data/models/Favourite_dto.dart';
import '../../cubit/favourite_cubit.dart';
import 'favourite_screen.dart';

//
class FavouritePage
    extends BaseBlocWidget<DataSuccess<List<FavouriteDto>>, FavouriteCubit> {
  final bool isShowBack;
  FavouritePage({super.key, this.isShowBack = false});
  @override
  String? title(BuildContext context) {
    return strings.favourite;
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.getFavourite();
  }

  @override
  bool? isBack(BuildContext context) {
    return isShowBack;
  }

  @override
  Widget buildWidget(
      BuildContext context, DataSuccess<List<FavouriteDto>> state) {
    return RefreshIndicator(
      onRefresh: () {
        return    bloc.getFavourite();
      },
      child: FavouriteScreen(
        onDelete: (id) {
          bloc.deleteFavourite(id);
        },
        data: state.data ?? [],
        onNotifications: (int notificationsTypeId, int serviceProviderId) {
          bloc.addNotification(
              notificationsTypeId: notificationsTypeId,
              serviceProviderId: serviceProviderId);
        },
      ),
    );
  }
}
