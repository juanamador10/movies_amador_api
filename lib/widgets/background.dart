import 'package:flutter/material.dart';
import 'dart:math';

import 'package:movies_new/screens/details_screen.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);
  final boxDecoration = const BoxDecoration(
    gradient:LinearGradient(
      begin: Alignment.topCenter, 
      end: Alignment.bottomCenter, 
      stops:[0.2,0.8], 
      colors: [Color(0xff2E305F),
      Color(0xFF412B6A)]
      )
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: boxDecoration,
        ),
        const Positioned(
          top: -100,
          left: -30,
          child: _ColorBox())
      ],
    );
  }
}




class _ColorBox extends StatelessWidget {
  const _ColorBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi/5,
      child: Container(width: 360, height: 360, decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(colors: [Color.fromARGB(122, 78, 226, 191), Color.fromARGB(145, 145, 18, 135), Color.fromARGB(45,122,15, 45)])),),
    );
  }
}

class LeftAlingTitle extends StatelessWidget{
  final String title;

 const LeftAlingTitle ({Key? key, required this.title}):super (key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(title,
                          style: Theme.of(context).textTheme.headline6));
  }
}

class CastCard_ArrowIcon extends StatelessWidget{
  final String name;
  final String character;
 

  const CastCard_ArrowIcon ({Key? key, required this.name, required this.character}): super (key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
       constraints: const BoxConstraints(maxWidth: 301),
       child: Card(
        elevation: 0,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  const DetailsScreen(Idmovie: null,)));},
          child: SizedBox(
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.start,
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('$name',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                          textAlign: TextAlign.left),
                        Text('$character',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontSize: 12,
                          color: const Color(0xFF9A9BB2)),
                          textAlign: TextAlign.left)
                      ],
                    ),
                  ),
// ignore: prefer_const_constructors
                  Spacer(),
                  const Icon(Icons.arrow_forward_ios_sharp),
                ],
              ),
            )
          )
        ),
      )
    ) ;
  }
}

class ImageCast extends StatelessWidget{
  final double widthImage;
  final String Image_URL;
 
  const ImageCast({Key? key, required this.Image_URL, required this.widthImage}): super (key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image(image: NetworkImage(Image_URL), 
      width: widthImage));
  }
}