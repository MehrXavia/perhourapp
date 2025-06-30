import 'package:flutter/material.dart';
import 'package:onservice24/core/themes/colors.dart';

import '../../commen/common_state.dart';
import '../../components/base_stateless_widget.dart';
import '../../themes/text_styles.dart';
import '../helper/helper_widgets.dart';
import 'bottom_sheet_text_field_rectangle.dart';

class ListPickerWidget extends BaseStatelessWidget {
  static showPicker({
    required BuildContext context,
    bool? setSearch,
    required String title,
    required List<Item> items,
    final Widget Function(BuildContext context, Item item)? itemBuilder,
    searchHint,
    bool isScrollControlled = true,
    Function(Item position)? onSelectItem,
    final bool? isMultiChoice,
    final Function(List<CheckboxItem>)? onMultiSelectItem,
    final List<CheckboxItem>? itemsSelected,
    final bool isSelectAll = false,
    final bool isSelectAllCheckBox = false,
  }) {
    showAppModalBottomSheet(
        context: context,
        isScrollControlled: isScrollControlled,
        child: ListPickerWidget(
          items: items,
          onSelectItem: onSelectItem,
          searchHint: searchHint,
          itemBuilder: itemBuilder,
          setSearch: setSearch,
          isMultiChoice: isMultiChoice,
          onMultiSelectItem: onMultiSelectItem,
          itemsSelected: itemsSelected,
          isSelectAll: isSelectAll,
          isSelectAllCheckBox: isSelectAllCheckBox,
        ),

        );
  }

  final List<Item> items;
  final Function(Item position)? onSelectItem;
  final bool? isMultiChoice;
  final Function(List<CheckboxItem>)? onMultiSelectItem;
  final List<CheckboxItem>? itemsSelected;
  final String? searchHint;
  final bool? setSearch;
  final Widget Function(BuildContext context, Item item)? itemBuilder;
  final bool isSelectAll;
  final bool isSelectAllCheckBox;

  StreamState<List<Item>> searchStream = StreamStateInitial();
  //List<Item> _items;

  ListPickerWidget({
    Key? key,
    this.setSearch,
    required this.items,
    this.itemBuilder,
    this.onSelectItem,
    this.isMultiChoice,
    this.onMultiSelectItem,
    this.itemsSelected,
    this.searchHint,
    this.isSelectAll = false,
    this.isSelectAllCheckBox = false,
  }) : super(key: key);
  findCityByName(String text) {
    final filter = items
        .where((element) =>
            element.value.toLowerCase().contains(text.toLowerCase()) == true)
        .toList();
    searchStream.setData(filter);
  }

  List<CheckboxItem> itemsSelect = [];
  @override
  Widget build(BuildContext context) {
    print('itemsSelectascas: ${itemsSelect.length}');
    itemsSelect = itemsSelected ?? [];
    // if(isSelectAll){
    //   selectAllAction();
    // }
    return Container(
      height: 365,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          setSearch == true
              ? buildSearchWidget(
                  onChange: (String text) {
                    findCityByName(text);
                  },
                  hint: searchHint ?? strings.search)
              : Container(),
          Expanded(
            child: StreamBuilder<List<Item>>(
                stream: searchStream.stream,
                initialData: items,
                builder: (context, snapshot) {
                  final data = snapshot.requireData;
                  return ListView.builder(
                      itemCount: data.length,
                      addAutomaticKeepAlives: true,
                      // padding: EdgeInsets.only(top: 10),
                      itemBuilder: (_, position) {
                        final item = data[position];
                        if (itemBuilder != null) {
                          return TextButton(
                            onPressed: () {
                              print(
                                  'position field ${position} ${data[position]}');
                              onSelectItem!(item);
                              Navigator.pop(context);
                            },
                            child: itemBuilder!(context, item),
                            style: ButtonStyle(
                              alignment: AlignmentDirectional
                                  .centerStart, // <-- had to set alignment
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                EdgeInsets.zero, // <-- had to set padding to zero
                              ),
                            ),
                          );
                        }
                        return Container(
                          alignment: AlignmentDirectional.centerStart,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                onPressed: () {
                                  onSelectItem!(item);
                                  Navigator.pop(context);
                                },
                                style: ButtonStyle(
                                  alignment: AlignmentDirectional
                                      .centerStart, // <-- had to set alignment
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    EdgeInsets
                                        .zero, // <-- had to set padding to zero
                                  ),
                                ),
                                child: Text(
                                  item.value,
                                  textAlign: TextAlign.start,
                                  style: kTextRegular.copyWith(
                                      fontSize: 12,
                                      decoration: TextDecoration.none),
                                ),
                              ),

                            ],
                          ),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }

  StreamStateInitial<bool> isSelectAllStream = StreamStateInitial();

  selectAllAction() {
    itemsSelect = [];
    for (var item in this.items) {
      itemsSelect
          .add(CheckboxItem(id: item.index, text: item.value, checked: true));
    }
    List<Item> allItemsChecked = this
        .items
        .map((e) => Item(
              index: e.index,
              value: e.value ?? '',
            ))
        .toList();
    searchStream.setData(allItemsChecked);
    onMultiSelectItem!(itemsSelect);
  }
}
