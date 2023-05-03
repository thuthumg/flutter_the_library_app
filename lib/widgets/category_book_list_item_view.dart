import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/data/vos/category_books_list_vo.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:flutter_the_library_app/widgets/book_item_view.dart';

class CategoryBookListItemView extends StatelessWidget {
  final CategoryBooksListVO? categoryBooksListVO;
  final bool isAudioBook;

  const CategoryBookListItemView({super.key,
    required this.categoryBooksListVO,
    required this.isAudioBook});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          top: MARGIN_MEDIUM,
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
                top: MARGIN_MEDIUM,
                left: MARGIN_MEDIUM_2,
                right: MARGIN_MEDIUM_2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(categoryBooksListVO?.displayName??"",
                    style: const TextStyle(
                        fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          SizedBox(
              height: 300,
              child: ListView.builder(
                // shrinkWrap: true,
                //  physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: categoryBooksListVO?.books?.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: BookItemView(
                      bookVO:categoryBooksListVO?.books![index],
                      isAudioBook: isAudioBook,),
                  );
                },
              )),
        ],
      ),
    );
  }
}
