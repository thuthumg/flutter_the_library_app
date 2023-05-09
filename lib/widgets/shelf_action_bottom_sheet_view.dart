import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/resources/colors.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';


class ShelfActionBottomSheetView extends StatelessWidget {

  final String shelfTitle;
  final Function(String) onTapRenameShelf;
  final Function onTapDeleteShelf;



  ShelfActionBottomSheetView({
    super.key,
    required this.shelfTitle,
    required this.onTapRenameShelf,
    required this.onTapDeleteShelf
  });

  @override
  Widget build(BuildContext context) {
    return Container(
       height: MediaQuery.of(context).size.height * 0.25,
        color: PRIMARY_COLOR,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //bookInfo
            Padding(
              padding: EdgeInsets.only(top:MARGIN_MEDIUM_2,left: MARGIN_MEDIUM_3,bottom:MARGIN_MEDIUM_2),
              child: Text(
                shelfTitle,
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
            GestureDetector(
              onTap: (){
                this.onTapRenameShelf(shelfTitle);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
                child: Row(children: [
                  Container(
                      padding: const EdgeInsets.all(MARGIN_MEDIUM),
                      width: BOTTOM_SHEET_ICON_SIZE,
                      height: BOTTOM_SHEET_ICON_SIZE,
                      child: Icon(Icons.edit,color: Colors.grey,),),
                  const SizedBox(width: MARGIN_MEDIUM_1,),
                  const Text(
                    "Rename shelf",
                    style: TextStyle(
                        fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )
                ],),
              ),
            )
            ,const SizedBox(height: MARGIN_MEDIUM_1,),
            GestureDetector(
              onTap: (){
                this.onTapDeleteShelf();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
                child: Row(children: [
                  Container(
                      padding: const EdgeInsets.all(MARGIN_MEDIUM),
                      width: BOTTOM_SHEET_ICON_SIZE,
                      height: BOTTOM_SHEET_ICON_SIZE,
                      child: const Image(image: AssetImage('assets/images/ic_delete_64.png'),)),
                  const SizedBox(width: MARGIN_MEDIUM_1,),
                  const Text(
                    "Delete shelf",
                    style: TextStyle(
                        fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )
                ],),
              ),
            )
          ],
        )

    );
  }
}