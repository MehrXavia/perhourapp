import 'package:flutter/services.dart';
import '../../../navigation_pages_v2.dart';
import 'progress_dialog.dart';
import '../../../src/main_index.dart';

class DialogsManager {
  static CustomProgressDialog createProgress() {
    return ProgressDialog.createProgress(
        injector<ServicesLocator>().navigatorKey.currentContext!);
  }

  static showAlertDialog(BuildContext context, Widget content) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      actionsPadding: 30.paddingAll,
      contentPadding: 0.paddingAll,

      insetPadding: EdgeInsets.zero,
      elevation: 0,
      alignment: Alignment.center,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      content: SizedBox(
        height: 280,
        child: content,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    });
  }

  static onBackPress(BuildContext context) {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  static baseDialog(
    BuildContext context, {
    String? confirmButtonName,
    required String message,
    Function()? onClickOk,
    bool? dismissible = true,
    Function()? negativeTap,
    required IconData icon,
    String? negativeButtonName,
    bool hideCancelButton = true,
  }) {
    print('baseDialog $message');
    showGeneralDialog(
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      useRootNavigator: true,
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Icon(icon,
              size: 60, color: icon == Icons.error ? Colors.red : Colors.green),
          actionsPadding: 10.paddingBottom,
          content: WillPopScope(
            onWillPop: () async {
              return dismissible == true;
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(message, style: context.bodyMedium),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (onClickOk != null) {
                  onClickOk();
                } else {
                  Navigator.pop(context);
                }
              },
              child: Text(
                confirmButtonName ?? context.strings.ok,
                style: context.bodyMedium
                    .copyWith(color: Colors.green, fontSize: 18),
              ),
            ),
            hideCancelButton == true
                ? const SizedBox.shrink()
                : TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (negativeTap != null) {
                        negativeTap();
                      }
                    },
                    child: Text(
                      negativeButtonName ?? context.strings.cancel,
                      style: context.bodyMedium.copyWith(color: Colors.red),
                    ),
                  ),
          ],
        );
      },
      transitionBuilder: (context, a1, a2, child) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(opacity: a1.value, child: child),
        );
      },
    );
  }

  static showSuccessDialog(BuildContext context,
      {required String message, Function()? onClickOk}) {
    return baseDialog(context,
        message: message, icon: Icons.check_circle, onClickOk: onClickOk);
  }

  static showErrorDialog(BuildContext context, String text) {
    baseDialog(
      context,
      message: text,
      icon: Icons.error,
    );
  }
}
