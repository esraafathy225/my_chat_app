import 'package:flutter/material.dart';
import 'package:my_chat_app/screens/login_screen.dart';
import 'on_boarding_model.dart';
import 'on_boarding_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardingController = PageController();
  bool isLast = false;
  bool isActive = false;
  bool skipIsActive = false;

  @override
  Widget build(BuildContext context) {
    List<BoardingModel> boarding = [
      BoardingModel(
        title: "assets/images/Ask me anything.png",
        image: "assets/images/image1.png",
        body: "You'd like, in any language, and I'll give you the answers.",
        endImage: "assets/images/second_right.png",
      ),
      BoardingModel(
        title: "assets/images/Generate any image.png",
        image: "assets/images/image2.png",
        body: "Create beautiful art and images with AI.",
        endImage: "assets/images/complet_right.png",
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                skipIsActive = true;
              });
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>  LoginScreen(),
                ),
              );
            },
            child: Text(
              "Skip",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                color: skipIsActive
                    ? const Color(0xff4D4D4D)
                    : const Color(0xff25D366),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardingController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildBoardingItem(
                    boarding[index], boardingController, boarding),
                itemCount: boarding.length,
              ),
            ),
            isLast
                ? InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Image.asset(
                      "assets/images/complet_right.png",
                      width: 100.0,
                      height: 100.0,
                    ),
                  )
                : InkWell(
                    onTap: () {
                      boardingController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Image.asset(
                      "assets/images/second_right.png",
                      width: 110.0,
                      height: 110.0,
                    ),
                  ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
