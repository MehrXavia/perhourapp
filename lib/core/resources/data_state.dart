

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../src/admin/service/data/models/Slider_dto.dart';
import '../../src/user/service_user/data/models/ServiceUserDto.dart';

abstract class DataState<T> {
  final T ? data;
  final dynamic error;

  const DataState({this.data, this.error});
}

class UnInitState extends DataState {}

class DataSuccessDouble<T> extends DataStateFBuilder<T> {
  T data1;
  T data2;

  DataSuccessDouble({
    required this.data1,
    required this.data2,
  });
}
/**
 * this state for observe state with bloc listeners
 **/
abstract class DataStateFListener<T> extends DataState<T> {
  const DataStateFListener({data, error}):super(data: data,error: error);
}

class LoadingStateListener extends DataStateFListener {}

class FailureStateListener extends DataStateFListener {
  FailureStateListener(error):super(error: error);
}

class SuccessStateListener<T> extends DataStateFListener<T> {
  SuccessStateListener(data):super(data: data);
}
class SuccessListener<T> extends DataStateFListener<T> {
  final T data;
  SuccessListener(this.data):super(data: data);
}



/**
 * this state for observe state with bloc builder
 **/

abstract class DataStateFBuilder<T> extends DataState<T> {
  const DataStateFBuilder({data, error}):super(data: data,error: error);
}

class DataFailed<T> extends DataStateFBuilder<T> {
  const DataFailed(error) : super(error: error);
}

class DataSuccess<T> extends DataStateFBuilder<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataLoading extends DataStateFBuilder {}



class DoubleDataSuccess<T> extends DataStateFBuilder<T> {
  T data1;
  T data2;

  DoubleDataSuccess({
    required this.data1,
    required this.data2,
  });
}



class HomeUserData  extends DataStateFBuilder  {
  List<SliderDto> sliderData;
  List<ServiceUserDto> serviceData;
  LatLng latlng;
  String countryCode;

  HomeUserData({
    required this.sliderData,
    required this.serviceData,
    required this.latlng,
    required this.countryCode,
  });
}