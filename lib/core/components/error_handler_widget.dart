import 'package:onservice24/core/widgets/buttons/primary_icon_button.dart';

import '../../src/admin/service/presentation/widget/alert.dart';
import '../exceptions/api_exception.dart';
import '/src/main_index.dart';
// ignore: must_be_immutable
class ErrorPlaceHolderWidget extends StatelessWidget {


  final String? error;
  final String? title;
  final Function()? onClickReload;
  final dynamic exception;
  final Color? color;
  final bool showImage ;
  final double? height;
   ErrorPlaceHolderWidget({Key? key,
     this.error,
    this.exception,
     this.title ,
    this.onClickReload,
     this.showImage = true,
    this.color,
    this.height,
     this.placeHolderImage
  }) : super(key: key);
  Widget ? placeHolderImage ;
   String ?  message ;



  @override
  Widget build(BuildContext context) {

    ApiException error  = context.handleApiErrorMessage( exception: exception);
    print('ErrorPlaceHolderWidget error  ${error.message}');
    return
      // error.code == 422 ? AlertScreen() :
      Container(
        color: color ?? Colors.white,
        height: height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              placeHolderImage!=null && showImage?
              Container(
                color: color ?? Colors.white,
                margin: const EdgeInsets.only(bottom: 12),
                child: placeHolderImage,
              ):Container(),
              title!=null ?Text(title!,style: kTextMedium.copyWith(color: kPrimaryDark,fontSize: 12),):Container(),
              Text(
                error.message.toString().trim(),
                style:
                    kTextRegular.copyWith(color: kPrimaryDark, fontSize: 12),
                textAlign: TextAlign.center,
              ),
              20.ph,
              PrimaryIconButton(
                icon: AppIcons.refresh,
                iconColor: context.cardColor,
                title: context.strings.reload,
                width: 150,
                radius: 50,
                onPressed: (){
                  onClickReload!();
                },
              )
            ],
          ),
        ));
  }
}
