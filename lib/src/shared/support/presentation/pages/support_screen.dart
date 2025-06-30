import 'package:intl/intl.dart';
import 'package:onservice24/core/utils/helper_methods.dart';
import 'package:onservice24/core/widgets/drop_down/drop_down.dart';
import 'package:onservice24/core/widgets/images/logo_with_name.dart';
import 'package:onservice24/src/main_index.dart';

import '../../../../../core/widgets/text-field/custom_text_field.dart';
import '../../data/models/add_support_params.dart';
import '../../data/models/message_types.dart';

///  Created by harby on 10/12/2023.
class SupportScreen extends BaseStatelessWidget {
  final Function(AddSupportParams)? onContactUs;

  SupportScreen({super.key, this.onContactUs});

  TextEditingController subjectController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  final _key = GlobalKey<FormState>();
  int messageTypeId = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Padding(
        padding: 16.paddingAll,
        child: SingleChildScrollView(
          child: Column(
            children: [
              16.ph,
              Text(strings.help_support_title, style: bodySmall.copyWith(fontSize: 14), textAlign: TextAlign.center),
              16.ph,
              DropDownField(
                hint: strings.message_type,
                 items: MessageTypes.getMessageTypes(),
                onChanged: (item) {
                  messageTypeId = int.parse(item?.id .toString()??'0');
                },
              ),
              16.ph,

              FutureBuilder(
                future: HelperMethods.getUserId(),
                initialData: false,
                builder: (context, snapshot) {
                  return  snapshot.data == null || snapshot.data == 0
                      ? CustomTextField(
                    controller: emailController,
                    hintText: strings.email,
                    keyboardType: TextInputType.emailAddress,
                  ) : 0.ph;
                }
              ),
              CustomTextField(
                controller: contentController,
                hintText: strings.message_text,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
              ),
              PrimaryButton(
                title: strings.send,
                margin: 16.paddingVert,
                onPressed: () {
                  onSelectedPressed();
                },
              ),
              const LogoWithName(size: 70, sizeLogoMame: 20),
              14.ph,
              Text(strings.help_support_desc, style: bodySmall.copyWith(fontSize: 14), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  onSelectedPressed() async {
    if (_key.currentState!.validate()) {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(now);
      onContactUs!(AddSupportParams(
        message: contentController.text,
        messageTypeId: messageTypeId,
        createdDate: formattedDate,
        isDeledted: false,
        email: emailController.text,

      ));
    }
  }
}
