import 'package:adukkala_app/controller/dishes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<String> _dummyRecipes = [
    'Spicy Chicken Curry',
    'Paneer Butter Masala',
    'Fish Fry with Masala',
    'Veg Pulao',
    'Beef Roast',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text('🧑‍🍳 ChefMate'),
        backgroundColor: const Color(0xFFFF6B6B),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          const SizedBox(height: 10),
          Expanded(child: _buildRecipeList()),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for dishes...',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          Provider.of<DishesProvider>(
            context,
            listen: false,
          ).fetchSouthIndianRecipes(value);
        },
      ),
    );
  }

  Widget _buildRecipeList() {
    return Consumer<DishesProvider>(
      builder: (context, state, _) {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: state.searchResults.length,
          itemBuilder: (context, index) {
            var item = state.searchResults[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 3,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color(0xFFFF6B6B),
                  child: Image.network(
                    item.image ?? '',
                    // style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(item.title ?? "Title"),

                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/recipeDetail',
                    arguments: _dummyRecipes[index],
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: const Color(0xFFFF6B6B),
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        setState(() => _currentIndex = index);
        // Handle navigation if needed
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'My Recipes'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
      ],
    );
  }
}
