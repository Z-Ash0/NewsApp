import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/categories_model.dart';
import 'package:news_app_ui_setup/views/news_tiles_view_builder.dart';
import 'package:news_app_ui_setup/widgets/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentIndex = 3;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  onTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOutCubic);
    });
  }

  //* List of category objects
  final List<CategoryModel> categoriesModelList = [
    CategoryModel(
        label: 'Business', icon: const Icon(Icons.currency_bitcoin_rounded)),
    CategoryModel(
        label: 'Entertainment', icon: const Icon(Icons.movie_rounded)),
    CategoryModel(label: 'Health', icon: const Icon(Icons.vaccines_rounded)),
    CategoryModel(label: 'General', icon: const Icon(Icons.public_outlined)),
    CategoryModel(
        label: 'Sports', icon: const Icon(Icons.sports_football_rounded)),
    CategoryModel(
        label: 'Technology', icon: const Icon(Icons.desktop_mac_outlined)),
    CategoryModel(label: 'Science', icon: const Icon(Icons.biotech)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NewsAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          itemBuilder: (context, index) =>
              NewsTilesViewBuilder(category: categoriesModelList[index].label),
          itemCount: categoriesModelList.length,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTapped,
        items: bottomNavigationBarItems(categoriesModelList),
        selectedItemColor: const Color(0xFFCBDF1A),
        unselectedItemColor: const Color(0xFF727171),
      ),
    );
  }

  static List<BottomNavigationBarItem> bottomNavigationBarItems(
          List<CategoryModel> categoriesList) =>
      categoriesList
          .map((category) => BottomNavigationBarItem(
                icon: category.icon,
                label: category.label,
              ))
          .toList();
}
