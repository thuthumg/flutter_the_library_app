import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/resources/colors.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:flutter_the_library_app/resources/strings.dart';

class BottomSheetView extends StatelessWidget {

  final bool isMarkAsRead;

  const BottomSheetView({
    super.key,
    required this.isMarkAsRead
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      color: PRIMARY_COLOR,
      child:Column(
        children: [
          //bookInfo
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Padding(
              padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
              child:
              Container(
                height: 125,
                width: 80,

                decoration: const BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                      AssetImage("assets/images/sample_book_img.jpg"),
                    )),
              )
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: MARGIN_MEDIUM_2),
                  width: MediaQuery.of(context).size.width*0.68,
                  child: const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac dui libero. Nam sed nunc sapien. Suspendisse ornare arcu eu lorem consectetur, sit amet maximus turpis malesuada.',
                    style: TextStyle(
                        fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: MARGIN_MEDIUM_2),
                  width: MediaQuery.of(context).size.width*0.68,
                  child: const Text(
                    'Lorem ipsum dolor sit amet, consectetur adi',
                    style: TextStyle(
                        fontSize: TEXT_REGULAR,
                        fontWeight: FontWeight.w400),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            )
      ]

        )
          ,
        Container(
          color: Colors.black12,
          height: 1,
        ),
        //action button
          const SizedBox(height: MARGIN_MEDIUM_1,),
          Padding(
            padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
            child: Row(
              children: [
              Container(

                  padding: const EdgeInsets.all(MARGIN_MEDIUM),
                  width: BOTTOM_SHEET_ICON_SIZE,
                  height: BOTTOM_SHEET_ICON_SIZE,
                  child: const Image(image: AssetImage('assets/images/ic_download_64.png'),))  ,
            //  Icon(Icons.download,color: Colors.grey,),
              const SizedBox(width: MARGIN_MEDIUM_1,),
              const Text(
                DOWNLOAD_TXT,
                style: TextStyle(
                    fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              )
            ],),
          ),
          const SizedBox(height: MARGIN_MEDIUM_1,),
          Padding(
            padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
            child: Row(children: [
              Container(
                  padding: const EdgeInsets.all(MARGIN_MEDIUM),
                  width: BOTTOM_SHEET_ICON_SIZE,
                  height: BOTTOM_SHEET_ICON_SIZE,
                  child: const Image(image: AssetImage('assets/images/ic_delete_64.png'),)),
              const SizedBox(width: MARGIN_MEDIUM_1,),
              const Text(
                DELETE_FROMA_YOUR_LIBRARY_TXT,
                style: TextStyle(
                    fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              )
            ],),
          ),
          const SizedBox(height: MARGIN_MEDIUM_1,),
          Padding(
            padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
            child: Row(children: [
              Container(
                  padding: const EdgeInsets.all(MARGIN_MEDIUM),
                  width: BOTTOM_SHEET_ICON_SIZE,
                  height: BOTTOM_SHEET_ICON_SIZE,
                  child: const Image(image: AssetImage('assets/images/ic_add_64.png'),)),
              const SizedBox(width: MARGIN_MEDIUM_1,),
              const Text(
                ADD_TO_SHELVES_TXT,
                style: TextStyle(
                    fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              )
            ],),
          ),
          const SizedBox(height: MARGIN_MEDIUM_1,),
          Padding(
            padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
            child: Row(children: [
              Container(
                  padding: const EdgeInsets.all(MARGIN_MEDIUM),
                  width: BOTTOM_SHEET_ICON_SIZE,
                  height: BOTTOM_SHEET_ICON_SIZE,
                  child: const Image(image: AssetImage('assets/images/ic_check_64.png'),)),
              const SizedBox(width: MARGIN_MEDIUM_1,),
              const Text(
                MARK_AS_READ_TXT,
                style: TextStyle(
                    fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              )
            ],),
          )
        ],
      )

    );
  }
}