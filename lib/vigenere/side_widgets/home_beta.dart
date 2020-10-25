import 'package:flutter/material.dart';

import '../../ceasar/home_ceasar.dart';
import 'home_vigenere2.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Animation rotateAnim;
  Animation degOneAnim, degTwoAnim;
  AnimationController _controller;

  double getRadians(double degree) => degree / 57.3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 750));
    degOneAnim = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 75.0),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 75.0)
    ]).animate(_controller);
    degTwoAnim = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem(tween: Tween(begin: 1.4, end: 1.0), weight: 45.0)
    ]).animate(_controller);
    rotateAnim = Tween(begin: 90.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              right: 15,
              bottom: 20,
              child: Stack(
                children: [
                  myTransform(
                    270,
                    degOneAnim,
                    rotateAnim,
                    CircularButton(
                      color: Colors.blue,
                      icon: Icon(Icons.search),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeCeasar()));
                      },
                    ),
                  ),
                  myTransform(
                    225,
                    degTwoAnim,
                    rotateAnim,
                    CircularButton(
                      color: Colors.black,
                      icon: Icon(Icons.search, color: Colors.white),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeVigenere2()));
                      },
                    ),
                  ),
                  Transform(
                    transform: Matrix4.rotationZ(getRadians(rotateAnim.value)),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: Colors.blue,
                      icon: Icon(Icons.whatshot),
                      onTap: () {
                        _controller.isCompleted
                            ? _controller.reverse()
                            : _controller.forward();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myTransform(double radians, Animation degAnim, Animation rotateAnim,
      CircularButton myButton) {
    return Transform.translate(
      offset: Offset.fromDirection(getRadians(radians), degAnim.value * 100),
      child: Transform(
        transform: Matrix4.rotationZ(getRadians(rotateAnim.value))
          ..scale(degAnim.value),
        alignment: Alignment.center,
        child: myButton,
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final Color color;
  final Icon icon;
  final Function onTap;

  const CircularButton({Key key, this.color, this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: IconButton(icon: icon, onPressed: onTap),
    );
  }
}