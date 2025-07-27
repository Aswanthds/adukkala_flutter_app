import 'package:flutter/material.dart';

class Recipe {
  final String emoji;
  final String title;
  final String duration;
  final String rating;
  final String servings;
  final String difficulty;
  final String description;

  Recipe({
    required this.emoji,
    required this.title,
    required this.duration,
    required this.rating,
    required this.servings,
    required this.difficulty,
    required this.description,
  });
}

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recipe Image (Emoji placeholder)
          Container(
            height: 120,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              gradient: LinearGradient(
                colors: [Color(0xFFFF9A9E), Color(0xFFFECFEF)],
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    recipe.emoji,
                    style: const TextStyle(fontSize: 32),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      recipe.duration,
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Recipe Info
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    _buildInfoChip('⭐ ${recipe.rating}'),
                    const SizedBox(width: 15),
                    _buildInfoChip('👥 ${recipe.servings} servings'),
                    const SizedBox(width: 15),
                    _buildInfoChip('🔥 ${recipe.difficulty}'),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  recipe.description,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF888888),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 12, color: Color(0xFF666666)),
    );
  }
}
