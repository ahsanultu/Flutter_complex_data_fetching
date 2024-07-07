import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation/models/category_model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  /// A list to store children categories of the selected category.
  List<Children>? childrens = [];

  Future<CategoryModel> getFetchList() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/v1/categories'));
    if (response.statusCode == 200) {
      /// parsing the JSON response and returning a list of `CategoryModel` objects.
      return categoryModelFromJson(response.body);
    } else {
      /// if status code is not 200 throws an exception
      throw Exception('Failed to load categories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<CategoryModel>(
        /// `future` parameter takes the `getFetchList` function which fetches data.
        future: getFetchList(),

        /// The `builder` function is called when the `Future` completes.
        builder: (context, AsyncSnapshot<CategoryModel> snapshot) {
          /// If snapshot doesn't have data, shows a loading spinner.
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            /// If snapshot has data, builds the UI.
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView.builder(
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          final category = snapshot.data!.data![index];

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  childrens =
                                      snapshot.data!.data![index].children;
                                });
                                if (kDebugMode) {
                                  print(childrens);
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  category.name.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: childrens?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 5),
                        child: Text('+ ${childrens![index].name}'),
                      );
                    },
                  ))
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
