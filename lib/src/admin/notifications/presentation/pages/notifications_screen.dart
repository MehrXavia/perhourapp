import 'package:onservice24/src/main_index.dart';

import '../../data/models/NotificationsDto.dart';
import '../widgets/notification_item.dart';

class NotificationScreen extends BaseStatelessWidget {
  NotificationScreen( {required this.type,required this.data,super.key});
int  type;
  final List<NotificationsDto> data;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,

        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return  NotificationItem(notificationsDto: data[index],type:type);
        });
  }
}

