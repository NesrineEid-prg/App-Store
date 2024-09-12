part of '../import_path/import_path.dart';

class HomeGategoriesWidget extends ConsumerWidget {
  const HomeGategoriesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        width: double.infinity,
        height: 100,
        child: ref.watch(getcategorieProvider).when(
            data: (data) => ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductByCategoriePage(
                                      categoryName:
                                          data[index].name.toString())));
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              child: Image.network(
                                data[index].image!,
                                scale: 1,
                                fit: BoxFit.contain,
                                height: 90,
                                width: 60,
                              ),
                            ),
                            Text(
                              data[index].name!,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
            error: (error, stracktrace) => ErrorText(error: error.toString()),
            loading: () => const LoadingScreen()));
  }
}
