import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/blocs/home_bloc.dart';
import 'package:flutter_the_library_app/data/vos/category_books_list_vo.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:flutter_the_library_app/resources/strings.dart';
import 'package:flutter_the_library_app/widgets/category_book_list_item_view.dart';
import 'package:provider/provider.dart';

class MyTabBarView extends StatefulWidget {
  @override
  _MyTabBarViewState createState() => _MyTabBarViewState();
}

class _MyTabBarViewState extends State<MyTabBarView> with SingleTickerProviderStateMixin {
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
                EBOOKS_TXT,
                style: TextStyle(
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w600), // set the tab label size
              ),), //
              Tab(child: Text(
                AUDIOBOOKS_TXT,
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
                Selector<HomeBloc,List<CategoryBooksListVO>?>(
                  selector: (context,bloc)=> bloc.mCategoryBooksListVOList,
                  builder:  (context, mCategoryBooksListVOList, child) => ListView.builder(
                   // shrinkWrap: true,
                  //  physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: mCategoryBooksListVOList?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (){},
                        child: CategoryBookListItemView(
                          categoryBooksListVO:(mCategoryBooksListVOList == null || mCategoryBooksListVOList.isEmpty)? null : mCategoryBooksListVOList[index],
                          isAudioBook: false,),
                      );
                    },
                  ),
                ),

                ListView.builder(
                  // shrinkWrap: true,
                  //  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){},
                      child: CategoryBookListItemView(
                        categoryBooksListVO: null,
                        isAudioBook: true,),
                    );
                  },
                )
                // Center(
                //   child: Container(
                //     child: Text(
                //       AUDIOBOOKS_TXT,
                //       style: TextStyle(
                //           fontSize: TEXT_REGULAR_2X,
                //           fontWeight: FontWeight.w600), // set the tab label size
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
