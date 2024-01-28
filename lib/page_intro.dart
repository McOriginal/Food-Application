import 'package:flutter/material.dart';
import 'package:food_app/user/screen/food_categorie_screen.dart';
import 'package:food_app/validator_button.dart';

class PageIntroAnimation extends StatefulWidget {
  const PageIntroAnimation({super.key});

  @override
  State<PageIntroAnimation> createState() => _PageIntroAnimationState();
}

class _PageIntroAnimationState extends State<PageIntroAnimation> {
// Create a PageController to control the PageView
  final PageController _pageController = PageController(initialPage: 0);

  // Define the pages of the app intro as a list of maps
  final List _pages = [
    {
      'image': 'assets/images/order.png',
      'title': 'Welcome to My App',
      'description': 'This is a description of my app'
    },
    {
      'image': 'assets/images/cour.png',
      'title': 'Explore Features',
      'description': 'Here is a brief overview of what the app can do'
    },
    {
      'image': 'assets/images/reçu.png',
      'title': 'Get Started',
      'description': 'Let\'s get started!'
    }
  ];

  // Track the index of the current page
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Create a PageView to display the intro pages
            PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() {
                  // Update the current page index when the page changes
                  _currentPageIndex = index;
                });
              },
              // Build each page using the data in the _pages list
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      _pages[index]['image'],
                      height: MediaQuery.of(context).size.width,
                      width: double.infinity,
                    ),
                    const SizedBox(height: 32.0),
                    Text(
                      _pages[index]['title'],
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Text(
                        _pages[index]['description'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            // Add circles to indicate the current page
            Positioned(
              bottom: 100,
              left: MediaQuery.of(context).size.width / 2.5,
              child: Row(
                children: [
                  for (int i = 0; i < _pages.length; i++)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      height: 12.0,
                      width: 12.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: i == _currentPageIndex
                            ? Colors.deepOrange
                            : Colors.grey.shade300,
                      ),
                    ),
                ],
              ),
            ),
            _currentPageIndex == _pages.length - 1
                ?
                // Add a button to move to the next page or get started
                Positioned(
                    bottom: 10,
                    right: 55,
                    child: ValidatorButton(
                      text: "Commencer",
                      textStyle: const TextStyle(
                        letterSpacing: 1,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      color: Colors.deepOrange,
                      function: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FoodHomeScreen()));
                      },
                    ))
                : Positioned(
                    bottom: 10,
                    right: 55,
                    child: ValidatorButton(
                      text: "Suivant",
                      textStyle: const TextStyle(
                        letterSpacing: 1,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      color: Colors.deepOrange,
                      function: () {
                        // Move to the next page when the arrow button is tapped
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                    ))

            //
          ],
        ),
      ),
    );
  }
}
