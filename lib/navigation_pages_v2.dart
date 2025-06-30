import 'package:onservice24/core/utils/navigator.dart';
import 'package:onservice24/src/admin/notifications/presentation/pages/notifications_page.dart';
import 'package:onservice24/src/admin/service/presentation/pages/sevice_page.dart';
import 'package:onservice24/src/user/favourite/presentation/pages/favourite/favourite_page.dart';
import 'package:onservice24/src/user/service_user/presentation/user_service/pages/sevice_user_page.dart';
import 'package:share_plus/share_plus.dart';

import 'core/locationservice/locationservice.dart';
import 'core/utils/helper_methods.dart';
import 'core/widgets/base/bottom_navigator_bar_item.dart';
import 'core/widgets/bottom_bar/persistent_tab_view.dart';
import 'core/widgets/more_feature/more_admin.dart';
import 'src/main_index.dart';

StreamStateInitial<Args> streamStateInitial = StreamStateInitial();
class Args{
  final bool isShow;
  final bool isAdmin;
  Args({required this.isShow,required this.isAdmin});
}

late BuildContext kContext;

class NavigationPagesV2 extends StatelessWidget {
  NavigationPagesV2({Key? key}) : super(key: key);

  PersistentTabController _controller = PersistentTabController();
  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        FutureBuilder(
            initialData: false,
            future: HelperMethods.getRole(),
            builder: (context, snapshot) {
              bool isAdmin = (snapshot.data == '2');
              bool isAuth = snapshot.data != null && snapshot.data != '';
              print('isAuth $isAuth');
              bool isShowBack = !isAuth;
              return snapshot.connectionState == ConnectionState.waiting
                  ? const LoadingView()
                  : StatefulBuilder(builder: (context, setState) {
                      print('_controller StatefulBuilder${_controller.index}');
                      return PersistentTabView.custom(
                        injector<ServicesLocator>().appContext,
                        controller: _controller,

                        itemCount: isAuth ? 4 : 3,
                        // This is required in case of custom style! Pass the number of items for the nav bar.
                        screens: [
                          isAdmin ? ServicePage(
                            isShowBack: isShowBack,
                          ) : UserServicePage(
                            isShowBack: isShowBack,),
                          if(isAuth)
                          isAdmin ? NotificationPage(
                            isShowBack: isShowBack,) : FavouritePage(
                            isShowBack: isShowBack,),
                          NotificationPage(),
                          NotificationPage(),
                        ],
                        // confineInSafeArea: true,
                        // handleAndroidBackButtonPress: true,
                        onWillPop: (context) async {
                          return true;
                        },
                        navBarHeight: 75,
                        // confineInSafeArea: true,
                        // handleAndroidBackButtonPress: true,
                        hideNavigationBarWhenKeyboardShows: true,
                        selectedTabScreenContext: (context) {
                          kContext = context!;
                        },
                        customWidget: Stack(
                          children: [
                            CustomNavBarWidget(
                              isAdmin: isAdmin,
                              isAuth: isAuth,
                              controller: _controller,
                              // Your custom widget goes here
                              // items: _navBarsItems(),
                              selectedIndex: _controller.index,
                              onItemSelected: (index) {
                                print('onItemSelected $index');
                                if (index == 0 || index == 1) {

                                 if( Navigator.of(kContext).canPop()){
                                   Navigator.of(kContext).pop();
                                 }
                                 // setState(() {
                                    _controller.jumpToTab(index);
                               //   });
                                  streamStateInitial.setData(Args(isShow: false,isAdmin: isAdmin));
                                } else if (index == 2) {
                                  Share.share(
                                      ' android URL \n  https://play.google.com/store/apps/details?id=com.perHourApp.app \n'
                                         // ' IOS Url \n https://example.com ',
                                  );
                                } else if (index == 3) {
                                  // DialogsManager.showAlertDialog(
                                  //   context,
                                  //   MoreAdmin(),
                                  // );
                                  bool isShow = !(streamStateInitial.data?.isShow ?? false);

                                  print(isShow);
                                  print("jjhjjhjh");
                                  streamStateInitial.setData(Args(isShow: isShow, isAdmin: isAdmin));
                                }
                                print('_controller ${_controller.index}');

                              },
                            ),
                          ],
                        ),
                        routeAndNavigatorSettings:
                            CustomWidgetRouteAndNavigatorSettings(
                          routes: Routes.routes,
                          initialRoute: Routes.navigationPages,
                        ),
                      );
                    });
            }),
        // StreamBuilder(
        //   initialData: true,
        //   stream: _streamStateInitial.stream,
        //   builder: (context, snapshot) {
        //     return snapshot.data == true ?
        //       MoreAdmin() : SizedBox.shrink();
        //   }
        // ),
      ],
    );
  }
}

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final bool isAdmin;
  final bool isAuth;
  final PersistentTabController controller;
  final ValueChanged<int> onItemSelected;

  CustomNavBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.controller,
    required this.isAdmin,
    required this.isAuth,
  });

  int index = 0;

  @override
  Widget build(
    BuildContext context,
  ) {
    final strings = AppLocalizations.of(context)!;
    StreamStateInitial<int> streamStateInitial = StreamStateInitial();
    index = selectedIndex;
    // controller.addListener(() {
    //   index = controller.index;
    //   streamStateInitial.setData(index);
    // });
    return Material(
      child: StatefulBuilder(builder: (context, setState) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: Decorations.shapeTopShadow(
            color: context.scaffoldBackgroundColor,
            colorShadow: context.disabledColor,
            radius: 0,
          ),
          child: StreamBuilder<int>(
            initialData: 0,
            stream: streamStateInitial.stream,
            builder: (context, snapshot) {
              // int index = snapshot.data ?? 0;
              print('index $index');
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavigatorBarItem(
                    icon: AppIcons.services,
                    label: strings.services,
                    color: getColor(context, 0),
                    onTap: () {
                      onItemSelected(0);
                      streamStateInitial.setData(0);
                      index = 0;
                    },
                  ),
                  if (isAuth)
                  BottomNavigatorBarItem(
                    icon: isAdmin ? AppIcons.notification : AppIcons.favorite,
                    label: isAdmin ? strings.notifications : strings.favourite,
                    color: getColor(context, 1),
                    onTap: () {
                      onItemSelected(1);
                      streamStateInitial.setData(1);
                      index = 1;
                    },
                  ),
                  BottomNavigatorBarItem(
                    icon: AppIcons.share,
                    label: strings.share,
                    color: getColor(context, 2),
                    onTap: () {
                      onItemSelected(2);
                      streamStateInitial.setData(2);
                      index = 2;
                    },
                  ),
                  BottomNavigatorBarItem(
                    icon: AppIcons.more_vert,
                    label: strings.more,
                    color: getColor(context, 3),
                    onTap: () {
                      onItemSelected(3);
                      streamStateInitial.setData(3);
                      index = 3;
                    },
                  ),
                ],
              );
            }
          ),
        );
      }),
    );
  }

  getColor(BuildContext context, int value) {
    ThemeData theme = Theme.of(context);
    if (index == value) {
      return theme.primaryColor;
    } else {
      return context.bodyLarge.color;
    }
  }
}
