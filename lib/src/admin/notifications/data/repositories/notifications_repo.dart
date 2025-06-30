import 'dart:async';

import 'package:injectable/injectable.dart';

import '../data_sources/notifications_datasource.dart';

import '../models/NotificationsDto.dart';

@injectable
class NotificationsRepository {
  final NotificationsDataSource _api;

  NotificationsRepository(this._api);

  Future<List<NotificationsDto>> fetchGetNotifications(
      {required int serviceProviderId, required int ContactType}) async {
    final response =
        await _api.fetchGetNotifications(serviceProviderId, ContactType);

    return response.data!;
  }
}
