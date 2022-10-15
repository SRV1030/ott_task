import 'package:flutter/material.dart';
import 'package:pip_flutter/pipflutter_player.dart';
import 'package:pip_flutter/pipflutter_player_configuration.dart';
import 'package:pip_flutter/pipflutter_player_controller.dart';
import 'package:pip_flutter/pipflutter_player_data_source.dart';
import 'package:pip_flutter/pipflutter_player_data_source_type.dart';
import '../constants/colors.dart' as schemes;

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
                        .enablePictureInPicture(pipFlutterPlayerKey);
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
