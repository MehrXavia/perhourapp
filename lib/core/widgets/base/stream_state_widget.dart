import 'package:flutter/cupertino.dart';

import '../../../src/main_index.dart';
import '../../exceptions/empty_list_exception.dart';


class StreamStateWidget<T> extends BaseStatelessWidget {
  final Widget Function(BuildContext context, T data) builder;
  final StreamState<T> stream;
  final Function()? onReload;
  final bool isBottomSheetData;

  StreamStateWidget({
    super.key,
    required this.builder,
    required this.stream,
    this.onReload,
    this.isBottomSheetData = false,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
        stream: stream.stream,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return builder(context, snapshot.data as T);
          } else if (snapshot.error != null) {
            return ErrorPlaceHolderWidget(
              exception: snapshot.error ?? EmptyListException(),
              onClickReload: onReload,
            );
          }
          return LoadingView();
        });
  }
}
