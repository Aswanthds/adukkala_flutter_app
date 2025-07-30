import 'dart:convert';

import 'package:adukkala_app/utils/urls.dart';
import 'package:http/http.dart' as http;
import 'package:adukkala_app/models/recipe_details.dart';

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class DishesProvider extends ChangeNotifier {
  List<RecipeDetails> searchResults = [];

  Future<List<RecipeDetails>> fetchSouthIndianRecipes(String keyword) async {
    if (keyword.isNotEmpty) {
      keyword += "south%20india,";
    }
    final url = Uri.parse(
      "https://api.spoonacular.com/recipes/complexSearch?query=$keyword&number=10&apiKey=$apiKeysp",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results']; // List of recipes
    } else {
      throw Exception("Failed to load recipes");
    }
  }
}
