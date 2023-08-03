// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/helper/mediaquery.dart';
import 'package:musicapp/models/searddatamodel.dart';
import '../models/song_model.dart';
import '../service/searchget.dart';

class Search extends StatelessWidget {
  Search({super.key});
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade800.withOpacity(0.8),
            Colors.deepPurple.shade200.withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuerypage.smallSizeHeight! * 6,
              ),
              TextFormField(
                controller: search,
                onSaved: (_) => fetchData(value: search.text),
                textInputAction: TextInputAction.done,
                onEditingComplete: () {
                  fetchData(value: search.text);
                },
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: Colors.black,
                  hintText: 'Search',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.grey.shade400),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () => searchList.total == null
                      ? Center(
                          child: Text(
                              'No search data found ${searchList.total}',
                              style: TextStyle(
                                  fontSize: MediaQuerypage.fontsize! * 18,
                                  color: Colors.white)),
                        )
                      : ListView.builder(
                          itemCount: searchList.data!.length,
                          itemBuilder: (context, index) {
                            Data data = searchList.data![index];
                            return InkWell(
                              onTap: () {
                                Get.toNamed('/song', arguments: data);
                              },
                              child: ListTile(
                                // leading: Image.network(data.md5Image!),
                                title: Text(data.title!),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(data.artist!.name!),
                                    Text(data.duration.toString()),
                                  ],
                                ),
                              ),
                            );
                          }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
