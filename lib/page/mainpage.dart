part of '../import_path/import_path.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50),
          Card(
            elevation: 1,
            child: SizedBox(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextForm(
                  hint: 'Seach Product',
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.black,
                  ),
                  suffixIcon: Icon(
                    Icons.tune,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 22,
          ),
          HomeGategoriesWidget(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Product',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
          ),
          Homeproductswidget(),
        ],
      ),
    ));
  }
}
