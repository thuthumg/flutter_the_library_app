import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/resources/colors.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';

class BottomSheetView extends StatelessWidget {

  final bool isMarkAsRead;

  const BottomSheetView({
    super.key,
    required this.isMarkAsRead
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: PRIMARY_COLOR,
      child:Column(
        children: [
          //bookInfo
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Padding(
              padding: const EdgeInsets.all(8.0),
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


              // Container(
              //   height: 125,
              //   width: 80,
              //   child: Image(image: AssetImage('assets/images/sample_book_img.jpg'),
              //     fit: BoxFit.cover,),
              // ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(MARGIN_MEDIUM),
                  child: Container(
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac dui libero. Nam sed nunc sapien. Suspendisse ornare arcu eu lorem consectetur, sit amet maximus turpis malesuada.',
                      style: TextStyle(
                          fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: MARGIN_MEDIUM,
                      right: MARGIN_MEDIUM,
                      bottom: MARGIN_MEDIUM),
                  child: Container(
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adi',
                      style: TextStyle(
                          fontSize: TEXT_REGULAR,
                          fontWeight: FontWeight.w400),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
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
          SizedBox(height: 10,),
          Row(
            children: [
            Icon(Icons.download,color: Colors.grey,),
            SizedBox(width: 10,),
            Text(
              'Download',
              style: TextStyle(
                  fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )
          ],),
          SizedBox(height: 10,),
          Row(children: [
            Icon(Icons.delete,color: Colors.grey,),
            SizedBox(width: 10,),
            Text(
              'Delete from your library',
              style: TextStyle(
                  fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )
          ],),
          SizedBox(height: 10,),
          Row(children: [
            Icon(Icons.add,color: Colors.grey,),
            SizedBox(width: 10,),
            Text(
              'Add to shelves...',
              style: TextStyle(
                  fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )
          ],),
          SizedBox(height: 10,),
          Row(children: [
            Icon(Icons.check_outlined,color: Colors.grey,),
            SizedBox(width: 10,),
            Text(
              'Mark as read',
              style: TextStyle(
                  fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )
          ],)
        ],
      )


      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     mainAxisSize: MainAxisSize.min,
      //     children: <Widget>[
      //       const Text('Modal BottomSheet'),
      //       ElevatedButton(
      //         child: const Text('Close BottomSheet'),
      //         onPressed: () => Navigator.pop(context),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}