import 'package:flutter/material.dart';
import 'package:news_app/models/source.dart';
import 'package:news_app/news_helper/apis_manager.dart';
import 'tab_item.dart';
import 'news_list.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs(this.categoryID, {super.key});

  final String categoryID;

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  List<Source> sourcesNames = [];

  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSourcesNames();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sourcesNames.length,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            TabBar(
              isScrollable: true,
              indicatorColor: Colors.transparent,
              onTap: (selectedIndex) {
                setState(() {
                  this.selectedIndex = selectedIndex;
                });
              },
              tabs: sourcesNames.map((source) {
                return TabItem(
                  source,
                  sourcesNames.indexOf(source) == selectedIndex,
                );
              }).toList(),
            ),
            Expanded(
              child: TabBarView(
                children:
                    sourcesNames.map((source) => NewsList(source)).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  getSourcesNames() async {
    await APIsManager.getSources(category: widget.categoryID).then((value) {
      sourcesNames = value.sources ?? [];
      setState(() {});
    });
  }
}
