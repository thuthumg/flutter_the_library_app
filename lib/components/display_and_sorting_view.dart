import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:flutter_the_library_app/resources/strings.dart';
import 'package:flutter_the_library_app/widgets/filter_bottom_sheet_view.dart';

class DisplayAndSortingView extends StatefulWidget {

  const DisplayAndSortingView({
    super.key,
  });

  @override
  State<DisplayAndSortingView> createState() => _DisplayAndSortingViewState();
}

class _DisplayAndSortingViewState extends State<DisplayAndSortingView> {
  @override
  Widget build(BuildContext context) {
    String selectedItemData = "";
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:(){
                        List<String> items = ['Recently opened', 'Title', 'Author'];
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return FilterBottomSheetView(
                              bookVO: null,
                              isMarkAsRead: true,
                              filterTypeList: items,
                            filterTitle: SORT_BY_TXT,
                            onTapFilterItem: (selectedItem){
                                setState(() {
                                  selectedItemData = selectedItem??"";
                                });

                            },);
                          },
                        );
                      },
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(MARGIN_MEDIUM_1),
                            child: SizedBox(
                              width: 25,
                              height: 25,
                              child: Image(
                                image: AssetImage(
                                    'assets/images/ic_filter_sort_gray_64.png'),
                              ),
                            ),
                          ),
                          const SizedBox(width: MARGIN_MEDIUM_1,),
                          Text(
                            "Sort by : ${selectedItemData}",
                            style: const TextStyle(
                                fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        List<String> items = ['List', 'Large grid', 'Small grid'];
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return FilterBottomSheetView(
                              bookVO: null,
                              isMarkAsRead: true,
                            filterTypeList: items,
                            filterTitle: VIEW_AS_TXT,
                              onTapFilterItem: (selectedItem){
                                setState(() {
                                  selectedItemData = selectedItem??"";
                                });

                              },


                            );
                          },
                        );
                      },
                      child: const SizedBox(
                        width: 25,
                        height: 25,
                        child: Image(
                          image: AssetImage(
                              'assets/images/ic_small_grid_gray_64.png'),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              // Container(
              //   child: ListView.builder(
              //     // shrinkWrap: true,
              //     //  physics: NeverScrollableScrollPhysics(),
              //     scrollDirection: Axis.vertical,
              //     itemCount: 10,
              //     itemBuilder: (BuildContext context, int index) {
              //       return GestureDetector(
              //         onTap: () {},
              //         child: CategoryBookListItemView(
              //           categoryBooksListVO: null,
              //           isAudioBook: false,
              //         ),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        )
      ],
    );
  }
}
