import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/blocs/shelves_bloc.dart';
import 'package:flutter_the_library_app/blocs/shelves_create_bloc.dart';
import 'package:flutter_the_library_app/components/display_and_sorting_view.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/data/vos/shelves_vo.dart';
import 'package:flutter_the_library_app/resources/colors.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:flutter_the_library_app/widgets/edit_text_with_limit_view.dart';
import 'package:flutter_the_library_app/widgets/shelf_action_bottom_sheet_view.dart';
import 'package:provider/provider.dart';

class CreateShelfPage extends StatefulWidget {
  bool isCreateNewShelf;
  ShelvesVO? mShelvesVO;
  Function(String?, BuildContext) onTapSaveShelf;
  Function(ShelvesVO?, BuildContext) onTapDeleteShelf;

  CreateShelfPage({
    required this.isCreateNewShelf,
    required this.onTapSaveShelf,
    required this.mShelvesVO,
    required this.onTapDeleteShelf,
  });

  @override
  State<CreateShelfPage> createState() => _CreateShelfPageState();
}

class _CreateShelfPageState extends State<CreateShelfPage> {
  bool renameShelf = false;
  String paramRenameShelfName = "";

  @override
  Widget build(BuildContext context) {
    print("create shelf page = ${widget.mShelvesVO?.shelfName}");

    return ChangeNotifierProvider(
      create: (context) => ShelvesCreateBloc(widget.mShelvesVO?.shelfId??""),//widget.mShelvesVO?
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: PRIMARY_COLOR,
          centerTitle: true,
          title: Text(
            "Create shelf",
            style: TextStyle(
                color: Colors.black,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w500),
          ),
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black54,
                size: 20,
              )),
          actions: [
            Visibility(
                visible: !widget.isCreateNewShelf,
                child: Container(
                  width: 35,
                  height: 35,
                  margin: EdgeInsets.only(right: MARGIN_MEDIUM),
                  padding: EdgeInsets.only(
                      left: MARGIN_MEDIUM, right: MARGIN_MEDIUM),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return ShelfActionBottomSheetView(
                            shelfTitle: widget.mShelvesVO?.shelfName ?? "",
                            onTapRenameShelf: (shelfName) {
                              setState(() {
                                renameShelf = true;
                                paramRenameShelfName = shelfName;
                                Navigator.pop(context);
                              });
                            },
                            onTapDeleteShelf: () {
                              setState(() {
                                widget.onTapDeleteShelf(
                                    widget.mShelvesVO, context);
                                // Navigator.pop(context);
                              });
                            },
                          );
                        },
                      );
                    },
                    child: const Image(
                      image: AssetImage('assets/images/ic_more_gray_64.png'),
                    ),
                  ),
                ))
          ],
        ),
        body: Padding(
          // height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(top: MARGIN_MEDIUM_3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///shelf Name text box section
              Visibility(
                visible:
                    (widget.isCreateNewShelf == true || renameShelf == true),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
                  child: EditTextWithLimitView(
                    maxLength: 50,
                    paramRenameShelfName: paramRenameShelfName,
                    onTapDone: (enterShelfName) {
                      print("check shelf Name = ${enterShelfName}");
                      widget.onTapSaveShelf(enterShelfName, context);
                    },
                  ),
                ),
              ),

              ///existing shelf Name view section
              Visibility(
                visible: (!widget.isCreateNewShelf && renameShelf == false),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
                  child: Text(
                    widget.mShelvesVO?.shelfName ?? "",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: TEXT_HEADING_1X,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),

              ///saved book count view section
              Visibility(
                visible: !widget.isCreateNewShelf,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
                  child: Text(
                    widget.mShelvesVO?.booksList?.length == 0
                        ? "0 book"
                        : "${widget.mShelvesVO?.booksList?.length} books",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: TEXT_REGULAR,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),

              ///filter section
              Visibility(
                  visible: !widget.isCreateNewShelf,
                  child: Selector<ShelvesCreateBloc, List<BookVO>?>(
                    selector: (context, bloc) => bloc.mReadBookList,
                    builder: (context, readBookList, child) =>
                        Selector<ShelvesCreateBloc, String?>(
                      selector: (context, bloc) => bloc.selectedItemData,
                      builder: (context, selectedSortedItemData, child) =>
                          Selector<ShelvesCreateBloc, String?>(
                        selector: (context, bloc) => bloc.selectedViewItemData,
                        builder: (context, selectedViewItemData, child) =>
                            Selector<ShelvesCreateBloc, String?>(
                          selector: (context, bloc) => bloc.selectedViewIcon,
                          builder: (context, selectedViewIcon, child) =>
                              Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              child: Selector<ShelvesCreateBloc, List<BookVO>?>(
                                selector: (context, bloc) =>
                                    bloc.mCategoryTypeList,
                                builder:
                                    (context, categoryReadBookList, child) {
                                  // print(
                                  //     "check read book list = ${widget.readBookList}");

                                  return categoryReadBookList?.length==0 ? Container() : DisplayAndSortingView(
                                      selectedViewIcon: selectedViewIcon ??
                                          "assets/images/ic_list_gray_64.png",
                                      readBookList: readBookList,
                                      selectedSortedItemData:
                                          selectedSortedItemData ??
                                              "Recently opened",
                                      selectedViewItemData:
                                          selectedViewItemData ?? "List",
                                      onTapCategoryItem: (selectedBookList) {
                                        //onTapCategoryItem(selectedBookList);
                                        ShelvesCreateBloc bloc =
                                            Provider.of<ShelvesCreateBloc>(
                                                context,
                                                listen: false);
                                        bloc.onTapCategoryFilter(
                                            selectedBookList);
                                      },
                                      onTapSortFilterItem:
                                          (selectedSortFilterItem,
                                              buildContext) {
                                        //
                                        // widget.onTapSortFilterItem(selectedSortFilterItem,
                                        //     buildContext);

                                        ShelvesCreateBloc bloc =
                                            Provider.of<ShelvesCreateBloc>(
                                                context,
                                                listen: false);
                                        bloc.onTapSortFilter(
                                            selectedSortFilterItem ??
                                                "Recently opened");
                                        Navigator.pop(buildContext);
                                      },
                                      onTapChangeGridView:
                                          (selectedChangeGridView,
                                              buildContext) {
                                        // widget.onTapChangeGridView(selectedChangeGridView,
                                        //     buildContext);

                                        ShelvesCreateBloc bloc =
                                            Provider.of<ShelvesCreateBloc>(
                                                context,
                                                listen: false);
                                        bloc.onTapChangeGridView(
                                            selectedChangeGridView ?? "List");
                                        Navigator.pop(buildContext);
                                      },
                                      sortedBookList: categoryReadBookList);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )

                  // Expanded(
                  //     child: DisplayAndSortingView( readBookList: [],
                  //       selectedSortedItemData: "Recently opened",
                  //       selectedViewItemData:"List",
                  //       onTapSortFilterItem: (selectedSortedItem,buildContext){},
                  //       onTapCategoryItem: (bookVO){},
                  //       onTapChangeGridView:  (selectedChangeGridView,buildContext){},
                  //       sortedBookList: [],
                  //     ),
                  // ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
