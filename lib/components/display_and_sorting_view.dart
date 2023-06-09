import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:flutter_the_library_app/resources/strings.dart';
import 'package:flutter_the_library_app/widgets/bottom_sheet_view.dart';
import 'package:flutter_the_library_app/widgets/filter_bottom_sheet_view.dart';

class DisplayAndSortingView extends StatelessWidget {
  Function(List<BookVO>?) onTapCategoryItem;
  Function(String?,BuildContext) onTapSortFilterItem;
  Function(String?,BuildContext) onTapChangeGridView;

  List<BookVO>? sortedBookList;
  List<BookVO>? readBookList;
  String selectedSortedItemData;
  String selectedViewItemData;
  String selectedViewIcon;
 // String selectedItemData = "Recently opened";
//  String selectedViewItemData = "List";
//  String selectedViewIcon = "assets/images/ic_list_gray_64.png";
  List<String> viewItems = ['List', 'Large grid', 'Small grid'];
  List<String> items = ['Recently opened', 'Title', 'Author'];
  Function(BookVO?) onTapDeleteBookFromYourLibrary;

  DisplayAndSortingView(
      {super.key,
      required this.onTapCategoryItem,
      required this.onTapSortFilterItem,
      required this.sortedBookList,
      required this.onTapChangeGridView,
      required this.readBookList,
      required this.selectedSortedItemData,
      required this.selectedViewItemData,
      required this.selectedViewIcon,
      required this.onTapDeleteBookFromYourLibrary});

  @override
  Widget build(BuildContext context) {
    // var bloc = Provider.of<LibraryBloc>(context,listen: false);
    return Container(
      // height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Column(
        children: [
          ///category list section

          FilterChipView(
            categoryList: sortedBookList,
            onTapCategoryItem: (bookVOList) {
              onTapCategoryItem(bookVOList);
            },
          ),

          ///filter section (sortbyfilter + viewasview)
          Padding(
            padding: const EdgeInsets.only(
                top: MARGIN_MEDIUM_1, bottom: MARGIN_MEDIUM_1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// recently opened , title , author sort filter
                GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return FilterBottomSheetView(
                            key: Key('filterBottomSheet'),
                            autoSelectedData: selectedSortedItemData,
                            bookVO: null,
                            isMarkAsRead: true,
                            filterTypeList: items,
                            filterTitle: SORT_BY_TXT,
                            onTapFilterItem: (selectedItem, buildContext) {
                              onTapSortFilterItem(selectedItem,buildContext!);
                              // LibraryBloc bloc = Provider.of<LibraryBloc>(buildContext!, listen: false);
                              // bloc.onTapSortFilter(sortFilterId);
                              //  bloc.onTapSortFilter(sortFilterId);

                              //  setState(() {
                              // debugPrint("DisplayAndSortingView ${selectedItem}");
                              // selectedItemData = selectedItem ?? "";
                              // debugPrint(
                              //     "DisplayAndSortingView 2 ${selectedItemData}");
                             // Navigator.pop(context);
                              // });
                            },
                          );
                        },
                      );
                    },
                    child: SortByFilterView(
                        selectedItemData: selectedSortedItemData),
                  ),

                ///large grid , small grid , list view filter
                 GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return FilterBottomSheetView(
                            key: Key('filterByViewBottomSheet'),
                            autoSelectedData: selectedViewItemData,
                            bookVO: null,
                            isMarkAsRead: true,
                            filterTypeList: viewItems,
                            filterTitle: VIEW_AS_TXT,
                            onTapFilterItem: (selectedItem, buildContext) {
                              onTapChangeGridView(selectedItem, buildContext!);

                              // setState(() {

                              //  });
                            },
                          );
                        },
                      );
                    },
                    child:
                    // Selector<LibraryBloc,String?>(
                    //     selector: (context,bloc)=> bloc.selectedViewIcon,
                    //     builder: (context, selectedViewIcon, child)
                    //     =>

                            ViewAsView(selectedViewIcon: selectedViewIcon),
                   // ),
                  ),

              ],
            ),
          ),

          ///read book list section
          Expanded(
            key: Key('bookListExtend'),
                child: (selectedViewItemData == "Large grid")
                    ? LargeGridView(mBookList: readBookList,
                    onTapDeleteBookFromYourLibrary: (mBookVO){
                      onTapDeleteBookFromYourLibrary(mBookVO);
                    })
                    : (selectedViewItemData == "Small grid")
                        ? SmallGridView(mBookList: readBookList,
                    onTapDeleteBookFromYourLibrary: (mBookVO){
              onTapDeleteBookFromYourLibrary(mBookVO);
    })
                        : (selectedViewItemData == "List")
                            ? ListStyleView(mBookList: readBookList,
                  onTapDeleteBookFromYourLibrary: (mBookVO){
                  onTapDeleteBookFromYourLibrary(mBookVO);
                },)
                            : Container(),
              ),

        ],
      ),
    );
  }
}

class FilterChipView extends StatefulWidget {
  Function(List<BookVO>?) onTapCategoryItem;
  List<BookVO>? categoryList;

  FilterChipView(
      {super.key, required this.categoryList, required this.onTapCategoryItem});

  @override
  State<FilterChipView> createState() => _FilterChipViewState();
}

class _FilterChipViewState extends State<FilterChipView> {
  // Function onTapCategoryItem;
  // final List _chips = [
  //   {"name": "", "selected": true},
  //   {"name": "Ebooks", "selected": false},
  //   {"name": "Purchases", "selected": true},
  //   {"name": "Samples", "selected": false},
  //   {"name": "Downloaded", "selected": false},
  //   {"name": "Uploads", "selected": false},
  //   {"name": "Not started", "selected": false},
  //   {"name": "Chip 7", "selected": false},
  //   {"name": "Chip 8", "selected": false},
  //   {"name": "Chip 9", "selected": false},
  // ];
  List<BookVO> selectedChips = [];

  @override
  Widget build(BuildContext context) {
    bool? hasSelectedBook =
        widget.categoryList?.any((bookVO) => bookVO.selected ?? false);

    print(hasSelectedBook); // Output: true

    return Container(
        height: MediaQuery.of(context).size.height * 0.07,
        child: Row(
          children: [
            Visibility(
                visible: (selectedChips.length > 0) ? true : false,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedChips = [];
                      widget.onTapCategoryItem(selectedChips);
                    });
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black12,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      key:Key('chipCategoryClosebtn'),
                      Icons.close,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                )),
            Expanded(
              child: ListView.builder(
                key:Key("chipListView"),
                  // shrinkWrap: true,
                  //  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.categoryList?.length,
                  itemBuilder: (BuildContext context, int index) {
                    BookVO? chip = widget.categoryList?.elementAt(index);
                    bool isSelected = selectedChips.contains(chip);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedChips.remove(chip);
                            widget.onTapCategoryItem(selectedChips);
                          } else {
                            selectedChips.add(chip!);
                            widget.onTapCategoryItem(selectedChips);
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Chip(
                          label: Text(widget.categoryList
                                  ?.elementAt(index)
                                  .categoryName ??
                              ""),
                          backgroundColor: isSelected
                              //  widget.categoryList?.elementAt(index).selected??false
                              ? Color.fromRGBO(0, 122, 201, 1)
                              : Colors.white,

                          side: BorderSide(
                            color: Colors.black12,
                            width: 1,
                          ),

                          labelStyle: TextStyle(
                              color: isSelected
                                  //widget.categoryList?.elementAt(index).selected??false ?
                                  ? Colors.white
                                  : Colors.black54),
                          elevation: 0,
                          // shadowColor: Colors.grey[50],
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        )

        );
  }
}

class ListStyleView extends StatelessWidget {
  List<BookVO>? mBookList;
  Function(BookVO?) onTapDeleteBookFromYourLibrary;

  ListStyleView({super.key, required this.mBookList,required this.onTapDeleteBookFromYourLibrary});

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: MediaQuery.of(context).size.height * 0.5,
        child: SizedBox(
      // height: 500,
      child: ListView.builder(
        key: Key('bookListViewByListStyle'),
        // shrinkWrap: true,
        //  physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: mBookList?.length,
        itemBuilder: (BuildContext context, int index) {

          return GestureDetector(
            onTap: () {},
            child: ListEachItemView(
              mBookVO: mBookList?.elementAt(index),
              onTapDeleteBookFromYourLibrary: (mBookVO){
                onTapDeleteBookFromYourLibrary(mBookVO);
              },
            ),
          );
        },
      ),
    ));
  }
}

class ListEachItemView extends StatelessWidget {
  BookVO? mBookVO;
  Function(BookVO?) onTapDeleteBookFromYourLibrary;

  ListEachItemView({super.key, required this.mBookVO,required this.onTapDeleteBookFromYourLibrary});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            (mBookVO?.bookImage == "" || mBookVO?.bookImage == null)?
            Container(
              height: 80,
              width: 55,
              margin: const EdgeInsets.only(
                  top: MARGIN_MEDIUM, bottom: MARGIN_MEDIUM),
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                    //NetworkImage(mBookVO?.bookImage ?? ""),
                     AssetImage("assets/images/empty_book.png"),
                  )),
            ) :
            Container(
              height: 80,
              width: 55,
              margin: const EdgeInsets.only(
                  top: MARGIN_MEDIUM, bottom: MARGIN_MEDIUM),
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                    NetworkImage(mBookVO?.bookImage ?? ""),
                    // AssetImage("assets/images/sample_book_img.jpg"),
                  )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  padding: const EdgeInsets.only(
                      top: MARGIN_MEDIUM,
                      left: MARGIN_MEDIUM_2,
                      right: MARGIN_MEDIUM_2),
                  child: Text(
                    mBookVO?.title ?? "",
                    style: TextStyle(
                        fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
                  child: Text(
                    "${mBookVO?.author} \n Ebook.Sample",
                    style: TextStyle(
                        fontSize: TEXT_REGULAR, fontWeight: FontWeight.w400),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 32,
              height: 32,
              // decoration: const BoxDecoration(
              //   color: Colors.black45,
              //   borderRadius: BorderRadius.all(Radius.circular(8)),
              // ),
              child: const Padding(
                padding: EdgeInsets.only(
                    top: MARGIN_MEDIUM,
                    left: MARGIN_MEDIUM,
                    right: MARGIN_MEDIUM),
                child: Image(
                  image: AssetImage('assets/images/ic_check_gray_64.png'),
                ),
              ),
            ),
            SizedBox(
              width: 32,
              height: 32,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return BottomSheetView(
                        bookVO: mBookVO,
                        isMarkAsRead: true,
                        isFromFilterPage: true,
                        onTapAddToShelves: (){},
                        onTapDeleteBookFromYourLibrary: (){
                          onTapDeleteBookFromYourLibrary(mBookVO);
                        },
                      );
                    },
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MARGIN_MEDIUM, right: MARGIN_MEDIUM),
                  child: Image(
                    key: Key('libraryListViewContextualIcon-${mBookVO?.bookId}'),
                    image: AssetImage('assets/images/ic_more_gray_64.png'),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class SmallGridView extends StatelessWidget {
  List<BookVO>? mBookList;
  Function(BookVO?) onTapDeleteBookFromYourLibrary;

  SmallGridView({super.key, required this.mBookList,
  required this.onTapDeleteBookFromYourLibrary});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.5,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns
            crossAxisSpacing: 10.0, // Spacing between columns
            mainAxisSpacing: 10.0, //
            childAspectRatio: 0.5 // Spacing between rows
            ),
        itemCount: mBookList?.length,
        itemBuilder: (BuildContext context, int index) {
          return SmallGridEachItemView(
            mBookVO: mBookList?.elementAt(index),
            onTapDeleteBookFromYourLibrary: (mBookVO){
              onTapDeleteBookFromYourLibrary(mBookVO);
            },
          );
        },
      ),
    );
  }
}

class SmallGridEachItemView extends StatelessWidget {
  BookVO? mBookVO;
  Function(BookVO?) onTapDeleteBookFromYourLibrary;

  SmallGridEachItemView({super.key, required this.mBookVO,
  required this.onTapDeleteBookFromYourLibrary});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 500,
      // alignment: Alignment.center,
      //color: Colors.blueGrey[100],
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          //  width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 180,
                  //  height: 225,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0.0,
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child:

                        (mBookVO?.bookImage == "")?
                        Container(
                          // height: 200,
                          margin: const EdgeInsets.only(top: 3.0, bottom: 3.0),
                          decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius:
                              BorderRadius.all(Radius.circular(6)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                //NetworkImage(mBookVO?.bookImage ?? ""),
                                 AssetImage(
                                     "assets/images/empty_book.png"),
                              )),
                        ) :

                        Container(
                          // height: 200,
                          margin: const EdgeInsets.only(top: 3.0, bottom: 3.0),
                          decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(mBookVO?.bookImage ?? ""),
                                // AssetImage(
                                //     "assets/images/sample_book_img.jpg"),
                              )),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 32,
                            height: 32,
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return BottomSheetView(
                                      bookVO: mBookVO,
                                      isMarkAsRead: true,
                                      isFromFilterPage: true,
                                      onTapAddToShelves: (){},
                                      onTapDeleteBookFromYourLibrary: (){
                                        onTapDeleteBookFromYourLibrary(mBookVO);
                                      },
                                    );
                                  },
                                );
                              },
                              child: const Image(
                                image: AssetImage(
                                    'assets/images/contextualMenu.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                              color: Colors.black45,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image(
                                image: AssetImage('assets/images/earphone.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                              color: Colors.black45,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/ic_check_white_64.png'),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )

                  // Image(
                  //     fit: BoxFit.cover,
                  //     image: AssetImage('assets/images/sample_book_img.jpg')),
                  ),
              Container(
                padding: const EdgeInsets.only(
                    top: MARGIN_MEDIUM,
                    left: MARGIN_MEDIUM_2,
                    right: MARGIN_MEDIUM_2),
                child: Text(
                  mBookVO?.title ?? "",
                  style: TextStyle(
                      fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
                child: Text(
                  "${mBookVO?.author} \n Ebook.Sample",
                  style: TextStyle(
                      fontSize: TEXT_REGULAR, fontWeight: FontWeight.w400),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LargeGridView extends StatelessWidget {
  List<BookVO>? mBookList;
  Function(BookVO?) onTapDeleteBookFromYourLibrary;

  LargeGridView({super.key, required this.mBookList,
  required this.onTapDeleteBookFromYourLibrary});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.55,
      child: GridView.builder(

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 15.0, // Spacing between columns
            //mainAxisSpacing: 0, // Spacing between rows
            childAspectRatio: 0.6 //
            ),
        itemCount: mBookList?.length,
        itemBuilder: (BuildContext context, int index) {
          return LargeGridEachItemView(
            mBookVO: mBookList?.elementAt(index),
            onTapDeleteBookFromYourLibrary: (mBookVO){
              onTapDeleteBookFromYourLibrary(mBookVO);
            },
          );
        },
      ),
    );
  }
}

class LargeGridEachItemView extends StatelessWidget {
  BookVO? mBookVO;
  Function(BookVO?) onTapDeleteBookFromYourLibrary;

  LargeGridEachItemView({super.key, required this.mBookVO,
  required this.onTapDeleteBookFromYourLibrary});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 500,
      // alignment: Alignment.center,
      //color: Colors.blueGrey[100],
      child: GestureDetector(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 250,
                //  height: 225,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0.0,
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child:

                      (mBookVO?.bookImage == "")?
                      Container(
                        // height: 200,
                        // margin: const EdgeInsets.only(top: 3.0, bottom: 3.0),
                        decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                              //NetworkImage(mBookVO?.bookImage ?? ""),
                              AssetImage(
                                  "assets/images/empty_book.png"),
                            )),
                      ):
                    Container(
                        // height: 200,
                        // margin: const EdgeInsets.only(top: 3.0, bottom: 3.0),
                        decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(mBookVO?.bookImage ?? ""),
                              /*AssetImage(
                                  "assets/images/sample_book_img.jpg"),*/
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 32,
                          height: 32,
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return BottomSheetView(
                                    bookVO: mBookVO,
                                    isMarkAsRead: true,
                                    isFromFilterPage: true,
                                    onTapAddToShelves: (){},
                                    onTapDeleteBookFromYourLibrary: (){
                                      onTapDeleteBookFromYourLibrary(mBookVO);
                                    },
                                  );
                                },
                              );
                            },
                            child: const Image(
                              image: AssetImage(
                                  'assets/images/contextualMenu.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage('assets/images/earphone.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage(
                                  'assets/images/ic_check_white_64.png'),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )

                // Image(
                //     fit: BoxFit.cover,
                //     image: AssetImage('assets/images/sample_book_img.jpg')),
                ),
            Container(
              padding: const EdgeInsets.only(
                  top: MARGIN_MEDIUM,
                  left: MARGIN_MEDIUM_2,
                  right: MARGIN_MEDIUM_2),
              child: Text(
                mBookVO?.title ?? "",
                style: const TextStyle(
                    fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
              child: Text(
                mBookVO?.author ?? "Ebook.Sample",
                style: const TextStyle(
                    fontSize: TEXT_REGULAR, fontWeight: FontWeight.w400),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewAsView extends StatelessWidget {
  const ViewAsView({
    super.key,
    required this.selectedViewIcon,
  });

  final String selectedViewIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key:Key('filterByView'),
      width: 25,
      height: 25,
      child: Image(
        image: AssetImage(selectedViewIcon),
      ),
    );
  }
}

class SortByFilterView extends StatelessWidget {
  const SortByFilterView({
    super.key,
    required this.selectedItemData,
  });

  final String selectedItemData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(MARGIN_MEDIUM_1),
          child: SizedBox(
            key:Key('filterSortIcon'),
            width: 25,
            height: 25,
            child: Image(
              image: AssetImage('assets/images/ic_filter_sort_gray_64.png'),
            ),
          ),
        ),
        const SizedBox(
          width: MARGIN_MEDIUM_1,
        ),
        Text(
          "Sort by : ${selectedItemData}",
          style: const TextStyle(
              color: Colors.black,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
