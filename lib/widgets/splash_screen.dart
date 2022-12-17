import 'dart:async';
import 'package:fl_mis_vacunas/widgets/slivers_demo.dart';
import 'package:flutter/material.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  VideoState createState() => VideoState();
}



class VideoState extends State<Splash> with SingleTickerProviderStateMixin{

  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration =  const Duration(seconds: 2);
    return  Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const SliversDemo(),));
  }

  @override
  void initState() {
    super.initState();



    animationController =  AnimationController(
        vsync: this, duration:  const Duration(seconds: 1));
    animation =
     CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [

              Padding(padding: const EdgeInsets.only(bottom: 30.0),child: Image.asset('assets/logo_1.png',height: 25.0,fit: BoxFit.scaleDown,))

            ],),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Image.asset(
                'assets/logo_mvacuna.png',
                width: animation.value * 250,
                height: animation.value * 250,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
