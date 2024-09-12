part of '../import_path/import_path.dart';

class ProductByCategoriePage extends ConsumerWidget {
  final String categoryName;
  const ProductByCategoriePage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(getProductbycategry(categoryName));

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: Theme.of(context).iconTheme,
        ),
        body: products.when(
            data: (data) => data.isNotEmpty
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                    ),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: data.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(2),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ProductDetailsPage(),
                                      settings: RouteSettings(
                                          arguments: data[index])));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Image.network(
                                      data[index].image!,
                                      fit: BoxFit.contain,
                                      height: 160,
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Center(
                                      child: Text(
                                        data[index].name!,
                                        style: const TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$${data[index].price}",
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Text("\$${data[index].oldPrice}",
                                              style: const TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  decoration: TextDecoration
                                                      .lineThrough)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
                    },
                  )
                : const Center(
                    child: Text(
                      'No Product in this categorie',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
            error: (error, stracktrace) => ErrorWidget(error.toString()),
            loading: () => const LoadingScreen()));
  }
}
