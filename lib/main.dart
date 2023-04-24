import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

void main() => runApp(const Xylophone());

class Xylophone extends StatelessWidget {
  const Xylophone({super.key});

  void playSound(int soundNumber) async {
    final Soundpool soundpool = Soundpool.fromOptions();
    final int soundId = await rootBundle
        .load('note$soundNumber.wav')
        .then((ByteData soundData) {
      return soundpool.load(soundData);
    });
    await soundpool.play(soundId);
  }

  Expanded keyNote({required Color color, required int soundNumber}) {
    return Expanded(
      child: ElevatedButton(
        child: null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
        onPressed: () {
          playSound(soundNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              keyNote(color: Colors.red, soundNumber: 1),
              keyNote(color: Colors.orange, soundNumber: 2),
              keyNote(color: Colors.yellow, soundNumber: 3),
              keyNote(color: Colors.green, soundNumber: 4),
              keyNote(color: Colors.teal, soundNumber: 5),
              keyNote(color: Colors.blue, soundNumber: 6),
              keyNote(color: Colors.purple, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
