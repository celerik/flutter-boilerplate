// @packages
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

/// This class represents a carousel widget. For this we are using carousel_slider library that
/// allows us to take a prebuilt carousel and then customized this carousel to our purpose.
class CarouselWidget extends StatefulWidget {
  /// List of images that are going to appear inside the carousel.
  final List<String> imgList;

  /// Child that goes between the carousel and the shape indicator.
  final Widget? child;

  /// Carousel shape that indicated the state of the carousel.
  final CarouselCircles carouselCircles;

  /// Content for the carousel which goes inside the images.
  final Widget? carouselCardContent;

  /// Width for the carousel.
  final double? width;

  /// Height for the carousel.
  final double? height;

  const CarouselWidget({
    Key? key,
    this.child,
    this.carouselCardContent,
    this.height,
    this.width,
    required this.carouselCircles,
    required this.imgList,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CarouselState();
}

class _CarouselState extends State<CarouselWidget> {
  int _current = 0;

  List<Widget> imageSliders(List<String> list) {
    return list.map(
      (item) {
        return Container(
          margin: EdgeInsets.all(5),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Stack(
              children: <Widget>[
                Image.network(
                  item,
                  fit: BoxFit.cover,
                  height: widget.height ?? MediaQuery.of(context).size.width,
                  width: widget.width ?? MediaQuery.of(context).size.width,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: widget.carouselCardContent,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: imageSliders(widget.imgList),
        options: CarouselOptions(
          viewportFraction: 1,
          aspectRatio: 2,
          height: widget.height,
          onPageChanged: (index, reason) {
            setState(() => _current = index);
          },
        ),
      ),
      widget.child ?? SizedBox.shrink(),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.imgList.map((url) {
          final index = widget.imgList.indexOf(url);

          return Container(
            width: widget.carouselCircles.width,
            height: widget.carouselCircles.height,
            margin: widget.carouselCircles.margin,
            decoration: BoxDecoration(
              shape: widget.carouselCircles.boxShape,
              color: _current == index
                  ? widget.carouselCircles.selectedColor
                  : widget.carouselCircles.unSelectedColor,
            ),
          );
        }).toList(),
      ),
    ]);
  }
}

/// This class is a model for the properties which are the indicator circles that appears below
/// the carousel indicating the progress and the current position. Feel free to modify or add more
/// properties.
class CarouselCircles {
  /// Circles width for the given shape (Circle, triangle, etc.).
  double? width;

  /// Circles height for the given shape (Circle, triangle, etc.).
  double? height;

  /// Margin for the given shape. For example use: EdgeInsets.symmetric(vertical: 10, horizontal: 2).
  EdgeInsetsGeometry? margin;

  /// Shape for the element that indicates the carousel state.
  BoxShape boxShape;

  /// Color for the shape that are not selected.
  Color unSelectedColor;

  /// Color for the shape that is currently selected.
  Color selectedColor;

  CarouselCircles({
    this.margin,
    required this.width,
    required this.height,
    required this.boxShape,
    required this.selectedColor,
    required this.unSelectedColor,
  });
}

