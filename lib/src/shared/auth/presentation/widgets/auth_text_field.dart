import 'package:onservice24/src/main_index.dart';

import '../../../../../core/resources/validation.dart';

class AuthTextField extends StatelessWidget {
  final double? width;

  final String? hint;

  final TextEditingController? controller;

  final void Function()? onTep;

  final String? Function(String?)? validator;
  final Function(String?)? onChange;

  final Function(String?)? onSubmit;

  final bool isPassword;

  final String? prefixIcon;
  final Icon? prefixIconData;

  final bool? error;

  const AuthTextField({
    Key? key,
    this.width,
    this.hint,
    this.controller,
    this.onTep,
    this.validator,
    this.onChange,
    this.onSubmit,
    this.isPassword = false,
    this.prefixIcon,
    this.error,
    this.prefixIconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 10.paddingBottom,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.15),
          offset: const Offset(0, 0),
          blurRadius: 10,
        ),
      ], borderRadius: BorderRadius.circular(8.h)),
    );
  }
}
