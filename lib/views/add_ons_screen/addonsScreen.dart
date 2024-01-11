import 'package:ItenMart/consts/colors.dart';
import 'package:ItenMart/consts/lists.dart';
import 'package:ItenMart/consts/styles.dart';
import 'package:ItenMart/main.dart';
import 'package:ItenMart/views/add_ons_screen/bmi/Screens/input_page.dart';
import 'package:ItenMart/views/add_ons_screen/calculator/calc.dart';
import 'package:ItenMart/views/add_ons_screen/cus_list/CustomerScreen.dart';
import 'package:ItenMart/views/add_ons_screen/recipe/recipeScreen.dart';
import 'package:ItenMart/views/add_ons_screen/scanbarcode/scanBarcodeScreen.dart';
import 'package:ItenMart/views/add_ons_screen/weather/main2.dart';
import 'package:ItenMart/views/add_ons_screen/nba/nbaScreen.dart';
import 'package:flutter/material.dart';

class AddonsScreen extends StatelessWidget {
  const AddonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add-ons",
          style: TextStyle(fontFamily: bold, color: Colors.white),
        ),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: 7,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          mainAxisExtent: 200,
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                // Implement navigation to different screens based on the index.
                if (index == 0) {
                  // Navigate to the first screen.
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return scanBarcodeScreen();
                  }));
                } else if (index == 1) {
                  // Navigate to the second screen.
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CalculatorScreen();
                  }));
                } else if (index == 2) {
                  // Navigate to the third screen.
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return bmiCalcScreen();
                  }));
                } else if (index == 3) {
                  // Navigate to the third screen.
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CustomerScreen();
                  }));
                } else if (index == 4) {
                  // Navigate to the third screen.
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return recipeScreen();
                  }));
                } else if (index == 5) {
                  // Navigate to the third screen.
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MyApp2();
                  }));
                }else if (index == 6) {
                  // Navigate to the third screen.
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return nbaScreen();
                  }));
                }
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20.0), // Ubah radius sesuai keinginan
                ),
                elevation: 5,
                child: Column(
                  children: [
                    Image.asset(
                      addonsImages[index],
                      height: 120,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Text(
                      addonsList[index],
                      style: TextStyle(
                        color: darkFontGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ));
        },
      ),
      backgroundColor: redColor,
    );
  }
}
