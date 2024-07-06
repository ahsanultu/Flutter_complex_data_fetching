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

  List<List<FetchProviderModel>> fetchList = [];

  List childrens = [];

  Future<List<FetchProviderModel>> getFetchList() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/v1/categories'));
    if (response.statusCode == 200) {
      return categoryFromJson(response.body);
    } else {
      throw Exception('Failed to load categories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getFetchList(),
        builder: (context, AsyncSnapshot<List<FetchProviderModel>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
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
                                ))),
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
