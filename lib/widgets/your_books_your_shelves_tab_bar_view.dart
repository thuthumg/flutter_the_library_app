import 'package:flutter/material.dart';

import 'package:flutter_the_library_app/components/display_and_sorting_view.dart';

import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:flutter_the_library_app/resources/strings.dart';


class YourBooksYourShelvesTabBarView extends StatefulWidget {
  @override
  _YourBooksYourShelvesTabBarViewState createState() => _YourBooksYourShelvesTabBarViewState();
}

class _YourBooksYourShelvesTabBarViewState extends State<YourBooksYourShelvesTabBarView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // set the number of tabs here
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TabBar(
            // indicatorColor: Colors.blue, // set the color of the selected tab indicator
            indicatorSize:TabBarIndicatorSize.label,
            labelColor: Colors.blue, // set the color of the selected tab
            unselectedLabelColor: Colors.grey, // set the color of the unselected tabs
            controller: _tabController,
            tabs: const [
              Tab(child: Text(
                YOUR_BOOKS_TXT,
                style: TextStyle(
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w600), // set the tab label size
              ),), //
              Tab(child: Text(
                YOUR_SHELVES_TXT,
                style: TextStyle(
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w600), // set the tab label size
              ),),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // set the content for each tab here
                DisplayAndSortingView(),
                Container()

              ],
            ),
          ),
        ],
      ),
    );
  }
}

