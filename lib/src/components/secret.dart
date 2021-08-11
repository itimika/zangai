import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:sample01/src/common/widgets.dart';

class Secret extends StatelessWidget {
  const Secret({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: const Center(
        child: RiveAnimation.asset(
          'assets/pencil.riv',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
