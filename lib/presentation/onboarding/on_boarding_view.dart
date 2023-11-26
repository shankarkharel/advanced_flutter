import 'package:advanced_flutter/presentation/onboarding/onboarding_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/model.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/route_manager.dart';
import '../resources/string_manager.dart';
import '../resources/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController pageController = PageController(initialPage: 0);
  final OnBoardingViewModel _boardingViewModal = OnBoardingViewModel();

  void _bind() {
    _boardingViewModal.start();
  }

  Widget _getProperBottons(int index, int currentIndex) {
    if (index == currentIndex) {
      return GestureDetector(
        child: SvgPicture.asset(
            height: AppSize.s20, ImageAssets.onBoardingActivIndicatorHollow),
      );
    } else {
      return GestureDetector(
        child: SvgPicture.asset(
            height: AppSize.s17, ImageAssets.onBoardingActivIndicatorFilled),
      );
    }
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    // _boardingViewModal.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return StreamBuilder<SliderViewObject>(
        stream: _boardingViewModal.outputSliderViewObject,
        builder: (context, snapshot) {
          return getContentWidget(sliderViewObject: snapshot.data);
        },
      );
    });
  }

  Widget getContentWidget({SliderViewObject? sliderViewObject}) {
    if (sliderViewObject == null) {
      return const SizedBox(
        height: 0,
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        foregroundColor: ColorManager.white,
        elevation: AppSize.s0,
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: sliderViewObject.numOfSlides,
        itemBuilder: ((context, index) {
          return OnBoardingPage(sliderViewObject.sliderObject);
        }),
        onPageChanged: (index) {
          _boardingViewModal.onPageChanged(index);
        },
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                child: const Text(
                  AppStrings.buttonTextSkip,
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Container(
              color: ColorManager.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //back icon
                  IconButton(
                    onPressed: () {
                      pageController.animateToPage(
                          _boardingViewModal.goPrevious(),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),

                  //radios

                  Row(
                    children: [
                      for (int i = 0; i < sliderViewObject.numOfSlides; i++)
                        Padding(
                            padding: const EdgeInsets.all(AppPadding.p8),
                            child: _getProperBottons(
                                i, sliderViewObject.currentIndex))
                    ],
                  ),

                  //forward icon

                  IconButton(
                    onPressed: () {
                      pageController.animateToPage(_boardingViewModal.goNext(),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class OnBoardingPage extends StatelessWidget {
  final SliderObject boardingObject;
  const OnBoardingPage(this.boardingObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 0,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(boardingObject.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(boardingObject.subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium),
        ),
        const SizedBox(
          height: AppSize.s20,
        ),
        SizedBox(height: 300, child: SvgPicture.asset(boardingObject.image)),
      ],
    );
  }
}
