import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'customFabHook.dart';
import 'homepage.dart';

class MyHomePageWithCustomHook extends HookWidget{
  @override
  Widget build(BuildContext context) {
    var hideFABAnimationController = useAnimationController(
        initialValue: 1, duration: kThemeAnimationDuration);
    var scrollController = useFABScrollController(hideFABAnimationController);

    return DummyListWithFAB(
        hideFABAnimationController: hideFABAnimationController,
        scrollController: scrollController);
  }
}
