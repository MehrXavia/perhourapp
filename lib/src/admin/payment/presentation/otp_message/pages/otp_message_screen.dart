import 'dart:async';

import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:onservice24/src/main_index.dart';
import '../../../../../../core/utils/helper_methods.dart';
import '../../../../../../core/widgets/text-field/custom_pin_code.dart';
import '../../../../../shared/auth/data/models/verify_otp_params.dart';

class OtpMessageScreen extends StatefulWidget {
  OtpMessageScreen(
      {Key? key, required this.verifyOtpCode, required this.sendOTPCode})
      : super(key: key);

  final Function(String email) sendOTPCode;
  final Function(VerifyOtpParams sendOtpParams) verifyOtpCode;

  @override
  State<OtpMessageScreen> createState() => _OtpMessageScreenState();
}

class _OtpMessageScreenState extends State<OtpMessageScreen> {
  TextEditingController otpController = TextEditingController();

  StreamStateInitial<bool> isSendAgain = StreamStateInitial();
  int _remainingTime = 120; // Countdown duration in seconds
  Timer? _timer;
  bool _isRunning = false; // Tracks whether the timer is running

  @override
  void initState() {
    super.initState();
    startTimer(); // Start the timer when the page opens
  }

  /// Starts the countdown timer
  void startTimer() {
    if (_isRunning) return; // Prevent multiple timers from starting
    setState(() {
      _isRunning = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        stopTimer(); // Stop the timer when it reaches 0
        onTimerEnd();
      }
    });
  }

  /// Stops the timer
  void stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
    setState(() {
      _isRunning = false;
    });
  }

  /// Resets the timer to its initial value
  void resetTimer() {
    setState(() {
      _remainingTime = 120; // Reset the countdown time to 10 seconds
    });
  }

  /// Callback when the timer ends
  void onTimerEnd() {
    isSendAgain.setData(true);
  }

  /// Formats time into MM:SS
  String formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    stopTimer(); // Ensure the timer is canceled to prevent memory leaks
    super.dispose();
  }

  final strings =
      injector<ServicesLocator>().navigatorKey.currentContext!.strings;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          AppIcon(
            padding: 20.paddingTop,
            icon: AppIcons.otp_background,
            size: 300,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              30.ph,
              const AppIcon(
                icon: AppIcons.hand,
                size: 150,
              ),
              34.ph,
              Text(
                strings.account_verification,
                style: kTextSemiBold.copyWith(fontSize: 23, color: kDark12),
              ),
              29.ph,
              Text(
                strings
                    .please_enter_the_activation_code_sent_to_your_mobile_phone,
                style: kTextSemiBold.copyWith(fontSize: 13, color: kDark12),
              ),
              29.ph,
              Text(
                formatTime(_remainingTime),
                style: kTextSemiBold.copyWith(
                    color: const Color(0xffFF0000), fontSize: 29),
              ),
              15.ph,
              Directionality(
                textDirection: TextDirection.ltr,
                child: Padding(
                  padding: 16.paddingHoriz,
                  child: CustomPinCode(
                    pinCodeController: otpController,
                  ),
                ),
              ),
              PrimaryButton(
                title: strings.confirmation,
                margin: 20.paddingAll,
                onPressed: () async {
                  final email = await HelperMethods.getEmail();
                  widget.verifyOtpCode(VerifyOtpParams(
                    email: email,
                    otp: otpController.text,
                  ));
                  // Navigators.pushNamedAndRemoveUntil(Routes.navigationPages);
                },
              ),
              StreamBuilder<bool>(
                  stream: isSendAgain.stream,
                  builder: (context, snapshot) {
                    return snapshot.data == true
                        ? PrimaryButton(
                            color: kBlackColor_12,
                            backgroundColor: const Color(0xffE2E2E2),
                            title: strings.send_the_code_again,
                            margin: 20.paddingAll,
                            onPressed: () async {
                              final email = await HelperMethods.getEmail();
                              otpController.clear();
                              await widget.sendOTPCode(email);
                              await isSendAgain.setData(false);
                              Future.delayed(const Duration(seconds: 6))
                                  .then((val) {
                                resetTimer();
                                startTimer();
                              });
                            },
                          )
                        : 0.ph;
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
