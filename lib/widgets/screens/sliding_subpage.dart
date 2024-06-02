import 'package:carousel_slider/carousel_slider.dart';
import 'package:creative_portsaid/main.dart';
import 'package:creative_portsaid/models/sliding_images.dart';
import 'package:flutter/material.dart';

class SlidingSubpage extends StatefulWidget {
  const SlidingSubpage({super.key, required this.images});

  final List<SlidingImages> images;

  @override
  State<SlidingSubpage> createState() => _SlidingSubpageState(images: images);
}

class _SlidingSubpageState extends State<SlidingSubpage> {
  _SlidingSubpageState({required this.images});

  final List<SlidingImages> images;

  final CarouselOptions options = CarouselOptions(
    height: 400,
    aspectRatio: 1,
    viewportFraction: 0.8,
    initialPage: 0,
    enableInfiniteScroll: true,
    reverse: false,
    autoPlay: true,
    autoPlayInterval: const Duration(seconds: 3),
    autoPlayAnimationDuration: const Duration(milliseconds: 800),
    autoPlayCurve: Curves.fastOutSlowIn,
    enlargeCenterPage: true,
    scrollDirection: Axis.horizontal,
  );

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      options: options,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  images[index].imgPath,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  images[index].caption,
                  style: const TextStyle(
                    fontSize: 20,
                    color: kBlueColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
