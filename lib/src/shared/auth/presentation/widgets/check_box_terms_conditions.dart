import 'package:flutter/material.dart';
  import 'package:onservice24/core/exceptions/extensions.dart';

import '../../../../../core/components/base_stateless_widget.dart';
import '../../../../../core/themes/colors.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../../../../core/widgets/buttons/custom_button.dart';
import '../../../../../core/widgets/helper/helper_widgets.dart';

class CheckBoxTermsConditions extends BaseStatelessWidget {
  final void Function(bool?)? onChanged;
  CheckBoxTermsConditions({super.key, this.onChanged});
  List<TermsDto> data = [
    TermsDto(
        nameAr: "القبول واالستخدام",
        nameEn: " Acceptance and Use ",
        subNameAr: 'من خلال تحميل واستخدام تطبيق [PerHourApp] المجاني ، فإنك توافق على اللتزام بهذه الشروط والأحكام . إذا كنت لا توافق على هذه الشروط، يُرجى عدم استخدام التطبيق',
        subNameEn:
            'By downloading and using the free [PerHourApp], you agree to abide by these Terms and Conditions. If you do not agree to these terms, please refrain from using the app ',
        id: "1. "),
    TermsDto(
        nameAr: "وصف الخدمة",
        nameEn: " Service Description ",
        subNameAr: "يعمل التطبيق كمحرك بحث يتيح للمستخدمين العثور على مقدمي الخدمات وفقًا لمهنهم ومهاراتهم. يمكن لمقدمي الخدمات نشر أرقام هواتفهم على الخريطة داخل التطبيق وتقديم المهن التي تتناسب مع مهاراتهم. ",
        subNameEn:
            'The app serves as a search engine enabling users to find service providers based on their professions and skills. Service providers can display their phone numbers on the map within the app and offer services that align with their skills. ',
        id: "2. "),
    TermsDto(
        nameAr: "نشر معلومات مقدمي الخدمات",
        nameEn: " Publishing Service Providers' Information ",
        subNameEn: "• [PerHourApp] and service providers are allowed to publish phone numbers and professional details on the app's map.\n• Information provided must be accurate and up-to-date to reflect the service providers' skills and professions correctly.\n• Service providers bear full responsibility for the accuracy and validity of the information they publish.\n• Service providers are prohibited from causing inconvenience or harm to other providers or users.",
        subNameAr:'• يحق للتطبيق PerHourApp و لمقدمي الخدمات نشر رقم هاتفهم ومعلوماتهم المهنية على الخريطة في التطبيق.\n • يجب أن تكون المعلومات المقدمة دقيقة ومحدثة لتعكس مهارات ومهن مقدمي الخدمات بشكل صحيح.\n • يتحمل مقدمو الخدمات المسؤولية الكاملة عن صحة ودقة المعلومات التي ينشرونها.\n • يُمنع مقدم الخدمة التسبب في أي إزعاج أو ضرر لمقدمي الخدمات أو غيرهم من المستخدمين',
        id: "3. "),
    TermsDto(
        nameAr: "التزامات المستخدمين",
        nameEn: "User Obligations",
        subNameEn: '• Users must utilize the app in a safe and responsible manner. \n• Users are prohibited from causing any inconvenience or harm to service providers or other users. \n• Users must comply with all local laws and regulations of the country they operate in when using the app.',
        subNameAr:'• يجب على المستخدمين استخدام التطبيق بطريقة آمنة ومسؤولة.\n • يُمنع على المستخدمين التسبب في أي إزعاج أو ضرر لمقدمي الخدمات أو غيرهم من المستخدمين.\n • يجب على المستخدمين االمتثال لجميع القوانين واللوائح المحلية للدولة التي يعملون فيها عند استخدام التطبيق.',
        id: "4. "),
    TermsDto(
        nameAr: "الامتثال للقوانين المحلية",
        nameEn: " Compliance with Local Laws  ",
        subNameEn: '  As the app operates globally, all users and service providers must adhere to the laws of the country they operate in. The app is not responsible for any violations of local laws by users or service providers. ',
        subNameAr:'نظرا لأن التطبيق عالمي، يتعين على جميع المستخدمين ومقدمي الخدمات الامتثال لقوانين الدولة التي يعملون فيها. التطبيق لا يتحمل أي مسؤولية عن انتهاكات المستخدمين أو مقدمي الخدمات للقوانين المحلية.',
        id: "5. "),
    TermsDto(
        nameAr: "عدم تحمل المسؤولية",
        nameEn: " Disclaimer of Liability  ",
        subNameEn: '• The app is not responsible for any crimes or financial disputes arising between service providers and users. \n• The app role is limited to providing contact information between users and service providers. \n• In case of disputes or crimes, the app will only provide contact information to the relevant authorities upon formal request.',
        subNameAr:'• لا يتحمل التطبيق أي مسؤولية عن أي جرائم أو قضايا مالية قد تنشأ بين مقدمي الخدمات والمستخدمين.\n • يقتصر دور التطبيق على توفير معلومات الاتصال بين المستخدمين ومقدمي الخدمات.\n • في حالة حدوث أي نزاع أو جريمة، يكتفي التطبيق بتسليم معلومات االتصال ألي جهة أمنية ذات صلة بنا ًء على طلبها الرسمي. ',
        id: "6. "),
    TermsDto(
        nameAr: "حقوق الملكية الفكرية",
        nameEn: "  Intellectual Property Rights",
        subNameEn: ' • All rights to the content within the app, including text, images, and logos, are owned by [PerHourApp, LLC] .\n• Reusing, copying, or modifying any app content without prior written permission is prohibited. ',
        subNameAr:'• جميع الحقوق المتعلقة بالمحتوى الموجود في التطبيق، بما في ذلك النصوص والصور والشعارات، مملوكة لـ [PerHourApp, LLC]. \n• يُمنع إعادة استخدام أو نسخ أو تعديل أي محتوى من التطبيق دون إذن كتابي مسبق. ',
        id: "7. "),
    TermsDto(
        nameAr: "الروابط الخارجية",
        nameEn: "   External Links   ",
        subNameEn: 'The app may contain links to third-party websites or services. We are not responsible for the content or services of these websites, nor do we endorse them. External links are used at the users own risk. ',
        subNameAr:'قد يحتوي التطبيق على روابط لمواقع أو خدمات طرف ثالث. نحن غير مسؤولين عن محتوى أو خدمات تلك المواقع لا نؤيدها. يُستخدم الروابط الخارجية على مسؤولية المستخدمين الخاصة.',
        id: '8. '),
    TermsDto(
        nameAr: "الإنهاء",
        nameEn: "Termination",
        subNameEn: "We reserve the right to suspend or terminate your access to the app at any time without prior notice, especially if you violate any of these terms. ",
        subNameAr:'نحتفظ بالحق في تعليق أو إنهاء وصولك إلى التطبيق في أي وقت وبدون إشعار مسبق، خاصة في حال انتهاكك ألي من هذه الشروط. ',
        id: "9. "),
    TermsDto(
        nameAr: "تحديد المسؤولية",
        nameEn: "Limitation of Liability ",
        subNameEn:  "• The app is not liable for any direct or indirect damages arising from the use or inability to use the app .\n• All uses of the app are at the user's own risk. ",
        subNameAr:'• التطبيق لا يتحمل أي مسؤولية عن أي أضرار مباشرة أو غير مباشرة تنشأ عن استخدام التطبيق أو عدم القدرة على استخدامه.\n • جميع الاستخدامات للتطبيق تتم على مسؤولية المستخدم الشخصية.',
        id: "10. "),
    TermsDto(
        nameAr: "التعديلات على الشروط",
        nameEn: "Amendments to Terms ",
        subNameEn:  "• We reserve the right to modify these terms at any time without prior notice .\n• Any changes will be published on the app, and continued use of the app afterchanges implies acceptance of the modified terms.",
        subNameAr:'• نحتفظ بالحق في تعديل هذه الشروط في أي وقت ودون إشعار مسبق.\n • سيتم نشر التعديالت في التطبيق، ويُعتبر استمرار استخدامك للتطبيق بعد التعديالت قبو ًال منك على الشروط المعدلة .',
        id: "11. "),
    TermsDto(
        nameAr: "سياسة الخصوصية لتطبيق",
        nameEn: " Privacy Policy for [PerHourApp]",
        subNameEn:  " 1. Data Collection \n We collect the following information when you use the app:\n• Personal Data: Name, phone number, and email (when registering or whenprovided by you).\n• Usage Data: IP address, device type, operating system, and user behavior within the app.\n• Geographic Location: If you grant permission, for accurate map and location functionality.",
        subNameAr:'1- جمع البيانات \n نقوم بجمع المعلومات التالية عند استخدامك للتطبيق:\n • البيانات الشخصية :مثل الاسم، رقم الهاتف، والبريد الالكتروني (عند التسجيل أو عند تقديمها من قِبلك).\n • بيانات الاستخدام :مثل عنوانIP ، نوع الجهاز، نظام التشغيل، وسلوك المستخدم داخل التطبيق.\n • الموقع الجغرافي :إذا قمت بمنح الاذن، لجعل الخريطة والمواقع الجغرافية تعمل بشكل دقيق. ',
        id: ""),
    TermsDto(
        nameAr: "",
        nameEn: "",
        subNameEn:  "2. Use of Data \nWe use the data we collect for the following purposes: \n• To provide and improve app services.\n• To enable users to find service providers based on location and skills.\n• To communicate with users for resolving issues or providing updates.\n• To analyze usage data to enhance user experience.",
        subNameAr:' 2- استخدام البيانات\n نستخدم البيانات التي نجمعها للأغراض التالية:\n • تقديم وتحسين خدمات التطبيق.\n• تمكين المستخدمين من العثور على مقدمي الخدمات بنا ًء على الموقع والمهارات.\n• التواصل مع المستخدمين لحل المشكلات أو تقديم التحديثات.\n• تحليل بيانات الستخدام لتحسين تجربة المستخدم. ',
        id: ""),
    TermsDto(
        nameAr: "",
        nameEn: "",
        subNameEn:  "3. Data Protection\n• User data is stored using advanced encryption technologies.\n• All reasonable measures are taken to protect data from unauthorized access,modification, or deletion.\n• In the event of a security breach, we will notify affected users and take necessarycorrective actions.",
        subNameAr:' 3- حماية البيانات\n • يتم تخزين بيانات المستخدمين باستخدام تقنيات تشفير متقدمة.\n• يتم اتخاذ جميع التدابير المعقولة لحماية البيانات من الوصول غير المصرح به، التعديل، أو الحذف .\n• في حالة حدوث خرق أمني، سنخطرك ونتخذ الخطوات اللازمة لمعالجة المشكلة .',
        id: ""),
    TermsDto(
        nameAr: "",
        nameEn: "",
        subNameEn:  "4. External Links \nThe app may contain links to third-party websites or applications. We are not responsible for their content or privacy practices. Please review their privacy policies when visiting them.",
        subNameAr:' 4- الروابط الخارجية\nقد يحتوي التطبيق على روابط لمواقع أو تطبيقات طرف ثالث. نحن لسنا مسؤولين عن المحتوى أو الممارسات المتعلقة بالخصوصية لهذه المواقع أو التطبيقات. يُرجى مراجعة سياسات الخصوصية الخاصة بهم عند زيارتها.',
        id: ""),
    TermsDto(
        nameAr: "",
        nameEn: "",
        subNameEn:  "5. User Rights \nWe are committed to ensuring the following user rights:\n1. Access to Data: You can request a copy of your personal data.\n2. Data Correction: If your data is inaccurate or incomplete, you can request corrections. \n3. Data Deletion: You can request the deletion of your data unless legal obligations require retention.\n 4. Withdrawal of Consent: You can withdraw consent for data collection or usage at any time.",
        subNameAr:' 5- حقوق المستخدمين\n نحن ملتزمون بضمان حقوق المستخدمين التالية:\n1.الوصول إلى البيانات :يمكنك طلب نسخة من البيانات الشخصية التي نحتفظ بها.\n2. تصحيح البيانات :إذا كانت بياناتك غير دقيقة أو غير مكتملة، يمكنك طلب تصحيحها.\n3.حذف البيانات :يمكنك طلب حذف بياناتك من سجالتنا، ما لم يكن هناك التزام قانوني باالحتفاظ بها.\n4. إلغاء الموافقة :يمكنك سحب موافقتك على جمع أو استخدام بياناتك في أي وقت .',
        id: ""),
    TermsDto(
        nameAr: "",
        nameEn: "",
        subNameEn:  "6. Disclaimer for External Links\n The app may contain links to third-party websites or applications. We are not liable for:\n• The content of these links.\n• Any harm or issues arising from visiting or using those websites.",
        subNameAr:'6- اخلاء المسؤولية عن الروابط الخارجية\n التطبيق قد يحتوي على روابط لمواقع أو تطبيقات طرف ثالث. نحن لا نتحمل أي مسؤولية عن:\n • المحتوى الموجود في هذه الروابط.\n• أي ضرر أو مشكلة قد تنشأ نتيجة زيارة أو استخدام تلك المواقع .',
        id: ""),
    TermsDto(
        nameAr: "",
        nameEn: "",
        subNameEn:  "7. Compliance with Security Standards\n• We use strict security protocols to protect user data.\n• The system is regularly reviewed to comply with the latest security standards.\n• If a security breach is discovered, it will be promptly resolved, and affected users will be notified.",
        subNameAr:'7- الامتثال للمعايير الامنية \n• نستخدم بروتوكولات أمنية مشددة لحماية بيانات المستخدمين.\n• يتم مراجعة النظام بانتظام لضمان الامتثال لأحدث معايير الأمان .\n• في حالة اكتشاف أي انتهاك أمني، سنعمل على إصالحه فورا مع إبالغ المستخدمين المتأثرين.',
        id: ""),
    TermsDto(
        nameAr: "",
        nameEn: "",
        subNameEn:  "8. Indemnification\n• Both users and service providers agree to indemnify [PerHourApp], its team, and partners for any damages or losses resulting from:\n1. Illegal or unauthorized use of the app.\n2. Violations of these policies or terms.\n3. Harm caused to third parties as a result of using the app.",
        subNameAr:'8- التعويض\n• يوافق كل من المستخدم و مقدم الخدمة على تعويض ]PerHourApp]، وفريق العمل، والشركاء عن أي ضرر أو خسارة ناتجة عن:\n1. الاستخدام غير القانوني أو المخالف للتطبيق.\n2. أي خرق لهذه السياسة أو الشروط والأحكام.\n3. التسبب في ضرر الألطراف ثالثة نتيجة الستخدام التطبيق.',
        id: ""),
    TermsDto(
        nameAr: "",
        nameEn: "",
        subNameEn:  "9. Amendments to Privacy Policy\nWe reserve the right to modify this policy at any time. Users will be notified of changes via the app. Continued use of the app after changes implies acceptance of the updated policy.",
        subNameAr:'9- التعديلات على سياسة الخصوصية\n نحتفظ بالحق في تعديل هذه السياسة في أي وقت. سيتم إخطار المستخدمين بالتعديالت عبر التطبيق. يُعتبر استمرار استخدامك للتطبيق بعد التعديلات قبو ًال منك للسياسة المحدثة.\n خيارات إلغاء الاشتراك\n لتوفير تجربة مرنة، نوفر للمستخدمين الخيارات التالية لالغاء الاشتراك أو التحكم في استخدام بياناتهم:\n • إلغاء الاشتراك في الاتصاالت: يمكنك إلغاء الاشتراك في رسائل البريد الالكتروني أو الاشعارات التسويقية عبر رابط "إلغاء الاشعارات" الموجود في التطبيق.\n • إلغاء الاشتراك في معالجة البيانات:إذا كنت ال ترغب في معالجة بياناتك لأي سبب، يمكنك طلب حذف بياناتك الشخصية أو التوقف عن معالجتها من خالل االتصال بنا على [ notification@perhourapp.com ].\n • إدارة بيانات الموقع: لتعطيل جمع بيانات الموقع، قم بتغيير إعدادات جهازك للسماح أو حظر وصول التطبيق إلى الموقع الجغرافي .\n • طلب الحذف أو التقييد: يمكنك تقديم طلب رسمي لحذف بياناتك بالكامل أو تقييد استخدامها وفقً للقوانين المعمول بها. للاستفسار أو تقديم الطلب، يُرجى التواصل معنا عبر [notification@perhourapp.com].',
        id: ""),
    TermsDto(
        nameAr: "",
        nameEn: "",
subNameEn: "10. Opt-Out Options\n To ensure flexibility, we provide the following options for users to opt out or control the use of their data: \n• Opt-out of Communications: Unsubscribe from email or notification messages via the Unsubscribe link in the app. \n• Opt-out of Data Processing: Request deletion or cessation of personal data processing by contacting us at notification@perhourapp.com \n• Manage Location Data: Disable location data collection by adjusting your device settings. \n• Data Deletion or Restriction Requests: Submit formal requests for complete data deletion or usage restrictions in compliance with applicable laws. \n1. International Compliance\n • Commitment to International Laws: We comply with privacy laws in all regions where we operate, including GDPR (EU) and CCPA (California). \n• User Rights in Different Regions:\n o EU/EEA: Users are entitled to GDPR rights such as data processing transparency, data portability, and consent withdrawal.\n o California: Users can request data access, usage information, deletion, or opt-out of data sales under CCPA. \no Other Regions: We comply with local laws and ensure user data protection to the highest standards.",
        subNameAr:'10- التواصل مع الجهات الدولية\n• التزامنا بالقوانين الدولية: نحن ملتزمون باالمتثال للقوانين واللوائح المتعلقة بالخصوصية في جميع المناطق التي نعمل فيها، بما في ذلك قوانين الاتحاد الأوروبي(GDPR)، وقانون خصوصية المستهلك في كاليفورنيا(CCPA)، وأي قوانين خصوصية محلية أخرى ذات صلة .\n • حقوق المستخدمين الدوليين: المستخدمون في الاتحاد الأوروبي والمنطقة الاقتصادية الأوروبية:\n يتمتع المستخدمون بحقوق إضافية بموجب اللائحة العامة لحماية البيانات(GDPR)، بما في ذلك الحق في معرفة كيفية معالجة بياناتهم، ونقل بياناتهم، وسحب موافقتهم في أي وقت.\n o المستخدمون في الولايات المتحدة (كاليفورنيا): يحق للمستخدمين بموجب قانون CCPA طلب الوصول إلى بياناتهم، معرفة كيفية استخدامها، وحذفها أو رفض بيعها إن وجد.\n o المستخدمون في دول أخرى: نلتزم بالقوانين المحلية لكل دولة ونضمن حماية خصوصية المستخدمين وفقً لأعلى المعايير.\n • نقل البيانات عبر الحدود:\n o قد يتم تخزين بياناتك الشخصية أو معالجتها في خوادم تقع خارج بلد إقامتك، بما يتوافق مع القوانين المحلية والدولية.\n o نضمن أن تكون أي عملية نقل للبيانات عبر الحدود تتم وفقً القياسية (SCC)الموصى بها من االتحاد األوروبي.\n1. التوافق الثقافي والقانوني:\n نحن ندرك أن لكل دولة احتياجاتها وقوانينها المختلفة. لذلك، نراجع سياساتنا بشكل منتظم للتأكد من أنها تفي بمتطلبات المستخدمين في جميع أنحاء العالم.',
        id: ""),
    TermsDto(
        nameAr: "",
        nameEn: "",
        subNameEn:  "11. Contact Us\n For inquiries or questions about these terms, please contact us via: \n• Email: notification@perhourapp.com",
      subNameAr: "11- الاتصال بنا\nلأي استفسارات أو أسئلة بخصوص هذه الشروط، يُرجى الاتصال بنا عبر: البريد الاكتروني: notification@perhourapp.com",
        id: ""),
  ];
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, snapshot) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 1.4,
            child: Checkbox(
              value: value,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              activeColor: context.primaryColor,
              side: BorderSide(
                color: context.dividerColor,
                width: 1,
              ),
              visualDensity: VisualDensity.compact,
              onChanged: (value) {
                snapshot(() {
                  this.value = value!;
                });
                onChanged!(value);
              },
            ),
          ),
          10.pw,
          Text(
            strings.i_read_and_agree_to,
            overflow: TextOverflow.ellipsis,
            style: bodyLarge.copyWith(fontSize: 14),
          ),
          2.pw,
          InkWell(
            onTap: () {
              showAppModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  // title: strings.terms_and_conditions,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    child:
                    Column(
                      children: [
                        // Expanded(
                        //   child: SizedBox(
                        //     width: double.infinity,
                        //     height: 500,
                        //     child: const PDF(
                        //       swipeHorizontal: true,
                        //       fitEachPage: true,
                        //       autoSpacing: true,
                        //       enableSwipe: true,
                        //       pageSnap: true
                        //     ).fromAsset(getName(AppImages.terms_ar, AppImages.terms_en)),
                        //   ),
                      //  ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    " ${data[index].id}${getName(data[index].nameAr, data[index].nameEn)}",
                                    style: kTextBold.copyWith(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  5.ph,
                                  Text(
                                    getName(data[index].subNameAr, data[index].subNameEn),
                                    style: kTextRegular.copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  10.ph,
                                ],
                              );
                            },
                            itemCount: data.length,
                          ),
                        ),
                        30.ph,
                        customButton(
                            buttonText: strings.ok,
                            buttonColor: kBlueColorE4,
                            buttonTextColor: Colors.white,
                            buttonFunc: () {
                              snapshot(() {
                                value = true;
                                onChanged!(true);
                                Navigator.pop(context);
                              });
                            }),
                      ],
                    ),
                  ));
            },
            child: Text(
              strings.terms_and_conditions,
              overflow: TextOverflow.ellipsis,
              style: headlineLarge.copyWith(
                fontSize: 14,
              ),
            ),
          ),
        ],
      );
    });
  }
}

class TermsDto {
  final String nameAr;
  final String nameEn;
  final String subNameAr;
  final String subNameEn;
  final String id;

  TermsDto(
      {required this.nameAr,
      required this.nameEn,
      required this.subNameAr,
      required this.subNameEn,
      required this.id});
}
