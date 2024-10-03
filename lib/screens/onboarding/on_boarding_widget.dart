import "package:flutter/material.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";
import "on_boarding_model.dart";

Widget buildBoardingItem(
    BoardingModel model, var boardingController, List boarding) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image(
        image: AssetImage(
          model.title,
        ),
      ),
      const SizedBox(height: 10),
      Text(
        model.body,
        style: const TextStyle(
          color: Color(0xff4D4D4D),
          fontSize: 22,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
      Expanded(
        child: Image(
          image: AssetImage(model.image),
        ),
      ),
      const SizedBox(height: 50),
      Center(
        child: SmoothPageIndicator(
          controller: boardingController,
          effect: const ExpandingDotsEffect(
            activeDotColor: Color(0xff25D366),
            dotColor: Colors.grey,
            dotHeight: 10,
            dotWidth: 10,
            spacing: 5,
          ),
          count: boarding.length,
        ),
      ),
      const SizedBox(height: 20),
    ],
  );
}
