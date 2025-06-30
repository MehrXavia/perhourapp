import 'package:flutter/material.dart';
import 'package:onservice24/src/main_index.dart';
import 'package:onservice24/src/user/favourite/presentation/pages/favourite/widgets/favourite_body.dart';

import '../../../data/models/Favourite_dto.dart';

class FavouriteScreen extends BaseStatelessWidget {
  FavouriteScreen( {super.key,required this.onNotifications, required this.data, required this.onDelete});
  final Function(int id) onDelete;
  final List<FavouriteDto> data;
  final Function(int notificationsTypeId, int serviceProviderId)onNotifications;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return FavouriteItem(
            favouriteDto: data[index],
            onNotifications: onNotifications,
            onDelete: onDelete,
          );
        });
  }
}
