import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/fetch_provider_model.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_screen";

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

  /// A list to store fetched categories data.
  List<List<FetchProviderModel>> fetchList = [];

  /// A list to store children categories of the selected category.
  List childrens = [];

  Future<List<FetchProviderModel>> getFetchList() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/v1/categories'));
    if (response.statusCode == 200) {
      /// parsing the JSON response and returning a list of `FetchProviderModel` objects.
      return categoryFromJson(response.body);
    } else {
      /// if status code is not 200 throws an exception
      throw Exception('Failed to load categories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        /// `future` parameter takes the `getFetchList` function which fetches data.
        future: getFetchList(),

        /// The `builder` function is called when the `Future` completes.
        builder: (context, AsyncSnapshot<List<FetchProviderModel>> snapshot) {
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
                    child: ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        final category = snapshot.data?[index];
                        return InkWell(
                          onTap: () {
                            setState(() {
                              childrens = category.children;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  category!.name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: childrens.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Text(childrens[index].name.toString()),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
