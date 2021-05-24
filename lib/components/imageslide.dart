import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSliders extends StatelessWidget {
  const ImageSliders({
    Key key,
    @required this.imageList,
  }) : super(key: key);

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enableInfiniteScroll: true,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      items: imageList
          .map((e) => ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    e,
                    width: double.infinity,
                    height: 350,
                    fit: BoxFit.cover,
                  )
                ],
              )))
          .toList(),
    );
  }
}
