import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/blocs/library_bloc.dart';

import 'package:flutter_the_library_app/components/display_and_sorting_view.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/data/vos/shelves_vo.dart';
import 'package:flutter_the_library_app/pages/create_shelf_page.dart';

import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:flutter_the_library_app/resources/strings.dart';
import 'package:flutter_the_library_app/widgets/book_shelves_view.dart';
import 'package:provider/provider.dart';

class YourBooksYourShelvesTabBarView extends StatefulWidget {
  @override
  _YourBooksYourShelvesTabBarViewState createState() =>
      _YourBooksYourShelvesTabBarViewState();
}

class _YourBooksYourShelvesTabBarViewState
    extends State<YourBooksYourShelvesTabBarView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this); // set the number of tabs here
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LibraryBloc(),
      child: Scaffold(
        body: Container(
          // color: Colors.red,
          // height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              TabBar(
                // indicatorColor: Colors.blue, // set the color of the selected tab indicator
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.blue,
                // set the color of the selected tab
                unselectedLabelColor: Colors.grey,
                // set the color of the unselected tabs
                controller: _tabController,
                tabs: const [
                  Tab(
                    child: Text(
                      YOUR_BOOKS_TXT,
                      style: TextStyle(
                          fontSize: TEXT_REGULAR_2X,
                          fontWeight:
                              FontWeight.w600), // set the tab label size
                    ),
                  ), //
                  Tab(
                    child: Text(
                      YOUR_SHELVES_TXT,
                      style: TextStyle(
                          fontSize: TEXT_REGULAR_2X,
                          fontWeight:
                              FontWeight.w600), // set the tab label size
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // set the content for each tab here
                    ///  Your Books Section,
                    Selector<LibraryBloc, List<BookVO>?>(
                      selector: (context, bloc) => bloc.mReadBookList,
                      builder: (context, readBookList, child) =>
                          Selector<LibraryBloc, String?>(
                        selector: (context, bloc) => bloc.selectedItemData,
                        builder: (context, selectedSortedItemData, child) =>
                            Selector<LibraryBloc, String?>(
                          selector: (context, bloc) =>
                              bloc.selectedViewItemData,
                          builder: (context, selectedViewItemData, child) =>
                              Selector<LibraryBloc, String?>(
                            selector: (context, bloc) => bloc.selectedViewIcon,
                            builder: (context, selectedViewIcon, child) =>
                                Container(
                              height: MediaQuery.of(context).size.height,
                              child: Selector<LibraryBloc, List<BookVO>?>(
                                  selector: (context, bloc) =>
                                      bloc.mCategoryTypeList,
                                  builder:
                                      (context, categoryReadBookList, child) {
                                    print(
                                        "check read book list = ${readBookList}");

                                    return DisplayAndSortingView(
                                      selectedViewIcon: selectedViewIcon??"assets/images/ic_list_gray_64.png",
                                        readBookList: readBookList,
                                        selectedSortedItemData:
                                            selectedSortedItemData ??
                                                "Recently opened",
                                        selectedViewItemData:
                                            selectedViewItemData ?? "List",
                                        onTapCategoryItem: (selectedBookList) {
                                          LibraryBloc bloc =
                                              Provider.of<LibraryBloc>(context,
                                                  listen: false);
                                          bloc.onTapCategoryFilter(
                                              selectedBookList);
                                        },
                                        onTapSortFilterItem:
                                            (selectedSortFilterItem,
                                                buildContext) {
                                          LibraryBloc bloc =
                                              Provider.of<LibraryBloc>(context,
                                                  listen: false);
                                          bloc.onTapSortFilter(
                                              selectedSortFilterItem ??
                                                  "Recently opened");
                                          Navigator.pop(buildContext);
                                        },
                                        onTapChangeGridView:
                                            (selectedChangeGridView,
                                                buildContext) {
                                          LibraryBloc bloc =
                                              Provider.of<LibraryBloc>(context,
                                                  listen: false);
                                          bloc.onTapChangeGridView(
                                              selectedChangeGridView ?? "List");
                                          Navigator.pop(buildContext);
                                        },
                                        sortedBookList: categoryReadBookList);
                                  }),
                            ),
                          ),
                        ),
                      ),
                    ),

                    ///Your shelves Section
                    //Container(
                    //                         height: MediaQuery.of(context).size.height,
                    //                         child: Selector<LibraryBloc, List<ShelvesVO>?>(
                    //                           selector: (context, bloc) => bloc.mShelvesList,
                    //                           builder: (context, shelvesList, child) => BookShelvesView(
                    //                             onTapSaveShelf: (shelfName, buildContext) {
                    //                               LibraryBloc bloc = Provider.of<LibraryBloc>(
                    //                                   context,
                    //                                   listen: false);
                    //                               bloc.saveShelfVO(
                    //                                   ShelvesVO("", shelfName, [], false));
                    //                               Navigator.pop(buildContext);
                    //                             },
                    //                             shelvesVOList: shelvesList ?? [],
                    //                           onTapShelfDetail: (shelfVO,buildContext){
                    //                             Navigator.push(
                    //                               context,
                    //                               MaterialPageRoute(
                    //                                 builder: (buildContext) => CreateShelfPage(isCreateNewShelf: false,
                    //                                     mShelvesVO: shelfVO,
                    //                                   onTapSaveShelf: (shelfName,context){},
                    //                                   onTapDeleteShelf: (shelfVO,buildContextParam){
                    //                                     LibraryBloc bloc = Provider.of<LibraryBloc>(
                    //                                         context,
                    //                                         listen: false);
                    //                                     bloc.onTapDeleteShelfVO(shelfVO!);
                    //
                    //                                   Navigator.pop(buildContextParam);
                    //                                   },
                    //
                    //                                 ),
                    //                               ),
                    //                             );
                    //                           },
                    //                           ),
                    //                       ),
                    //                     )
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: BookShelvesView(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
