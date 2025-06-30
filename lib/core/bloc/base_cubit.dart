
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../exceptions/empty_list_exception.dart';
import '../resources/data_state.dart';

abstract class BaseCubit extends Cubit<DataState>{
  BaseCubit() : super(UnInitState());

  executeSuccess<T>(Future<T> Function() invoke,{Function (dynamic) ? onSuccess}) async {
    try {
      // || (response is AboutUs &&  response.description!.isEmpty)
      emit(DataLoading());
      final response = await invoke();
      onSuccess?.call(response);
      if(response == null || response is List && response.isEmpty || response is Map && response.isEmpty || response is String && response.isEmpty ){
        print('invoke $response');
        throw EmptyListException();
      } else {
        print('response  sscc $response');
        emit(DataSuccess<T>(response));
      }
    } catch (e) {
      emit(DataFailed(e));
      rethrow;
    }
  }

  executeDoubleSuccess<T>(Future<T> Function() invoke1, Future<T> Function() invoke2,
      {Function()? onSuccess}) async {
    try {
      emit(DataLoading());

      final response1 = await invoke1();
      final response2 = await invoke2();
      onSuccess?.call();
      emit(DoubleDataSuccess(data1: response1, data2: response2));
    } catch (e) {
      emit(DataFailed(e));
      rethrow;
    }
  }
  Future<T> executeReturn<T>(Future<T> Function() invoke, {bool isRefresh = true}) async {
    try {
      if(isRefresh){
        emit(DataLoading());
      }
      return await invoke();
    } catch (e) {
      emit(DataFailed(e));
      rethrow;
    }
  }
  executeBuilder<T>(Future<T> Function() invoke,
      {bool isRefresh = true, required ValueChanged<T> onSuccess , ValueChanged ? onError}) async {
    try {
      //|| (response is AboutUs &&  response.description!.isEmpty)
      if(isRefresh){
        emit(DataLoading());
      }
      final response = await invoke();
      if(response == null || ( isRefresh ? (response is List && response.isEmpty) : false) || response is Map && response.isEmpty || response is String && response.isEmpty ){
        print('invoke $response');
        throw EmptyListException();
      } else {
        print('response  sscc $response');
        onSuccess(response);
      }
    } catch (e) {
      if(onError!=null){
        onError(e);
      }else {
        emit(DataFailed(e));
      }
      rethrow;
    }
  }
  executeListener<T>(Future<T> Function() invoke,
      {required ValueChanged<T> onSuccess}) async {
    try {
      emit(LoadingStateListener());
      final response = await invoke();
      onSuccess(response);
    } catch (e) {
      print('executeListener $e');
      emit(FailureStateListener(e));
      rethrow;
    }
  }

  executeEmitterListener(Future Function() invoke, {ValueChanged? onSuccess}) {
    executeListener(() => invoke(), onSuccess: (v) {
      print('executeEmitterListener $v');
      emit((SuccessStateListener<String>(v.toString())));
      if(onSuccess!=null){
        onSuccess(v);
      }
    });
  }

  executeEmitterSuccess(Future Function() invoke) {
    executeListener(() => invoke(), onSuccess: (v) {
      emit(SuccessListener(v));
    });
  }
}