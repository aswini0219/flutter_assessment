import 'package:flutter/material.dart';
import 'package:flutter_assessment/scnd_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

// Constants for reusability and consistency
const primaryColor = Color(0xFF421075);
const iconSize = 24.0;
const actionContainerSize = 40.0;
const actionMargin = EdgeInsets.only(right: 16.0);

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool isLoading=false;
  final List<String> categories = ['All', 'Delivery Box', 'Catering', 'Meal'];
  int selectedIndex = 1; // No category box selected by default
  void _fetchProperties() async{
    setState(() {
      isLoading = true;
    });
    await Future.delayed((Duration(seconds: 2)));
    setState(() {
      isLoading = false;
    });}

    @override
    void initState(){
      super.initState();
      _fetchProperties();
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Hyderabad',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        leading: Transform.rotate(
          angle: math.pi / 4,
          child: const Icon(
            Icons.navigation_rounded,
            color: Colors.white,
            size: iconSize,
          ),
        ),
        actions: [
          Container(
            margin: actionMargin,
            width: actionContainerSize,
            height: actionContainerSize,
            decoration: BoxDecoration(
              color: Colors.deepPurple[400],
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.headset_mic_outlined,
              color: Colors.white,
              size: iconSize,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 330,
              width: double.infinity,
              color: primaryColor,
              child: Column(
                children: [
                  // Categories ListView
                  Container(
                    color: primaryColor,
                    height: 60,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: selectedIndex == 0 && index == 0
                                    ? const Color(0xFF7401E9)
                                    : const Color(0xFF440486),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                categories[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Content Container
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 0,
                          right: 100,
                          child: Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 260),
                          child: Divider(
                            color: Colors.deepPurple[400],
                            thickness: 2,
                            height: 10,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Exclusive',
                              style: GoogleFonts.ptSerif(
                                fontSize: 25,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 260, right: 15),
                          child: Divider(
                            color: Colors.deepPurple[400],
                            thickness: 2,
                            height: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      'Delivery Box',
                      style: GoogleFonts.italiana(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondScreen()),
                      );
                      print('Order Now pressed');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: primaryColor,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text(
                      'ORDER NOW',
                      style: GoogleFonts.aBeeZee(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Bottom half: White background with cards
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 10,left: 10),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Card(
                              color: const Color(0xFFF3F2F5),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15, top: 10,),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Delivery Box',
                                      style: GoogleFonts.aBeeZee(
                                        fontSize: 13,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      '10 - 150 guests',
                                      style: GoogleFonts.aBeeZee(
                                        fontSize: 11,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Image.asset(
                                      'assets/img.png',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Card(
                                    color: const Color(0xFFF3F2F5),
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10, top: 10, right: 5, bottom: 0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Meal Box',
                                            style: GoogleFonts.aBeeZee(
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            '10 to 1500+ guests',
                                            style: GoogleFonts.aBeeZee(
                                              fontSize: 11,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 80),
                                            child: Image.asset(
                                              'assets/img_1.png',
                                              // height: 61,
                                              // width: 300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Expanded(
                                  flex: 1,
                                  child: Card(
                                    color: const Color(0xFFF3F2F5),
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15, top: 2, right: 5, bottom: 0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Catering',
                                            style: GoogleFonts.aBeeZee(
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),

                                          Text(
                                            '10 to 1500+ guests',
                                            style: GoogleFonts.aBeeZee(
                                              fontSize: 11,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 80,),
                                            child: Image.asset(
                                              'assets/img_2.png',
                                              // height: 100,
                                              // width: 500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Second Row: 3 equal cards
                    Stack(
                      children: [
                        SizedBox(
                          height: 120,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Card(
                                  color: const Color(0xFFF3F2F5),
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Find My Platter',
                                          style: GoogleFonts.aBeeZee(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                flex: 1,
                                child: Card(
                                  color: const Color(0xFFF3F2F5),
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Create Menu',
                                          style: GoogleFonts.aBeeZee(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                flex: 1,
                                child: Card(
                                  color: const Color(0xFFF3F2F5),
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Discounted Platters',
                                          style: GoogleFonts.aBeeZee(
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // New card overlapping the bottom half
                        Positioned(
                          bottom: 3,
                          left: 0,
                          right: 0,
                          child: Card(
                            color: const Color(0xFFF3F2F5),
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  //Image
                                  Image.asset(
                                    'assets/img_3.png',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(width: 10),
                                  // Title and subtitle
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Special Offer',
                                          style: GoogleFonts.aBeeZee(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Get your favorite platter now',
                                          style: GoogleFonts.aBeeZee(
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Small card with "20 mins"
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF421075).withOpacity(0.6), // Use primaryColor
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      '20 mins',
                                      style: GoogleFonts.aBeeZee(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            ),
        if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),

      ),

    );
  }
}