import 'dart:async';

import 'package:injectable/injectable.dart';

import '../data_source/all_subscription_datasource.dart';
import '../models/AddSubsriptionsPrams.dart';
import '../models/AllSubscriptionDto.dart';
import '../models/Subscription_dto.dart';

@injectable
class SubscriptionRepository {
  final AllSubscriptionDataSource _api;

  SubscriptionRepository(this._api);

  Future<List<AllSubscriptionDto>> fetchGetAllSubscription() async {
    final response = await _api.fetchGetAllSubscription();

    return response.data ?? [];
  }

  Future<String> addSubscription(
      {required AddSubsriptionsPrams addSubscriptionsPrams}) async {
    final response = await _api.addSubscription(addSubscriptionsPrams);
    return response.message();
  }

  Future<List<SubscriptionDto>> fetchSubscription(
      {required int serviceProviderId}) async {
    final response = await _api.fetchSubscription(serviceProviderId);

    return response.data!;
  }
}
