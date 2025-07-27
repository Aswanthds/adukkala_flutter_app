import 'dart:convert';
import 'dart:developer';

import 'package:adukkala_app/models/recipe_details.dart';

import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class DishesProvider extends ChangeNotifier {
  List<RecipeDetails> searchResults = [];

  Future<void> fetchIndianRecipes({String? query}) async {}
}
