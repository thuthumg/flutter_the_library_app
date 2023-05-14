import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/blocs/library_bloc.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/resources/colors.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';

import 'package:flutter_the_library_app/widgets/radio_group_view.dart';
import 'package:provider/provider.dart';

class FilterBottomSheetView extends StatelessWidget {
  final List<String> filterTypeList;
  final BookVO? bookVO;
  final bool isMarkAsRead;
  final String filterTitle;
  final Function(String?,BuildContext?) onTapFilterItem;
  final String autoSelectedData;



  FilterBottomSheetView({
    super.key,
    required this.isMarkAsRead,
    required this.bookVO,
    required this.filterTypeList,
    required this.filterTitle,
    required this.onTapFilterItem,
    required this.autoSelectedData
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LibraryBloc(),
      child: Container(
         // height: MediaQuery.of(context).size.height * 0.35,
          color: PRIMARY_COLOR,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //bookInfo
              Padding(
                padding: EdgeInsets.only(top:MARGIN_MEDIUM_2,left: MARGIN_MEDIUM_3,bottom:MARGIN_MEDIUM_2),
                child: Text(
                  filterTitle,
                  style: const TextStyle(
                      fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              )
              ,
              Container(
                color: Colors.black12,
                height: 1,
              ),
              //action button
              const SizedBox(height: MARGIN_MEDIUM_1,),
              RadioGroupView(
                autoSelectedData:autoSelectedData,
                filterTypeList: filterTypeList,
                onTapFilterItem: (selectedItem,context){
                debugPrint("FilterBottomSheetView ${selectedItem}");
                this.onTapFilterItem(selectedItem,context);
              },)
            ],
          )

      ),
    );
  }
}