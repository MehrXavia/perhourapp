import '../../../src/main_index.dart';

class TabItemModel {
  final String label;

  final Widget page;

  TabItemModel({required this.label, required this.page});

  Tab builder() {
    return TabWidgetItemBuilder(this);
  }
}

class TabWidgetItemBuilder extends Tab {
  TabWidgetItemBuilder(TabItemModel model, {Key? key})
      : super(key: key, text: model.label);
}

class TabBarWidget extends StatelessWidget {
  final List<TabItemModel> tabs;
  final Color? backgroundColor;
  final List<Widget>? tabsText;
  final void Function(int)? onTap;
  final EdgeInsetsGeometry? paddingTabs;
  final double? height;
  const TabBarWidget({Key? key, required this.tabs, this.backgroundColor, this.tabsText, this.onTap, this.paddingTabs, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return  DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height ?? 55),
          child: AppBar(
            backgroundColor: theme.scaffoldBackgroundColor,
            leading: const SizedBox(),
            flexibleSpace: Container(
              margin: paddingTabs ?? 12.paddingHoriz + 10.paddingTop,
              decoration: Decorations.shapeDecorationShadow(colorShadow: context.outline, color: context.dividerColor),
              child: TabBar(
          //      controller: _tabController,
                indicatorColor: theme.cardColor,
                unselectedLabelStyle: theme.textTheme.bodyLarge,
                labelStyle: theme.textTheme.titleMedium!.copyWith(fontSize: 18),
                labelColor: theme.primaryColorDark,
              //  unselectedLabelColor: primaryColorLight,
              //  labelPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              //  indicatorPadding: 00..0.ngHoriz,
            //    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                indicator: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                onTap: onTap,
                tabs: tabs.map((e) => e.builder()).toList(),
              ),
            ),
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: tabs.map((e) => e.page).toList(),
        ),
      ),
    );
  }
}
