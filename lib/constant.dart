// TextStyle baloobhai = GoogleFonts.montserrat();

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

String baseUrl = "https://skilldren.com/skilldren/api/";
// TextStyle baloobhai2 = GoogleFonts.anton();
String grandstander = 'Grandstander';
String balooBhai2 = 'BalooBhai2';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension PaddingExtention on Widget {
  Padding paddingAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }
}

extension SizedBoxExtention on num {
  SizedBox get pw => SizedBox(
        width: toDouble(),
      );
  SizedBox get ph => SizedBox(
        width: toDouble(),
      );
}

List favlList = [];
AudioPlayer player = AudioPlayer();

class Sound {
  static play(audioasset) async {
    Vibration.vibrate(amplitude: 128, duration: 100);

    ByteData bytes = await rootBundle.load(audioasset); //load sound from assets
    Uint8List soundbytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    int result = await player.playBytes(soundbytes);
    if (result == 1) {
      debugPrint("Sound playing successful.");
    } else {
      debugPrint("Error while playing sound.");
    }
  }
}

class Audio {
  static String waterDrop =
      'assets/audio/Water-Bloop-8CloseDistance-www.FesliyanStudios.com.mp3';
}
