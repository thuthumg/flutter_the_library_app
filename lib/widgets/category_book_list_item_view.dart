import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:flutter_the_library_app/widgets/book_item_view.dart';

class CategoryBookListItemView extends StatelessWidget {

  final bool isAudioBook;

  CategoryBookListItemView({required this.isAudioBook});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MARGIN_MEDIUM),
      // height: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(MARGIN_MEDIUM)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: MARGIN_MEDIUM_2,
                left: MARGIN_MEDIUM_2,
                right: MARGIN_MEDIUM_2),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.only(
                      top: MARGIN_MEDIUM,
                      left: MARGIN_MEDIUM_2,
                      right: MARGIN_MEDIUM_2),
                  child: const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac dui libero. Nam sed nunc sapien. Suspendisse ornare arcu eu lorem consectetur, sit amet maximus turpis malesuada. '
                    'Duis ac euismod augue, vel feugiat metus.',
                    style: TextStyle(
                        fontSize: TEXT_REGULAR_2X, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.only(
                  top: MARGIN_MEDIUM,
                  left: MARGIN_MEDIUM_2,
                  right: MARGIN_MEDIUM_2),
              height: 300,
              child: ListView.builder(
                // shrinkWrap: true,
                //  physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: BookItemView(isAudioBook: isAudioBook,),
                  );
                },
              )),
        ],
      ),
    );
  }
}
