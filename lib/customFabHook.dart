import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ScrollController useFABScrollController(animatedController) {
  return use(_FABHook(animatedController: animatedController));
}

class _FABHook extends Hook<ScrollController> {

  AnimationController animatedController;
  _FABHook({required this.animatedController});

  @override
  HookState<ScrollController, _FABHook> createState() {
    return _FABHookState();
  }

}

class _FABHookState extends HookState<ScrollController,_FABHook> {

  ScrollController controller = ScrollController();

  @override
  void initHook() {
    // TODO: implement initHook
    super.initHook();
    controller.addListener(() {
      if (controller.position.userScrollDirection ==
          ScrollDirection.reverse) {
        hook.animatedController.reverse();
      } else {
        hook.animatedController.forward();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  ScrollController build(BuildContext context) {
    return controller;
  }
}
