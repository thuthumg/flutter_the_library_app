

import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/components/display_and_sorting_view.dart';
import 'package:flutter_the_library_app/resources/colors.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:flutter_the_library_app/widgets/edit_text_with_limit_view.dart';
import 'package:flutter_the_library_app/widgets/shelf_action_bottom_sheet_view.dart';

class CreateShelfPage extends StatefulWidget{

  bool isCreateNewShelf;


  CreateShelfPage({required this.isCreateNewShelf});

  @override
  State<CreateShelfPage> createState() => _CreateShelfPageState();
}

class _CreateShelfPageState extends State<CreateShelfPage> {
  bool renameShelf = false;
  String paramRenameShelfName = "";
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       elevation: 0,
       backgroundColor: PRIMARY_COLOR,
       centerTitle: true,
       title: Text("Create shelf",style: TextStyle(
         color: Colors.black,
         fontSize: TEXT_REGULAR_2X,
         fontWeight: FontWeight.w500
       ),),
       leading: GestureDetector(
           onTap: (){
             Navigator.pop(context);
           },
           child: Icon(Icons.arrow_back_ios,
             color: Colors.black54,size: 20,)),
       actions: [
         Visibility(
             visible: !widget.isCreateNewShelf,
             child: Container(
               width: 35,
               height: 35,
               margin: EdgeInsets.only(right: MARGIN_MEDIUM),
               padding: EdgeInsets.only(left: MARGIN_MEDIUM,right: MARGIN_MEDIUM),
               child: GestureDetector(
                 onTap: () {
                   showModalBottomSheet<void>(
                     context: context,
                     builder: (BuildContext context) {
                       return ShelfActionBottomSheetView(
                         shelfTitle: "10 Interaction Design Books to Read",
                       onTapRenameShelf: (shelfName){
                           setState(() {
                             renameShelf = true;
                             paramRenameShelfName = shelfName;
                             Navigator.pop(context);
                           });

                       },
                       onTapDeleteShelf: (){
                           setState(() {
                             Navigator.pop(context);
                           });

                       },);
                     },
                   );
                 },
                 child: const Image(
                   image: AssetImage(
                       'assets/images/ic_more_gray_64.png'),
                 ),
               ),
             ))

       ],

     ),
     body:
     Padding(
      // height: MediaQuery.of(context).size.height,
       padding: const EdgeInsets.only(top: MARGIN_MEDIUM_3),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Visibility(
               visible:  (widget.isCreateNewShelf == true || renameShelf == true),
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
                 child: EditTextWithLimitView(maxLength: 50,
                     paramRenameShelfName:paramRenameShelfName,
                   onTapDone: (){
                     Navigator.pop(context);
                   },),
               ),),
           Visibility(
             visible:  (!widget.isCreateNewShelf && renameShelf == false),
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
               child: Text("10 Interaction Design Books to Read",style: TextStyle(
                   color: Colors.black,
                   fontSize:TEXT_HEADING_1X,
                   fontWeight: FontWeight.w500
               ),),
             ),
           ),
           Visibility(
             visible:  !widget.isCreateNewShelf,
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
               child: Text("3 books",style: TextStyle(
                   color: Colors.grey,
                   fontSize:TEXT_REGULAR,
                   fontWeight: FontWeight.w300
               ),),
             ),
           ),
           Visibility(
             visible:  !widget.isCreateNewShelf,
             child: Expanded(
                 child: DisplayAndSortingView()),
           )

         ],
       ),
     ),

   );

  }
}