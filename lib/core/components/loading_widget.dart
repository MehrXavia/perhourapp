

import '../../src/main_index.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: kPrimaryLight,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              SizedBox(
                height: 30,
                width: 30,
/*
                child: Image.asset('images/loading_gify.gif'),
*/
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: kPrimaryDark,
                ),
              ),
            ],
          ),
        ));
  }
}

class SmallLoadingView extends StatelessWidget {
  final double? height;

  const SmallLoadingView({super.key, this.height});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              SizedBox(
                height: 15.0,
                width: 15.0,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                ),
              ),
            ],
          ),
        ));
  }
}
