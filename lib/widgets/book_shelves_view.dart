import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/pages/create_shelf_page.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';

class BookShelvesView extends StatelessWidget {
  const BookShelvesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child:
          EmptyView(),
        ),

       // ShelvesListView(),

        Align(
          alignment: Alignment.bottomCenter,
          child:
          ShelfCreateNewView(),
        )
      ],



    );
  }
}
class ShelvesListView extends StatelessWidget {
  const ShelvesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 90,
                          width: 60,
                          margin: const EdgeInsets.only(
                              top: MARGIN_MEDIUM, bottom: MARGIN_MEDIUM),
                          decoration: const BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                // NetworkImage(bookVO?.bookImage??""),
                                AssetImage("assets/images/sample_book_img.jpg"),
                              )),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              padding: const EdgeInsets.only(
                                 top: MARGIN_MEDIUM,
                                  left: MARGIN_MEDIUM_2,
                                  right: MARGIN_MEDIUM_2),
                              child: const Text(
                                "10 Interaction Design Books to Read",
                                style: TextStyle(
                                  color: Colors.black,
                                    fontSize: TEXT_REGULAR_3X,
                                    fontWeight: FontWeight.w500),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
                              child: const Text(
                                "3 books",
                                style: TextStyle(
                                    fontSize: TEXT_REGULAR,
                                    fontWeight: FontWeight.w400),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      // decoration: const BoxDecoration(
                      //   color: Colors.black45,
                      //   borderRadius: BorderRadius.all(Radius.circular(8)),
                      // ),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            top: MARGIN_MEDIUM_2,

                            right: MARGIN_MEDIUM_2),
                        child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.grey,)
                      ),
                    )
                  ],
                ),
                Container(
                  color: Colors.black12,
                  height: 1,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


class ShelfCreateNewView extends StatelessWidget {
  const ShelfCreateNewView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateShelfPage(isCreateNewShelf: false,),
          ),
        );
      },
      child: Container(
        width: 155,
        height: 45,
        margin: const EdgeInsets.only(bottom: MARGIN_MEDIUM),
        decoration: BoxDecoration(
            color: Color.fromRGBO(0, 122, 201, 1),
            borderRadius: const BorderRadius.all(Radius.circular(25)),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.edit,color: Colors.white,),
            SizedBox(width: MARGIN_MEDIUM,),
            Text(
              "Create new",
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.w400),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}

class EmptyView extends StatelessWidget {
  const EmptyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 200,
            height: 150,
            child: Image(image:AssetImage("assets/images/empty_shelf_icon.png") ,)),
        Text(
          "No shelves",
          style: const TextStyle(
              fontSize: TEXT_REGULAR_3X, fontWeight: FontWeight.w600),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: MARGIN_MEDIUM,),

        Text(
          "Create shelves to match the way \n you think.",
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.grey,
              fontSize: TEXT_REGULAR, fontWeight: FontWeight.w400),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}