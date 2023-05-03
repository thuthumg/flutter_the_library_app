import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:flutter_the_library_app/widgets/bottom_sheet_view.dart';

class BookItemView extends StatelessWidget {
  final bool isAudioBook;
  final BookVO? bookVO;

  const BookItemView({super.key, required this.isAudioBook,required this.bookVO});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.only(
                  top: MARGIN_MEDIUM_1,
                  left: MARGIN_MEDIUM_2,
                  ),
              height: 225,
              child: Stack(
                children: [
                  Positioned(
                    top: 0.0,
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      margin: const EdgeInsets.only(top: 3.0, bottom: 3.0),
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                NetworkImage(bookVO?.bookImage??""),
                               // AssetImage("assets/images/sample_book_img.jpg"),
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
                          onTap: (){
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return BottomSheetView(
                                  bookVO: bookVO,
                                  isMarkAsRead: true,);
                              },
                            );
                          },
                          child: const Image(
                            image: AssetImage('assets/images/contextualMenu.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                      visible:isAudioBook,
                      child: Align(
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
                  ),)

                  ,
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
            child: Text(bookVO?.title??"",
              style: const TextStyle(
                  fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
            child: Text(bookVO?.author??"",
              style: const TextStyle(
                  fontSize: TEXT_REGULAR, fontWeight: FontWeight.w400),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}


