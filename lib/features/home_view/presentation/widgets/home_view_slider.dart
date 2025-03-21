import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/utils/app_images.dart';

class HomeViewSlider extends StatefulWidget {
  const HomeViewSlider({super.key});

  @override
  State<HomeViewSlider> createState() => _HomeViewSliderState();
}

class _HomeViewSliderState extends State<HomeViewSlider> {
  late PageController pageController;

  double currentPage = 0.0;
  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round().toDouble();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView(
            controller: pageController,

            children: [
              Image.asset(Assets.imagesSlideOne),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Image.asset(Assets.imagesSlideTwo),
              ),
              Image.asset(Assets.imagesSlideThree),
            ],
          ),
        ),
        SizedBox(height: 12),
        DotsIndicator(
          dotsCount: 3,
          position: currentPage,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeColor: Color(0xff989898),
            color: Color(0xffE3E3E3),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}
