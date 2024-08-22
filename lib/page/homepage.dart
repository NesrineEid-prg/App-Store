part of '../import_path/import_path.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    void onItemTap(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    List<Widget> pages = [
      const MainPage(),
      const FavoritePage(),
      const Cartpage(),
      const ProfilePage()
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        currentIndex: selectedIndex,
        onTap: onItemTap,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.blue, size: 30),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.blue, size: 30),
              label: 'Favorite'),
          BottomNavigationBarItem(
            icon:
                Icon(Icons.shopping_bag_outlined, color: Colors.blue, size: 30),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.blue, size: 30),
              label: 'Setting')
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
