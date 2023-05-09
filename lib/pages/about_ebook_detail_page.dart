
import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';

class AboutEbookDetailPage extends StatelessWidget{
  final String bookDesc;
  final String bookTitle;

  AboutEbookDetailPage({
    required this.bookDesc,
    required this.bookTitle
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title:Text( bookTitle,
          style: 
          TextStyle(
            color: Colors.black87,
            fontSize: TEXT_HEADING_1X,
            fontWeight: FontWeight.w600
          ),),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.all(MARGIN_MEDIUM_2),
            child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black87,size: 25,),
          ),
        ),
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MARGIN_MEDIUM_3),
          child: Text(bookDesc,style:
              TextStyle(
              color: Colors.black54,
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w500
          ),),
        ),
      ),
    );
  }

}