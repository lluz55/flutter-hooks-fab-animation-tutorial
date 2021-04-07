import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_fab_scroll_tutorial/hooks/scroll_controller_for_animation.dart';

class HomePage extends HookWidget {
  final _colors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.pinkAccent,
    Colors.brown
  ];

  @override
  Widget build(BuildContext context) {
    final hideFabAnimController = useAnimationController(
        duration: kThemeAnimationDuration, initialValue: 1);
    final scrollController =
        useScrollControllerForAnimation(hideFabAnimController);
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll Animation Test"),
      ),
      floatingActionButton: FadeTransition(
        opacity: hideFabAnimController,
        child: ScaleTransition(
          scale: hideFabAnimController,
          child: FloatingActionButton.extended(
            label: const Text('Useless Floating Action Button'),
            onPressed: () {
              scrollController.animateTo(0,
                  duration: Duration(milliseconds: 350),
                  curve: Curves.bounceIn);
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        controller: scrollController,
        children: <Widget>[
          for (int i = 0; i < 5; i++)
            Card(
              child: FittedBox(
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(_colors[i], BlendMode.srcIn),
                  child: FlutterLogo(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
