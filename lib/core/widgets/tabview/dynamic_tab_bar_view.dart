import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onservice24/core/exceptions/extensions.dart';
import 'package:onservice24/core/themes/colors.dart';
import 'package:onservice24/core/themes/light_theme.dart';

import '../../assets/app_icons.dart';
import '../../decorations/decorations.dart';
import '../../di/injector.dart';
import '../../themes/text_styles.dart';
import '../buttons/app_icon.dart';

class DynamicTabBarView extends StatefulWidget {
  final int? initialIndex;
  final List<DynamicItem> tabs;
  final List<Widget>? children;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? marginTabs;
  final bool? isSeparate;
  final Widget? pageWidget;
  final Function(int)? onTap;

  DynamicTabBarView(
      {Key? key,
      required this.tabs,
      this.children,
      this.margin,
      this.isSeparate = false,
      this.padding,
      this.marginTabs,
      this.pageWidget,
      this.onTap,
      this.initialIndex})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _DynamicTabBarViewState();
  }
}

class _DynamicTabBarViewState extends State<DynamicTabBarView>
    with TickerProviderStateMixin {
  final strings =
      injector<ServicesLocator>().navigatorKey.currentContext!.strings;
  int indexTap=1;
  @override
  Widget build(BuildContext context) {
    final tabController = TabController(
        length: widget.tabs.length,
        vsync: this,
        initialIndex: widget.initialIndex ?? 0);

    return Padding(
      padding: widget.padding ?? 20.paddingHoriz + 10.paddingVert,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              // clipBehavior: Clip.hardEdge,
              margin: widget.marginTabs,
              // padding: 20.paddingHoriz,
              width: 150,
              decoration: widget.isSeparate!
                  ? Decorations.decorationTabs
                  : Decorations.decorationTabsOnlyTop(),
              child: PreferredSize(
                  preferredSize: const Size.fromHeight(150.0),
                  child: TabBar(
                      labelStyle: kTextBodyBold.copyWith(
                        color: kPrimaryLight,
                        fontSize: 10,
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: tabController,
                      indicator: Decorations.decorationIndicator,
                      indicatorColor: kPrimaryLight,
                      labelColor: kPrimaryLight,
                      padding: EdgeInsets.zero,
                      //isScrollable: true,
                      indicatorPadding: EdgeInsets.zero,
                      unselectedLabelColor: kBlueColorE4,

                      labelPadding: 5.paddingHoriz,
                      //labelPadding: 10.paddingHoriz,
                      onTap: (idTap) {
                        tabController.index == idTap;
                        indexTap=idTap;
                        print(tabController.index);
                        print("jkjkjkjkjk");
                        if (widget.onTap != null) {
                          widget.onTap!(widget.tabs[idTap].id);
                        }

                      },
                      tabs: [
                        Tab(
                          height: 67,
                          child: Container(
                            height: 67,
                            width: double.infinity,
                            decoration: Decorations.kDecorationBorderRadius(borderColor: primaryColor),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //AppIcon(icon:  AppIcons.admin1 , size: 30,color:indexTap ==3? Colors.white:kBlueColorE4, ),
                                const Icon(Icons.support_agent_sharp, size: 25),
                                Text(
                                  strings.app_management,
                                ),
                              ],
                            ),
                          ),
                        ),
                       Tab(
                          height: 67,
                          child: Container(
                            height: 67,
                            width: double.infinity,
                            decoration: Decorations.kDecorationBorderRadius(borderColor: primaryColor),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(Icons.person_outline_sharp, size: 30),
                                Text(
                                  strings.profile,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Tab(
                          height: 67,
                          // icon:
                          //     const Icon(Icons.local_phone_outlined, size: 30),
                          // iconMargin: 10.paddingHoriz,
                          // text: strings.telecom,
                          child: Container(
                            height: 67,
                            width: double.infinity,
                            decoration: Decorations.kDecorationBorderRadius(borderColor: primaryColor),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(Icons.phone, size: 30),
                                Text(
                                  strings.telecom,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Tab(
                          height: 67,

                          child: Container(
                            height: 67,
                            width: double.infinity,
                            decoration: Decorations.kDecorationBorderRadius(borderColor: primaryColor),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(FontAwesomeIcons.whatsapp, size: 30),
                                Text(
                                  strings.whatsapp,
                                ),
                              ],
                            ),
                          ),
                        ),

                      ])),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: widget.pageWidget ??
                  TabBarView(
                      controller: tabController,
                      children: widget.children
                              ?.map(
                                (e) => e,
                              )
                              .toList() ??
                          []),
            )
          ]),
    );
  }
}

class DynamicItem {
  DynamicItem({
    required this.id,
    required this.name,
    required this.icon,
  });

  int id;
  String name;
  String icon;
}
