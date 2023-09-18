import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:skilldren/views/Login_SingUp/login.dart';

class AnimationTest extends StatefulWidget {
  const AnimationTest({Key? key}) : super(key: key);

  @override
  State<AnimationTest> createState() => _AnimationTestState();
}

class _AnimationTestState extends State<AnimationTest> {
  final GlobalKey<AnimatorWidgetState> _key1 = GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _key2 = GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _key3 = GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _key4 = GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _key5 = GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _key6 = GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _key7 = GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _key8 = GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _key9 = GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _key10 =
      GlobalKey<AnimatorWidgetState>();
  final GlobalKey<AnimatorWidgetState> _key11 =
      GlobalKey<AnimatorWidgetState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RubberBand(
                key: _key1,
                child: letsgoButton(ontap: () async {
                  _key1.currentState!.forward();
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => const Login()));
                })),
            const SizedBox(
              height: 10,
            ),
            Bounce(
                key: _key2,
                child: letsgoButton(ontap: () {
                  _key2.currentState!.forward();
                })),
            const SizedBox(
              height: 10,
            ),
            Flash(
                key: _key3,
                child: letsgoButton(ontap: () {
                  _key3.currentState!.forward();
                })),
            const SizedBox(
              height: 10,
            ),
            HeadShake(
                key: _key4,
                child: letsgoButton(ontap: () {
                  _key4.currentState!.forward();
                })),
            const SizedBox(
              height: 10,
            ),
            HeartBeat(
                key: _key5,
                child: letsgoButton(ontap: () {
                  _key5.currentState!.forward();
                })),
            const SizedBox(
              height: 10,
            ),
            Jello(
                key: _key6,
                child: letsgoButton(ontap: () {
                  _key6.currentState!.forward();
                })),
            const SizedBox(
              height: 10,
            ),
            Pulse(
                key: _key7,
                child: letsgoButton(ontap: () {
                  _key7.currentState!.forward();
                })),
            const SizedBox(
              height: 10,
            ),
            Shake(
                key: _key8,
                child: letsgoButton(ontap: () {
                  _key8.currentState!.forward();
                })),
            const SizedBox(
              height: 10,
            ),
            Swing(
                key: _key9,
                child: letsgoButton(ontap: () {
                  _key9.currentState!.forward();
                })),
            const SizedBox(
              height: 10,
            ),
            Tada(
                key: _key10,
                child: letsgoButton(ontap: () {
                  _key10.currentState!.forward();
                })),
            const SizedBox(
              height: 10,
            ),
            Wobble(
                key: _key11,
                child: letsgoButton(ontap: () {
                  _key11.currentState!.forward();
                })),
            const SizedBox(
              height: 10,
            ),
            
          ],
        ),
      ),
    );
  }
}
