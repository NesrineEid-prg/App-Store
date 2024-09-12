part of '../import_path/import_path.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   actions: [
        //     GestureDetector(
        //       onTap: () {
        //         showSearch(context: context, delegate: SearchProduct(ref: ref));
        //       },
        //       child: const Padding(
        //         padding: EdgeInsets.all(8.0),
        //         child: Icon(
        //           Icons.search,
        //           size: 25,
        //           color: Colors.black,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Card(
              elevation: 1,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextForm(
                    hint: 'Seach Product',
                    prefixIcon: GestureDetector(
                      onTap: () {
                        showSearch(
                            context: context,
                            delegate: SearchProduct(ref: ref));
                      },
                      child: const Icon(
                        Icons.search,
                        size: 22,
                        color: Colors.black,
                      ),
                    ),
                    suffixIcon: const Icon(
                      Icons.tune,
                      size: 22,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            const HomeGategoriesWidget(),
            const Padding(
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
            const Homeproductswidget(),
          ],
        ),
      ),
    ));
  }
}
