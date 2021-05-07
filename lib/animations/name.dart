import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NameItem extends AnimatedWidget {
  final image;
  final title;
  final age;
  final count;
  final gradient;
  final color;

  NameItem({
    Key key,
    Animation<double> animation,
    this.image,
    this.title,
    this.age,
    this.count,
    this.gradient,
    this.color,
  }) : super(
          key: key,
          listenable: animation,
        );
  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return InkWell(
      onTap: () {},
      child: Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Container(
              height: 90.0,
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  12.0,
                ),
                gradient: gradient,
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: color,
                    blurRadius: 5.0,
                    spreadRadius: 0.4,
                    offset: Offset(
                      0.7,
                      3.0,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: animation.value,
              top: 0.0,
              child: Hero(
                tag: title,
                child: CachedNetworkImage(
                  imageUrl: image,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1.0,
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Positioned(
              top: 20.0,
              left: 80.0,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'google',
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              top: 40.0,
              left: 80.0,
              child: Text(
                'Age: ' + age + ' years',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'google',
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              top: 60.0,
              left: 80.0,
              child: Text(
                'Count: ' + count,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'google',
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
