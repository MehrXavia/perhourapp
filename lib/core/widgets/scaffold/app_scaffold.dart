import 'package:onservice24/src/main_index.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../navigation_pages_v2.dart';
import '../../utils/helper_methods.dart';
import '../../utils/navigator.dart';
import '../more_feature/more_admin.dart';
import '../more_feature/more_user.dart';

class AppScaffold extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final Widget body;
  final Widget? floatingActionButton;
  final bool? isDrawer;
  final PreferredSizeWidget? appBar;
  final Color? backgroundAppBar;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final List<Widget>? actions;
  final Widget? leading;
  final bool? resizeToAvoidBottomInset;
  final Function()? onRefresh;
  final Function()? onLoading;
  final bool? isLoading;
  final bool? isEmpty;
  final bool isRefresh;
  final bool isPagination;
  final bool isHome;
  final ScrollController? scrollController;
  final RefreshController? refreshController;
  final bool isScan;

  const AppScaffold({
    Key? key,
    this.title,
    required this.body,
    this.floatingActionButton,
    this.isDrawer = false,
    this.isScan = false,
    this.appBar,
    this.backgroundAppBar,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.actions,
    this.titleStyle,
    this.foregroundColor,
    this.leading,
    this.resizeToAvoidBottomInset,
    this.onRefresh,
    this.onLoading,
    this.isLoading,
    this.isEmpty,
    this.isRefresh = false,
    this.isPagination = false,
    this.isHome = false,
    this.scrollController,
    this.refreshController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool iskeyboardopen = MediaQuery.of(context).viewInsets.bottom > 0;
    RefreshController refreshController =
        this.refreshController ?? RefreshController(initialRefresh: false);
    ThemeData theme = Theme.of(context);
    return Scaffold(
      //resizeToAvoidBottomInset:  false,
      // extendBody: true,
      backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: floatingActionButton,
      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomNavigationBar,
      appBar: (title == null && appBar == null)
          ? null
          : appBar ??
              AppBar(
                shadowColor: kBlueColorE4,
                title: Text(title ?? '',
                    style: titleStyle ?? theme.appBarTheme.titleTextStyle),
                backgroundColor: Colors.white,
                foregroundColor:
                    foregroundColor ?? theme.appBarTheme.foregroundColor,
                actions: actions ?? [],
                elevation: 0,
                // systemOverlayStyle: SystemUiOverlayStyle(
                //   statusBarColor:
                //   Colors.white,
                //   statusBarBrightness: Brightness.dark,
                // ),
                leading: leading ??
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: context.primaryColorDark,
                      ),
                      onPressed: () async {
                        bool isAuth = await HelperMethods.isAuth();

                        if (isAuth) {
                          Navigator.pop(kContext);
                        } else {
                          if (isHome == true) {
                            pop();
                          } else {
                            Navigator.pop(kContext);
                          }
                        }
                      },
                    ),
                flexibleSpace: Container(
                  //   height: 4,
                  width: double.infinity,
                  decoration: Decorations.baseDecoration2(
                      color: Colors.white,
                      colorShadow: Colors.grey.withOpacity(.3)),
                ),
              ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          body,
          Align(
            alignment: Alignment.bottomCenter,
            child: StreamBuilder(
                initialData: Args(isShow: false, isAdmin: false),
                stream: streamStateInitial.stream,
                builder: (context, snapshot) {
                  return snapshot.data?.isShow == true
                      ? (snapshot.data?.isAdmin == true
                          ? MoreAdmin()
                          : MoreUser())
                      : const SizedBox.shrink();
                }),
          ),
        ],
      ),
      // BaseWidget(
      //    onRefresh: (isPagination || isRefresh) ? onRefresh : null,
      //    onLoading: isPagination ? ()=>onLoading!() : null,
      //    isLoading: isLoading ?? false,
      //    isEmpty: isEmpty ?? false,
      //    scrollController: scrollController,
      //    refreshController: refreshController,
      //    child: body,
      //  ),
    );
  }
}
