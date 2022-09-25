import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'homepage.dart';

class MyHomePageWithPreBuiltHook extends HookWidget{
  @override
  Widget build(BuildContext context) {
    var scrollController = useScrollController();
    var hideFABAnimationController = useAnimationController(
        initialValue: 1, duration: kThemeAnimationDuration);

    useEffect(() {
      scrollController.addListener(() {
        if (scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
          hideFABAnimationController.reverse();
        } else {
          hideFABAnimationController.forward();
        }
      });
      return () {
        scrollController.dispose();
        hideFABAnimationController.dispose();
      };
    }, [scrollController, hideFABAnimationController]);

    return DummyListWithFAB(
        hideFABAnimationController: hideFABAnimationController,
        scrollController: scrollController);
  }
}
