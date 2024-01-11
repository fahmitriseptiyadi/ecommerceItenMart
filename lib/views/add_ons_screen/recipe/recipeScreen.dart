import 'package:ItenMart/consts/colors.dart';
import 'package:ItenMart/views/add_ons_screen/recipe/models/recipe.api.dart';
import 'package:ItenMart/views/add_ons_screen/recipe/models/recipe.dart';
import 'package:ItenMart/views/add_ons_screen/recipe/views/widgets/recipe_card.dart';
import 'package:flutter/material.dart';

class recipeScreen extends StatefulWidget {
  @override
  _recipeScreenState createState() => _recipeScreenState();
}

class _recipeScreenState extends State<recipeScreen> {
  List<Recipe> _recipes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text(
                'Food Recipe',
                style: TextStyle(color: Colors.black), // Warna teks hitam
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipes[index].name,
                      cookTime: _recipes[index].totalTime,
                      rating: _recipes[index].rating.toString(),
                      thumbnailUrl: _recipes[index].images);
                },
              ));
  }
}
