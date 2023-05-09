import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/pages/book_detail_page.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';

class RatingAndReviewDetailPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title:Text( "Ratings and reviews",
          style:
          TextStyle(
              color: Colors.black87,
              fontSize: TEXT_REGULAR_3X,
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
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
          child: Column(
            children: [
              RatingSectionView(),
              const SizedBox(height: MARGIN_MEDIUM_3,),
              RatingChipView(),
              const SizedBox(height: MARGIN_MEDIUM_3,),
              Container(
                height: MediaQuery.of(context).size.height*0.5,
                child: ListView.builder(
                  //shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: MARGIN_MEDIUM_3),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ReviewProfilePicView(),
                          SizedBox(width: MARGIN_MEDIUM_2,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ReviewTitleView(),
                                SizedBox(height: MARGIN_MEDIUM,),
                                ReviewRatingView(),
                                SizedBox(height: MARGIN_MEDIUM_3,),
                                ReviewDescriptionView()
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

class RatingChipView extends StatelessWidget {
  final List _chips = [
    {"name": "1", "selected": false},
    {"name": "2", "selected": false},
    {"name": "3", "selected": false},
    {"name": "4", "selected": false},
    {"name": "5", "selected": false}
  ];
  RatingChipView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.07,
        child: ListView.builder(
          // shrinkWrap: true,
          //  physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: _chips.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:Chip(
                    label: Text(_chips[index]["name"]),
                    avatar: Icon(Icons.star,color: Colors.black54,),
                    backgroundColor:Colors.white,
                    side: BorderSide(
                      color: Colors.black12,
                      width: 1,
                    ),
                    labelStyle: TextStyle(color:Colors.black54),
                    elevation: 0,
                    // shadowColor: Colors.grey[50],
                    padding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ));
            })
      // ListView(
      //   scrollDirection: Axis.horizontal,
      //   children: _chips.map((chip) {
      //     return Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Chip(
      //         label: Text(chip.name),
      //         backgroundColor: Colors.grey[300],
      //         labelStyle: TextStyle(color: Colors.black),
      //         elevation: 3,
      //         shadowColor: Colors.grey[50],
      //         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      //       ),
      //     );
      //   }).toList(),
      // ),
    );
  }
}