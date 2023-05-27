import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/pages/add_to_shelves_page.dart';
import 'package:flutter_the_library_app/resources/colors.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:flutter_the_library_app/resources/strings.dart';

class BottomSheetView extends StatelessWidget {

  final BookVO? bookVO;
  final bool isMarkAsRead;
  final bool isFromFilterPage;
  Function onTapAddToShelves;
  Function onTapDeleteBookFromYourLibrary;

  BottomSheetView({
    super.key,
    required this.onTapDeleteBookFromYourLibrary,
    required this.isMarkAsRead,
    required this.bookVO,
    required this.isFromFilterPage,
    required this.onTapAddToShelves
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
          ActionButtonView(isFromFilterPage:isFromFilterPage,bookVO: bookVO,onTapAddToShelves: (){
            onTapAddToShelves();
          },
          onTapDeleteBookFromYourLibrary: (){
             onTapDeleteBookFromYourLibrary();
          },
          )

        ],
      )

    );
  }
}

class ActionButtonView extends StatelessWidget {
  Function onTapAddToShelves;
  Function onTapDeleteBookFromYourLibrary;
  final BookVO? bookVO;
  final bool isFromFilterPage;

  ActionButtonView({
    super.key,
    required this.onTapDeleteBookFromYourLibrary,
    required this.onTapAddToShelves,
    required this.isFromFilterPage,
    required this.bookVO
  });

  @override
  Widget build(BuildContext context) {
    return
      isFromFilterPage?
      Column(
        children: [
          const SizedBox(height: MARGIN_MEDIUM_1,),

          ///Remove download
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
          ///delete from your library
          Padding(
            padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
            child: GestureDetector(
              onTap: (){
                onTapDeleteBookFromYourLibrary();
              },
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
          ),
          const SizedBox(height: MARGIN_MEDIUM_1,),
          ///add to whishlist
          Padding(
            padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
            child: Row(children: [
              Container(
                  padding: const EdgeInsets.all(MARGIN_MEDIUM),
                  width: BOTTOM_SHEET_ICON_SIZE,
                  height: BOTTOM_SHEET_ICON_SIZE,
                  child: const Image(image: AssetImage('assets/images/ic_bookmark_grey_64.png'),)),
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
          ///Add to shelves
          GestureDetector(
            onTap: (){

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddToShelvesPage(bookVO: bookVO),
                ),
              );
            },
            child: Padding(
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
          ),
          const SizedBox(height: MARGIN_MEDIUM_1,),
          ///About this book
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
        ///download
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
        ///delete from library
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
        ///Add to shelves
        Padding(
          padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
          child: GestureDetector(
            onTap: (){
              onTapAddToShelves();
             //
             //  Navigator.push(
             //    context,
             //    MaterialPageRoute(
             //      builder: (context) => AddToShelvesPage(bookVO: bookVO),
             //    ),
             //  );

            },
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
        ),
        const SizedBox(height: MARGIN_MEDIUM_1,),
        ///Mark as read
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
          (bookVO?.bookImage == "")?
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
                   AssetImage("assets/images/empty_book.png")
                 // NetworkImage(bookVO?.bookImage??""),
                )),
          ):
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