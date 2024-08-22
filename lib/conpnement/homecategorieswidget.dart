part of '../import_path/import_path.dart';

class HomeGategoriesWidget extends StatelessWidget {
  const HomeGategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: ListView.builder(
            itemCount: FakeData.categories.length,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    CircleAvatar(
                      child: Image.asset(
                        FakeData.categories[index].image!,
                        fit: BoxFit.cover,
                        height: 120,
                        width: 120,
                      ),
                    ),
                    Text(
                      FakeData.categories[index].name!,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
