import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_the_library_app/blocs/book_detail_bloc.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/pages/about_ebook_detail_page.dart';
import 'package:flutter_the_library_app/pages/rating_and_review_detail_page.dart';
import 'package:flutter_the_library_app/resources/colors.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:provider/provider.dart';

class BookDetailPage extends StatelessWidget{

  final BookVO? bookVO;

  BookDetailPage({
    required this.bookVO
});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> BookDetailsBloc(bookVO),
      child: Selector<BookDetailsBloc,BookVO?>(
        selector:(context,bloc)=> bloc.bookVO,
        builder: (context,bookVO,child)=>
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(MARGIN_MEDIUM_2),
                child: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.grey,size: 25,),
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.all(MARGIN_MEDIUM_2),
                child: Image(image: AssetImage('assets/images/ic_export_gray_64.png')),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BookDetailInfoView(bookVO: bookVO,),
                DividerView(),
                FreeSampleAndWishlistButtonView(),
                DividerView(),
                AboutEbookDescView(bookVO: bookVO,),
                RatingAndReviewSectionView(),
                PublishedSectionView(),
                SizedBox(height: MARGIN_MEDIUM_3,)

              ],
            ),
          ),
        ),
      ),
    );
  }
  
}

class PublishedSectionView extends StatelessWidget {
  const PublishedSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Published",
            style: TextStyle(
                color: Colors.black87,
                fontSize: TEXT_REGULAR_3X,
                fontWeight: FontWeight.w500
            ),),
          SizedBox(height: MARGIN_MEDIUM_3,),
          Text("December 1, 2007 . Open Road+Grove/Atlantic",
            style: TextStyle(
                color: Colors.black54,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w500
            ),),
        ],
      ),
    );
  }
}

class RatingAndReviewSectionView extends StatelessWidget {
  const RatingAndReviewSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(MARGIN_MEDIUM_3),
      child: Column(
        children: [
          const RatingsAndReviewsTitleView(),
          const SizedBox(height: MARGIN_MEDIUM_3,),
          RatingSectionView(),
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
                          children: const [
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
    );
  }
}

class ReviewProfilePicView extends StatelessWidget {
  const ReviewProfilePicView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 3.0,bottom: 3.0),
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        // border: Border.all(
        //   color: Colors.blue,
        //   // set the border stroke color here
        //   width: 2.0,
        //   // set the width of the border stroke here
        // ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/pic_profile.jpg"),
        ),
      ),
    );
  }
}

class ReviewDescriptionView extends StatelessWidget {
  const ReviewDescriptionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text("Had to buy the book for class, really convenient. excellent book btw",
      style: TextStyle(
          color: Colors.black38,
          fontSize: TEXT_REGULAR_2X,
          fontWeight: FontWeight.w500
      ),);
  }
}

class ReviewRatingView extends StatelessWidget {
  const ReviewRatingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingView(),
        SizedBox(width: MARGIN_MEDIUM,),
        const Text("5/21/14",
          style: TextStyle(
              color: Colors.black38,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w600
          ),)
      ],
    );
  }
}

class ReviewTitleView extends StatelessWidget {
  const ReviewTitleView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text("Steven Gomez",
      style: TextStyle(
          color: Colors.black87,
          fontSize: TEXT_REGULAR_3X,
          fontWeight: FontWeight.w500
      ),);
  }
}

class RatingSectionView extends StatelessWidget {
  const RatingSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RateCountAndRateSectionView(),
        const SizedBox(width: MARGIN_MEDIUM_2,),
        Expanded(
          child: Column(
            children: const [
              RatingProgressLineView(
                rateNum: "5",
                rateProgressValueFactor: 0.3,
              ),
              SizedBox(height: MARGIN_MEDIUM,),
              RatingProgressLineView(
                rateNum: "4",
                rateProgressValueFactor: 0.48,
              ),
              SizedBox(height: MARGIN_MEDIUM,),
              RatingProgressLineView(
                rateNum: "3",
                rateProgressValueFactor: 0.2,
              ),
              SizedBox(height: MARGIN_MEDIUM,),
              RatingProgressLineView(
                rateNum: "2",
                rateProgressValueFactor: 0.08,
              ),
              SizedBox(height: MARGIN_MEDIUM,),
              RatingProgressLineView(
                rateNum: "1",
                rateProgressValueFactor: 0.03,
              )
            ],
          ),
        )
      ],
    );
  }
}

class RatingProgressLineView extends StatelessWidget {

  final String rateNum;
  final double rateProgressValueFactor;

  const RatingProgressLineView({
    super.key,
    required this.rateNum,
    required this.rateProgressValueFactor
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(rateNum,
          style: const TextStyle(
              color: Colors.black,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w500
          ),),
        SizedBox(width: MARGIN_MEDIUM_2,),
        Expanded(
          child:
          RatingProgressBarView(rateProgressValueFactor:rateProgressValueFactor)
          // Container(
          //   width: 250,
          //   height: 15,
          //  child: ClipRRect(
          //    borderRadius: BorderRadius.circular(10), // Add rounded corners to the progress bar
          //    child: LinearProgressIndicator(
          //      value: 0.5, // Specify the current progress value (between 0.0 and 1.0)
          //      backgroundColor: Colors.grey[300], // Specify the background color of the progress bar
          //      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Specify the color of the progress bar
          //    ),
          //  ),
          // ),
        )
      ],
    );
  }
}

class RatingProgressBarView extends StatelessWidget {

  final double rateProgressValueFactor;

  const RatingProgressBarView({
    super.key,
    required this.rateProgressValueFactor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Specify the width of the progress bar
      height: 13, // Specify the height of the progress bar
      decoration: BoxDecoration(
        color: Colors.grey[300], // Specify the background color of the progress bar
        borderRadius: BorderRadius.circular(10), // Add rounded corners to the progress bar
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), // Add rounded corners to the progress bar
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft, // Set the alignment to the left
          widthFactor: rateProgressValueFactor, // Set the width factor to the current progress value (between 0.0 and 1.0)
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.blue, // Specify the color of the progress bar
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), // Set the top left corner radius of the progress bar
                bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RatingsAndReviewsTitleView extends StatelessWidget {
  const RatingsAndReviewsTitleView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Ratings and reviews",
          style: TextStyle(
              color: Colors.black87,
              fontSize: TEXT_REGULAR_3X,
              fontWeight: FontWeight.w600
          ),),
        GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RatingAndReviewDetailPage(),
                ),
              );
            },
            child: const Icon(Icons.arrow_forward_ios_sharp,color: SECONDARY_COLOR,))
      ],
    );
  }
}

class RateCountAndRateSectionView extends StatelessWidget {
  const RateCountAndRateSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("3.9",
          style: TextStyle(
              color: Colors.black,
              fontSize:TEXT_BIG_2X,
              fontWeight: FontWeight.w600
          ),),
        RatingView(),
        const SizedBox(height: MARGIN_MEDIUM,),
        const Text("95 ratings",
          style: TextStyle(
              color: Colors.black38,
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w600
          ),)
      ],
    );
  }
}
class RatingView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  RatingBar.builder(
        initialRating: 4.0,
        itemBuilder: (BuildContext context, int index) => const Icon(
          Icons.star,
          color: SECONDARY_COLOR,

        ),
        itemSize: TEXT_HEADING_1X,
        onRatingUpdate: (rating) {print(rating);});
  }
}
class AboutEbookDescView extends StatelessWidget {

  final BookVO? bookVO;

  const AboutEbookDescView({
    super.key,
    required this.bookVO
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(MARGIN_MEDIUM_3),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("About this ebook",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: TEXT_REGULAR_3X,
                    fontWeight: FontWeight.w600
                ),),
              GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutEbookDetailPage(
                          bookTitle:bookVO?.title??"",
                          bookDesc: bookVO?.description??"",),
                      ),
                    );

                  },
                  child: const Icon(Icons.arrow_forward_ios_sharp,color: SECONDARY_COLOR,))
            ],
          ),
          const SizedBox(height: MARGIN_MEDIUM_3,),
          Text(bookVO?.description??"The New York Times-bestselling author's "
              "Whitbread Prize-winning debut-Winterson has "
              "mastedred both comedy and tragedy in this rich "
              "little novel (The washington Post Book World).",
            style: const TextStyle(
                color: Colors.black54,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w500
            ),)
        ],
      ),
    );
  }
}

class FreeSampleAndWishlistButtonView extends StatelessWidget {
  const FreeSampleAndWishlistButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         // crossAxisAlignment:CrossAxisAlignment.center ,
          children: const [
            FreeSampleButtonView(),
            Expanded(
              child: AddToWishlistView(),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.info_outline,color: Colors.black54,),
              SizedBox(width: MARGIN_MEDIUM_2,),
              Expanded(
                child: Text("Books that you buy on the Google Play website can be read in this app.",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w500
                  ),),
              ),
            ],
          ),
        ),
       const SizedBox(height: MARGIN_MEDIUM_3,)
      ],
    );
  }
}

class AddToWishlistView extends StatelessWidget {
  const AddToWishlistView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MARGIN_MEDIUM_2),
      height: MediaQuery.of(context).size.height*0.07,
      decoration: const BoxDecoration(
        color: SECONDARY_COLOR,
       // shape: BoxShape.circle,
       //  border: Border.all(
       //      color: Colors.black26,
       //      width: 1
       //  ),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.bookmark_add,color: Colors.white,),
          Text("Add to wishlist",
            style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w500
            ),),
        ],
      ),
    );
  }
}

class FreeSampleButtonView extends StatelessWidget {
  const FreeSampleButtonView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.07,
      width: MediaQuery.of(context).size.width*0.4,
      margin: const EdgeInsets.only(top: MARGIN_MEDIUM_2,
          left: MARGIN_MEDIUM_2,
          bottom: MARGIN_MEDIUM_2),
      decoration: BoxDecoration(
          color: Colors.white,
         // shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black26,
            width: 1
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
      child: const Center(
        child: Text("Free sample",
        style: TextStyle(
          color: SECONDARY_COLOR,
          fontSize: TEXT_REGULAR_2X,
          fontWeight: FontWeight.w500
        ),),
      ),
    );
  }
}

class DividerView extends StatelessWidget {
  const DividerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: 1,
    );
  }
}

class BookDetailInfoView extends StatelessWidget {

  final BookVO? bookVO;

  const BookDetailInfoView({
    super.key,
    required this.bookVO
  });



  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Padding(
              padding: EdgeInsets.all(MARGIN_MEDIUM_2),
              child:(bookVO?.bookImage == "")?
              Container(
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                      //(bookVO?.bookImage == null) ?
                       AssetImage("assets/images/empty_book.png")
                     // NetworkImage(bookVO?.bookImage??""),
                    )),
              )
                  : Container(
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                      //(bookVO?.bookImage == null) ?
                      //  AssetImage("assets/images/sample_book_img.jpg")
                      NetworkImage(bookVO?.bookImage??""),
                    )),
              )
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: MARGIN_MEDIUM_2),
                  width: MediaQuery.of(context).size.width*0.68,
                  child: Text(
                    bookVO?.title??"",
                    style: const TextStyle(
                      color: Colors.black87,
                        fontSize: TEXT_HEADING_1X,
                        fontWeight: FontWeight.w600),
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
                      color: Colors.black54,
                        fontSize: TEXT_REGULAR,
                        fontWeight: FontWeight.w400),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: MARGIN_MEDIUM),
                  width: MediaQuery.of(context).size.width*0.68,
                  child: Text(
                    "Ebook. 187 pages",
                    style: const TextStyle(
                        color: Colors.black54,
                        fontSize: TEXT_REGULAR,
                        fontWeight: FontWeight.w400),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          )
        ]

    );
  }
}