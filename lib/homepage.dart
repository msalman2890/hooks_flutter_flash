import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late AnimationController _hideFABAnimationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        _hideFABAnimationController.reverse();
      } else {
        _hideFABAnimationController.forward();
      }
    });
    _hideFABAnimationController = AnimationController(
        vsync: this, duration: kThemeAnimationDuration, value: 1);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
    _hideFABAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DummyListWithFAB(
        hideFABAnimationController: _hideFABAnimationController,
        scrollController: _scrollController);
  }
}

class DummyListWithFAB extends StatelessWidget {
  const DummyListWithFAB(
      {Key? key,
      required this.hideFABAnimationController,
      required this.scrollController})
      : super(key: key);

  final ScrollController scrollController;
  final AnimationController hideFABAnimationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Hooks"),
      ),
      floatingActionButton: _floatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: _listview(),
    );
  }

  FadeTransition _floatingButton() {
    return FadeTransition(
      opacity: hideFABAnimationController,
      child: ScaleTransition(
        scale: hideFABAnimationController,
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: Text("Floating Action Button"),
        ),
      ),
    );
  }

  ListView _listview() {
    return ListView.builder(
      controller: scrollController,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("Item $index"),
        );
      },
    );
  }
}
