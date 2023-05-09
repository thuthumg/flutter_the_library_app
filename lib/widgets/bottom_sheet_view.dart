import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/resources/colors.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:flutter_the_library_app/resources/strings.dart';

class BottomSheetView extends StatelessWidget {

  final BookVO? bookVO;
  final bool isMarkAsRead;
  final bool isFromFilterPage;

  const BottomSheetView({
    super.key,
    required this.isMarkAsRead,
    required this.bookVO,
    required this.isFromFilterPage
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isFromFilterPage?
      MediaQuery.of(context).size.height * 0.6 :
      MediaQuery.of(context).size.height * 0.55,
      color: PRIMARY_COLOR,
      child:Column(
        children: [
          //bookInfo
        BookInfoView(bookVO: bookVO),
        Container(
          color: Colors.black12,
          height: 1,
        ),
        //action button
          ActionButtonView(isFromFilterPage:isFromFilterPage)

        ],
      )

    );
  }
}

class ActionButtonView extends StatelessWidget {

  final bool isFromFilterPage;

  const ActionButtonView({
    super.key,
    required this.isFromFilterPage
  });

  @override
  Widget build(BuildContext context) {
    return
      isFromFilterPage?
      Column(
        children: [
          const SizedBox(height: MARGIN_MEDIUM_1,),
          Padding(
            padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
            child: Row(
              children: [
                Container(

                    padding: const EdgeInsets.all(MARGIN_MEDIUM),
                    width: BOTTOM_SHEET_ICON_SIZE,
                    height: BOTTOM_SHEET_ICON_SIZE,
                    child: const Image(image: AssetImage('assets/images/ic_remove_64.png'),))  ,
                //  Icon(Icons.download,color: Colors.grey,),
                const SizedBox(width: MARGIN_MEDIUM_1,),
                const Text(
                  REMOVE_DOWNLOAD_TXT,
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
                  child: const Image(image: AssetImage('assets/images/ic_bookmark_white_64.png'),)),
              const SizedBox(width: MARGIN_MEDIUM_1,),
              const Text(
                ADD_TO_WHISHLIST_TXT,
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
                  child: const Image(image: AssetImage('assets/images/ic_about_this_book_64.png'),)),
              const SizedBox(width: MARGIN_MEDIUM_1,),
              const Text(
                ABOUT_THIS_BOOK_TXT,
                style: TextStyle(
                    fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              )
            ],),
          )
        ],
      ):
      Column(
      children: [
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
    );
  }
}

class BookInfoView extends StatelessWidget {
  const BookInfoView({
    super.key,
    required this.bookVO,
  });

  final BookVO? bookVO;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Padding(
          padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
          child:
          Container(
            height: 125,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                  //(bookVO?.bookImage == null) ?
                 // AssetImage("assets/images/sample_book_img.jpg") :
                  NetworkImage(bookVO?.bookImage??""),
                )),
          )
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: MARGIN_MEDIUM_2),
              width: MediaQuery.of(context).size.width*0.68,
              child: Text(
                bookVO?.title??"",
                style: const TextStyle(
                    fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: MARGIN_MEDIUM),
              width: MediaQuery.of(context).size.width*0.68,
              child: Text(
                bookVO?.author??"",
                style: const TextStyle(
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w400),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        )
      ]

    );
  }
}