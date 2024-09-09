part of '../import_path/import_path.dart';

class Homeproductswidget extends ConsumerWidget {
  const Homeproductswidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        width: double.infinity,
        child: ref.watch(getproductProvider).when(
            data: (data) => GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                        ProductDetailsPage(),
                                        settings:RouteSettings(arguments: data[index]) ));
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
                                  Image.network(
                                    data[index].image,
                                    fit: BoxFit.contain,
                                    height: 150,
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Center(
                                    child: Text(
                                      data[index].name,
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$${data[index].price}",
                                        style: const TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Text("\$${data[index].oldPrice}",
                                          style: const TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              decoration:
                                                  TextDecoration.lineThrough)),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                  },
                ),
            error: (error, stracktrace) => ErrorWidget(error.toString()),
            loading: () => const LoadingScreen()));
  }
}
