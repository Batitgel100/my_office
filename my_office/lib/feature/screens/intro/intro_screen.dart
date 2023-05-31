import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_office/feature/constants/theme.dart';
import 'package:my_office/feature/screens/login/loginpage.dart';
import 'package:my_office/service/auth.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offAll(() => AuthViewModel());
                      },
                      child: const Text(
                        'Алгасах',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PageView(
                    controller: controller,
                    children: [
                      IntroPage(
                        title: RichText(
                          text: const TextSpan(
                            text: ' ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 32,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.mainColor,
                                  fontSize: 32,
                                ),
                              ),
                              TextSpan(
                                text: '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 32,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IntroPage(
                        title: RichText(
                          text: const TextSpan(
                            text: '',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: AppColors.mainColor,
                              fontSize: 32,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 32,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IntroPage(
                        title: RichText(
                          text: const TextSpan(
                            text: ' ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 32,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '!',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.mainColor,
                                  fontSize: 32,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Center(
                                //Page шилжилтийн indicator
                                child: SmoothPageIndicator(
                                  controller: controller,
                                  count: 3,
                                  effect: const ExpandingDotsEffect(
                                    activeDotColor: AppColors.mainColor,
                                    dotColor: AppColors.mainColor,
                                    dotHeight: 15,
                                    dotWidth: 20,
                                    spacing: 10,
                                  ),
                                  onDotClicked: (index) =>
                                      controller.animateToPage(
                                    index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            FloatingActionButton.extended(
                              backgroundColor: AppColors.mainColor,
                              onPressed: () {
                                checkNextPage();
                              },
                              label: SizedBox(
                                width: 70,
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                ),
                              ),
                            ),

                            // CustomIntroButton(onTap: (){checkNextPage();},   icon: Icon(
                            //   Icons.arrow_forward_ios,
                            //   size: 18,
                            //   color: Colors.black,
                            // ),
                            //   height: 60,
                            //   width: 60,
                            //   color: MyColors.orange,
                            // ),
                            // RoundButtonTest(
                            //   clickAction: () {
                            //     checkNextPage();
                            //   },
                            //   icon:
                            //   Icon(
                            //     Icons.arrow_forward_ios,
                            //     size: 18,
                            //     color: Colors.black,
                            //   ),
                            //   bgColor: MyColors.orange,
                            //   border: Border.all(
                            //     width: 2,
                            //     color: Colors.black,
                            //   ),
                            //   boxShadow: BoxShadow(
                            //     color: Colors.black,
                            //     offset: Offset(0, 4),
                            //   ),
                            // ),
                            const SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkNextPage() {
    double? currentPage = controller.page;
    if ((currentPage ?? 0) < 2) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      //  End page
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const LoginPage()));
    }
  }
}

class IntroPage extends StatelessWidget {
  final Widget title;

  const IntroPage({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 35,
              ),
              title,
            ],
          ),
          const SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }
}
