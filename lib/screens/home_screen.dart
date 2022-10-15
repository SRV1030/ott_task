import 'package:flutter/material.dart';
import 'package:pip_flutter/pipflutter_player.dart';
import 'package:pip_flutter/pipflutter_player_configuration.dart';
import 'package:pip_flutter/pipflutter_player_controller.dart';
import 'package:pip_flutter/pipflutter_player_data_source.dart';
import 'package:pip_flutter/pipflutter_player_data_source_type.dart';

import '../widgets/tap_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PipFlutterPlayerController pipFlutterPlayerController;
  final GlobalKey pipFlutterPlayerKey = GlobalKey();

  @override
  void initState() {
    PipFlutterPlayerConfiguration pipFlutterPlayerConfiguration =
        const PipFlutterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
    );
    PipFlutterPlayerDataSource dataSource = PipFlutterPlayerDataSource(
      PipFlutterPlayerDataSourceType.network,
      'http://techslides.com/demos/sample-videos/small.mp4',
    );
    pipFlutterPlayerController =
        PipFlutterPlayerController(pipFlutterPlayerConfiguration);
    pipFlutterPlayerController.setupDataSource(dataSource);
    pipFlutterPlayerController
        .setPipFlutterPlayerGlobalKey(pipFlutterPlayerKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vidoe with Pip"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: PipFlutterPlayer(
                controller: pipFlutterPlayerController,
                key: pipFlutterPlayerKey,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TapButton(
                  pipFlutterPlayerController: pipFlutterPlayerController,
                  pipFlutterPlayerKey: pipFlutterPlayerKey,
                  ontap: () {
                    pipFlutterPlayerController
                        .enablePictureInPicture(pipFlutterPlayerKey);
                  },
                  title: 'Show Pip',
                ),
                TapButton(
                  pipFlutterPlayerController: pipFlutterPlayerController,
                  pipFlutterPlayerKey: pipFlutterPlayerKey,
                  ontap: () {
                    pipFlutterPlayerController
                        .disablePictureInPicture();
                  },
                  title: "Disable PiP",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
