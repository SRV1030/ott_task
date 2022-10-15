
import 'package:flutter/material.dart';
import 'package:pip_flutter/pipflutter_player_controller.dart';
import '../constants/colors.dart' as schemes;


class TapButton extends StatelessWidget {
  TapButton(
      {Key? key,
      required this.pipFlutterPlayerController,
      required this.pipFlutterPlayerKey,
      required this.title,
      required this.ontap})
      : super(key: key);

  final PipFlutterPlayerController pipFlutterPlayerController;
  final GlobalKey<State<StatefulWidget>> pipFlutterPlayerKey;
  final String title;
  void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: schemes.Colors.purple,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
