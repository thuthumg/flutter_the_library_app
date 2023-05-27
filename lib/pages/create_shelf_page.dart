import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/blocs/shelves_create_bloc.dart';
import 'package:flutter_the_library_app/components/display_and_sorting_view.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/data/vos/shelves_vo.dart';
import 'package:flutter_the_library_app/resources/colors.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:flutter_the_library_app/widgets/edit_text_with_limit_view.dart';
import 'package:flutter_the_library_app/widgets/shelf_action_bottom_sheet_view.dart';
import 'package:provider/provider.dart';

class CreateShelfPage extends StatelessWidget {
  bool isCreateNewShelf;
  ShelvesVO? mShelvesVO;
  Function(String?) onTapSaveShelf;
  Function(ShelvesVO?, BuildContext) onTapDeleteShelf;
 // bool renameShelf = false;
 // String paramRenameShelfName = "";

  CreateShelfPage({
    required this.isCreateNewShelf,
    required this.onTapSaveShelf,
    required this.mShelvesVO,
    required this.onTapDeleteShelf,
  });

  @override
  Widget build(BuildContext context) {
    print("create shelf page = ${mShelvesVO?.shelfName}");

    return ChangeNotifierProvider(
      create: (context) => ShelvesCreateBloc(mShelvesVO?.shelfId??""),//widget.mShelvesVO?
      child:  Selector<ShelvesCreateBloc, bool>(
        selector: (context, bloc) => bloc.isRenameShelf,
        builder: (context, renameShelfFlag, child) =>
            Selector<ShelvesCreateBloc, String>(
              selector: (context, bloc) => bloc.renameShelfName,
              builder: (context, oldRenameShelfName, child) =>  Scaffold(
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
                    visible: !isCreateNewShelf,
                    child: Container(
                      width: 35,
                      height: 35,
                      margin: const EdgeInsets.only(right: MARGIN_MEDIUM),
                      padding: const EdgeInsets.only(
                          left: MARGIN_MEDIUM, right: MARGIN_MEDIUM),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext bottomSheetContext) {
                              return ShelfActionBottomSheetView(
                                shelfTitle: mShelvesVO?.shelfName ?? "",
                                onTapRenameShelf: (oldShelfName,contextParam) {

                                  ShelvesCreateBloc bloc =
                                  Provider.of<ShelvesCreateBloc>(context,
                                      listen: false);
                                    bloc.setRenameFlagAndName(true,oldShelfName);
                                    Navigator.pop(context);

                                },
                                onTapDeleteShelf: (contextParam) {
                                    onTapDeleteShelf(
                                        mShelvesVO, context);
                                     Navigator.pop(context);

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
                    (isCreateNewShelf == true || renameShelfFlag == true),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
                      child: EditTextWithLimitView(
                        maxLength: 50,
                        paramRenameShelfName: oldRenameShelfName,//paramRenameShelfName
                        onTapDone: (enterShelfName) {
                          onTapSaveShelf(enterShelfName);
                        },
                      ),
                    ),
                  ),
                  ///existing shelf Name view section
                  Visibility(
                    visible: (!isCreateNewShelf && renameShelfFlag == false),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
                      child: Text(
                        mShelvesVO?.shelfName ?? "",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: TEXT_HEADING_1X,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

                  ///saved book count view section
                  Visibility(
                    visible: !isCreateNewShelf,
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
                      child: Text(
                        mShelvesVO?.booksList?.length == 0
                            ? "0 book"
                            : "${mShelvesVO?.booksList?.length} books",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: TEXT_REGULAR,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),

                  ///filter section
                  Visibility(
                      visible: !isCreateNewShelf,
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

                                                      return categoryReadBookList?.length==0 ? Container() :
                                                      DisplayAndSortingView(
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
                                                          sortedBookList: categoryReadBookList,
                                                      onTapDeleteBookFromYourLibrary: (mBookVO){
                                                        if(mBookVO != null)
                                                          {
                                                            ShelvesCreateBloc bloc =
                                                            Provider.of<ShelvesCreateBloc>(
                                                                context,
                                                                listen: false);
                                                            bloc.onTapDeleteBookFromYourLibrary(mBookVO);
                                                          }
                                                        Navigator.pop(context);

                                                      },);
                                                    },
                                                  ),
                                                ),
                                              ),
                                        ),
                                  ),
                            ),
                      )

                  )
                ],
              ),
          ),
        ),
            ),
      ),
    );
  }
}

