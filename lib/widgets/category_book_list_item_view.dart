import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/data/vos/category_books_list_vo.dart';
import 'package:flutter_the_library_app/pages/book_detail_page.dart';
import 'package:flutter_the_library_app/pages/each_category_books_list_page.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:flutter_the_library_app/widgets/book_item_view.dart';

class CategoryBookListItemView extends StatefulWidget {
  final CategoryBooksListVO? categoryBooksListVO;
  final bool isAudioBook;

  const CategoryBookListItemView({super.key,
    required this.categoryBooksListVO,
    required this.isAudioBook});

  @override
  State<CategoryBookListItemView> createState() => _CategoryBookListItemViewState();
}

class _CategoryBookListItemViewState extends State<CategoryBookListItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
       //   top: MARGIN_MEDIUM,
          left: MARGIN_MEDIUM,
          right:  MARGIN_MEDIUM),
      // height: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(MARGIN_MEDIUM)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
               // top: MARGIN_MEDIUM,
                left: MARGIN_MEDIUM_2,
                right: MARGIN_MEDIUM_2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(widget.categoryBooksListVO?.displayName??"",
                    style: const TextStyle(
                        fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EachCategoryBooksListPage(
                            listId: widget.categoryBooksListVO?.listId ?? 0,
                            listNameEncoded: widget.categoryBooksListVO?.listNameEncoded ?? "",
                             categoryName: widget.categoryBooksListVO?.listNameEncoded ?? ""
                          ),
                        ),
                      );
                    });

                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
              height: 300,
              child: ListView.builder(
                key: Key('categoryListView'),
                // shrinkWrap: true,
                //  physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: widget.categoryBooksListVO?.books?.length,
                itemBuilder: (BuildContext context, int index) {
                  widget.categoryBooksListVO?.books?[index].categoryId = widget.categoryBooksListVO?.listId;
                  widget.categoryBooksListVO?.books?[index].categoryName = widget.categoryBooksListVO?.listName;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.categoryBooksListVO?.books?[index].categoryId = widget.categoryBooksListVO?.listId;
                        widget.categoryBooksListVO?.books?[index].categoryName = widget.categoryBooksListVO?.listName;
                        if( widget.categoryBooksListVO?.books?[index] != null)
                          {
                            _navigateToBookDetailsScreen(context,  widget.categoryBooksListVO?.books?[index]);
                          }


                      });

                    },
                    child: BookItemView(
                      bookVO:widget.categoryBooksListVO?.books![index],
                      isAudioBook: widget.isAudioBook,),
                  );
                },
              ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _navigateToBookDetailsScreen(BuildContext context, BookVO? bookVO) {



    return Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetailPage(bookVO: bookVO,),
                        ),
                      );
  }
}
