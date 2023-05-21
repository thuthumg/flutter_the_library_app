import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/blocs/category_detail_bloc.dart';
import 'package:flutter_the_library_app/data/vos/each_category_book_vo.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:provider/provider.dart';

class EachCategoryBooksListPage extends StatelessWidget{

  final String listNameEncoded;
  final String categoryName;

  EachCategoryBooksListPage(
  {
    required this.listNameEncoded,
    required this.categoryName
});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryDetailBloc(listNameEncoded),
      child: Selector<CategoryDetailBloc, List<EachCategoryBookVO>?>(
        selector: (context, bloc) => bloc.mEachCategoryBookVO,
        builder: (context, eachCategoryBookVOList, child) =>
         Scaffold(
          appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            centerTitle: true,
            title:Text( categoryName??"",
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
            child: Container(
              margin: EdgeInsets.all(MARGIN_MEDIUM_3),
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 15.0, // Spacing between columns
                    //mainAxisSpacing: 0, // Spacing between rows
                    childAspectRatio: 0.49 //
                ),
                itemCount: eachCategoryBookVOList?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    //height: 500,
                    // alignment: Alignment.center,
                    //color: Colors.blueGrey[100],
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                             // height: 300,
                                height: 270,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 0.0,
                                    bottom: 0.0,
                                    left: 0.0,
                                    right: 0.0,
                                    child: Container(
                                       //height: 300,
                                      // margin: const EdgeInsets.only(top: 3.0, bottom: 3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.black45,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(6)),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image:
                                            // NetworkImage(eachCategoryBookVOList?[index].bookDetails?[0].bookImage??""),
                                            AssetImage(
                                                "assets/images/empty_book.png",),
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
                                          onTap: () {
                                            // showModalBottomSheet<void>(
                                            //   context: context,
                                            //   builder: (BuildContext context) {
                                            //     return BottomSheetView(
                                            //       bookVO: bookVO,
                                            //       isMarkAsRead: true,);
                                            //   },
                                            // );
                                          },
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/contextualMenu.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 32,
                                        height: 32,
                                        decoration: const BoxDecoration(
                                          color: Colors.black45,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/earphone.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 32,
                                        height: 32,
                                        decoration: const BoxDecoration(
                                          color: Colors.black45,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/ic_check_white_64.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )

                            // Image(
                            //     fit: BoxFit.cover,
                            //     image: AssetImage('assets/images/sample_book_img.jpg')),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: MARGIN_MEDIUM,
                                left: MARGIN_MEDIUM,
                                right: MARGIN_MEDIUM_2),
                            child: Text(
                              eachCategoryBookVOList?[index].bookDetails?[0].title??"",
                              style: const TextStyle(
                                color: Colors.black54,
                                  fontSize: TEXT_REGULAR_2X,
                                  fontWeight: FontWeight.w600),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: 6,),
                          Container(
                            padding: const EdgeInsets.only(
                                left: MARGIN_MEDIUM, right: MARGIN_MEDIUM_2),
                            child: Text(
                              "${eachCategoryBookVOList?[index].bookDetails?[0].author??""} \n Ebook.Sample",
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: TEXT_REGULAR,
                                  fontWeight: FontWeight.w400),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

}