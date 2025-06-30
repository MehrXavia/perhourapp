import 'package:onservice24/core/di/injector.dart';

import '../../../../../core/widgets/drop_down/drop_down.dart';

class MessageTypes{
  static List<DropDownItem> getMessageTypes(){
    final strings = injector<ServicesLocator>().strings;
    return [
      DropDownItem(
        id: '1',
        title: strings.complaint,
      ),
      DropDownItem(
        id: '2',
        title: strings.inquiry,
      ),
      DropDownItem(
        id: '1',
        title: strings.problem,
      ),
    ];
  }
}