import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomProgress extends StatelessWidget {
  final Widget? child;

  const CustomProgress({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: true,
      progressIndicator: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(150),
          child: Image.asset(
            "assets/images/loader.gif",
            scale: 6,
            fit: BoxFit.fill,
            height: 80,
            width: 80,
          ),
        ),
      ),
      child: child ?? Container(),
    );
  }
}
