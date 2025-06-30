
import 'package:google_map_marker_animation/helpers/extensions.dart';

import '../../navigation_pages_v2.dart';
import '../../src/main_index.dart';
import '../utils/navigator.dart';

abstract class BaseBlocWidget<T, B extends BlocBase<DataState>> extends BaseStatelessWidget  {
  BuildContext? context = injector<ServicesLocator>().navigatorKey.currentContext;
  late B bloc = getBloc();
  B getBloc() {
    return injector.get<B>();
  }

  BaseBlocWidget({Key? key}) : super(key: key);

  @override
  ThemeData get theme => Theme.of(context!);

  @protected
  Widget buildWidget(BuildContext context, T state);

  void buildListener(BuildContext context, dynamic state) {
    print('buildListener $state');
    if (state is LoadingStateListener) {
      showProgress();
    } else {
      dismissProgress();
    }

    if (state is FailureStateListener) {
      dismissProgress();
      onRequestFail();
      showErrorDialog(state.error, context);
    }

    if (state is SuccessStateListener) {
      dismissProgress();
      onRequestSuccess(state.data);
    }
    // if (state is SuccessStateListener) {
    //   dismissProgress();
    //   onRequestSuccess(state.data);
    // }
    if (state is SuccessListener) {
      dismissProgress();
      onSuccessDismissed();
    }
  }

  showProgress() {
    progress.show();
  }

  dismissProgress() {
    progress.dismiss();
  }

  @protected
  void loadInitialData(BuildContext context) {}

  @protected
  String? title(BuildContext context) {
    return null;
  }

  @protected
  bool? isDrawer(BuildContext context) {
    return false;
  }

  @protected
  bool? isBack(BuildContext context) {
    return true;
  }
  @protected
  bool? isBackHome(BuildContext context) {
    return true;
  }

  @protected
  bool? resizeToAvoidBottomInset(BuildContext context) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    //onBuild(bloc);
    return mainFrame(body: buildConsumer(context));
  }

  Widget mainFrame({required Widget body}) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context!),
      child: AppScaffold(
        title: title(context!),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset(context!),
        isDrawer: isDrawer(context!),
        body: body,
        leading: isBack(context!)! ? null : 0.ph,
        isHome: isBackHome(context!)??false,
      ),
    );
  }
  _onWillPop(BuildContext context) {
    print('onBackPress');
    if (Navigator.canPop(kContext)) {
      //onBackPress();
      return Future.value(true);
    } else {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }
  Widget handleUiState(DataState state, BuildContext context) {
    print('handleUiState $T == $state => ${state is T}');
    if (state is DataLoading) {
      return LoadingView();
    }
    if (state is T) {
      return buildWidget(context, state as T);
    }
    if (state is DataFailed) {
      return handleApiErrorPlaceHolder(state.error,
          onClickReload: onClickReload);
    }
    return onBuildUnInitWidget(context);
  }

  Widget onBuildUnInitWidget(BuildContext context) {
    return const Center();
  }

  Widget handleApiErrorPlaceHolder(error, {Function()? onClickReload}) {
    return ErrorPlaceHolderWidget(
      exception: error,
      onClickReload: onClickReload,
    );
  }

  void handleApiError(error,
      {required Function(String message, String code) onHandleMessage}) {
    final errorApi = injector<ServicesLocator>().navigatorKey.currentContext!.handleApiError(exception: error);
    onHandleMessage(errorApi.code.toString(), "0");
  }

  void showErrorDialog(error, BuildContext context) {
    DialogsManager.showErrorDialog(
        context, context.handleApiErrorMessage(exception: error).message,);

  }

  @protected
  onClickReload() {
    loadInitialData(context!);
  }

  void onRequestFail() {}

  void onSuccessDismissed() {}

  void onRequestSuccess(String? message) {
    print('onRequestSuccess $message');
    if (message != null && message.isNotEmpty) {
      DialogsManager.showSuccessDialog(context!, message: message, onClickOk: () {
       pop();
        onSuccessDismissed();
      });
    }
  }

  BlocConsumer buildConsumer(BuildContext context) {
    //  bloc = injector.get<B>();
    this.context = context;
    loadInitialData(context);
    streamStateInitial.setData(Args(isShow: false, isAdmin: false));
    return BlocConsumer<B, DataState>(
        bloc: bloc,
        listenWhen: (state, current) => current is DataStateFListener,
        buildWhen: (state, current) => current is DataStateFBuilder,
        builder: (context, state) => handleUiState(state, context),
        listener: (context, state) => buildListener(context, state));
  }
}