import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';

class BookItemView extends StatelessWidget {
  final bool isAudioBook;

  BookItemView({required this.isAudioBook});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(
                  top: MARGIN_MEDIUM_2,
                  left: MARGIN_MEDIUM_2,
                  right: MARGIN_MEDIUM_2),
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
                      decoration: const BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/images/sample_book_img.jpg"),
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 32,
                        height: 32,
                        child: Image(
                          image: AssetImage('assets/images/contextualMenu.png'),
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
            padding: EdgeInsets.only(
                top: MARGIN_MEDIUM,
                left: MARGIN_MEDIUM_2,
                right: MARGIN_MEDIUM_2),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac dui libero. Nam sed nunc sapien. Suspendisse ornare arcu eu lorem consectetur, sit amet maximus turpis malesuada. '
              'Duis ac euismod augue, vel feugiat metus.',
              style: TextStyle(
                  fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding:
                EdgeInsets.only(left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur',
              style: TextStyle(
                  fontSize: TEXT_REGULAR, fontWeight: FontWeight.w600),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
