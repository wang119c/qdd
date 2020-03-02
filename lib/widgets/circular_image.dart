import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final double width, height;
  final ImageProvider image ;

  const CircularImage({Key key, this.width = 40 , this.height = 40 , @required this.image}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: image),
        boxShadow: [
          BoxShadow(
            blurRadius: 0,
            color: Colors.black45
          )
        ]
      ),
    );
  }
}
