import 'package:flutter/material.dart';

import 'package:flutter_the_library_app/blocs/shelves_bloc.dart';

import 'package:flutter_the_library_app/data/vos/shelves_vo.dart';
import 'package:flutter_the_library_app/pages/create_shelf_page.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:provider/provider.dart';

class BookShelvesView extends StatelessWidget {
  const BookShelvesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShelvesBloc(),
      child: Selector<ShelvesBloc, List<ShelvesVO>?>(
        selector: (context, bloc) => bloc.mShelvesList,
        builder: (context, shelvesVOList, child) => Stack(
          children: [
            ///EmptyView
            Visibility(
              visible: (shelvesVOList?.length == 0) ? true : false,
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: EmptyView(),
              ),
            ),

            ///Shelves List
            Visibility(
              visible: (shelvesVOList?.length == 0) ? false : true,
              child: ShelvesListView(
                  shelvesList: shelvesVOList?.reversed.toList(),
                  onTapShelfDetail: (shelfVO) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (buildContext) => CreateShelfPage(
                          isCreateNewShelf: false,
                          mShelvesVO: shelfVO,
                          onTapSaveShelf: (shelfName) {
                            ShelvesBloc bloc =
                            Provider.of<ShelvesBloc>(context, listen: false);
                            bloc.renameShelfVO(ShelvesVO(shelfVO?.shelfId, shelfName, shelfVO?.booksList, false));
                            Navigator.pop(context);
                          },
                          onTapDeleteShelf: (shelfVO, buildContextParam) {
                            ShelvesBloc bloc = Provider.of<ShelvesBloc>(context,
                                listen: false);
                            bloc.onTapDeleteShelfVO(shelfVO!);
                            Navigator.pop(buildContextParam);
                          },
                        ),
                      ),
                    );
                  }),
            ),

            ///Shelf Create Button
            Align(
              alignment: Alignment.bottomCenter,
              child: ShelfCreateNewView(
                onTapSaveShelf: (shelfName) {
                  ShelvesBloc bloc =
                      Provider.of<ShelvesBloc>(context, listen: false);
                  bloc.saveShelfVO(ShelvesVO("", shelfName, [], false));
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ShelvesListView extends StatelessWidget {
  List<ShelvesVO>? shelvesList;
  Function(ShelvesVO?) onTapShelfDetail;

  ShelvesListView(
      {super.key, required this.shelvesList, required this.onTapShelfDetail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        //key: Key('shelfListView'),
        scrollDirection: Axis.vertical,
        itemCount: shelvesList?.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              onTapShelfDetail(shelvesList?.elementAt(index));
            },
            child: ShelvesListEachItemView(shelvesVO: shelvesList?.elementAt(index)),
          );
        },
      ),
    );
  }
}

class ShelvesListEachItemView extends StatelessWidget {

  final ShelvesVO? shelvesVO;
  const ShelvesListEachItemView({
    super.key,
    required this.shelvesVO,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              //  mainAxisAlignment: MainAxisAlignment.start,
              //  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///shelf image list section
                //Container(
                //                                     height: 80,
                //                                     width: 70,
                //                                     margin: const EdgeInsets.only(
                //                                         top: MARGIN_MEDIUM,
                //                                         bottom: MARGIN_MEDIUM),
                //                                     decoration: BoxDecoration(
                //                                         color: Colors.black45,
                //                                         borderRadius: const BorderRadius.all(
                //                                             Radius.circular(5)),
                //                                         image: DecorationImage(
                //                                           fit: BoxFit.cover,
                //                                           image: NetworkImage(shelvesList
                //                                                   ?.elementAt(index)
                //                                                   .booksList?.reversed.toList()[0]
                //                                                   .bookImage ??
                //                                               ""),
                //                                         )),
                //                                   )
                (shelvesVO?.booksList == null ||
                    shelvesVO?.booksList
                                ?.length ==
                            0)
                    ? Container(
                        height: 80,
                        width: 70,
                        margin: const EdgeInsets.only(
                            top: MARGIN_MEDIUM, bottom: MARGIN_MEDIUM),
                        decoration: const BoxDecoration(
                            color: Colors.black45,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "assets/images/empty_book.png"),
                            )),
                      )
                    : ((shelvesVO?.booksList
                                    ?.reversed
                                    .toList()[0]
                                    .bookImage ??
                                "") !=
                            "")
                        ? Container(
                  height: 80,
                  width: 70,
                          child: Stack(
                            children: [
                              ListView.builder(
                                itemCount: shelvesVO?.booksList
                                    ?.reversed
                                    .toList()
                                    .length,
                                itemBuilder:
                                    (BuildContext context, int listIndex) {
                                  var item = shelvesVO?.booksList
                                      ?.reversed
                                      .toList()[listIndex];
                                  return Container(
                                    height: 80,
                                    width: 70,
                                    margin: const EdgeInsets.only(
                                    top: MARGIN_MEDIUM,
                                    bottom: MARGIN_MEDIUM),
                                    decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius:
                                        const BorderRadius.all(
                                            Radius.circular(5)),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          item?.bookImage ??
                                              ""),
                                    )),
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                        : Container(
                            height: 80,
                            width: 70,
                            margin: const EdgeInsets.only(
                                top: MARGIN_MEDIUM,
                                bottom: MARGIN_MEDIUM),
                            decoration: const BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/empty_book.png"),
                                )),
                          ),

                ///shelf Name section and book count section
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
                      child: Text(
                        shelvesVO?.shelfName ?? "",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: TEXT_REGULAR_3X,
                            fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: MARGIN_MEDIUM_2,
                          right: MARGIN_MEDIUM_2),
                      child: Text(
                        (shelvesVO?.booksList
                                    ?.length ==
                                0)
                            ? "0 book"
                            : (shelvesVO?.booksList
                                        ?.length ==
                                    1)
                                ? "${shelvesVO?.booksList?.length} book"
                                : "${shelvesVO?.booksList?.length} books",
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

            ///go to shelf detail section
            Container(
              width: 32,
              height: 32,
              // decoration: const BoxDecoration(
              //   color: Colors.black45,
              //   borderRadius: BorderRadius.all(Radius.circular(8)),
              // ),
              child: const Padding(
                  padding: EdgeInsets.only(
                      top: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.grey,
                  )),
            )
          ],
        ),
        Container(
          color: Colors.black12,
          height: 1,
        ),
      ],
    );
  }
}

class ShelfCreateNewView extends StatelessWidget {
  Function(String?) onTapSaveShelf;

  ShelfCreateNewView({super.key, required this.onTapSaveShelf});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateShelfPage(
              isCreateNewShelf: true,
              mShelvesVO: null,
              onTapSaveShelf: (shelfName) {
                onTapSaveShelf(shelfName);
              },
              onTapDeleteShelf: (shelfVO, context) {},
            ),
          ),
        );
      },
      child: Container(
        key: Key('createNewShelf'),
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
            Icon(
              Icons.edit,
              color: Colors.white,
            ),
            SizedBox(
              width: MARGIN_MEDIUM,
            ),
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
            child: Image(
              image: AssetImage("assets/images/empty_shelf_icon.png"),
            )),
        Text(
          "No shelves",
          style: const TextStyle(
              fontSize: TEXT_REGULAR_3X, fontWeight: FontWeight.w600),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          "Create shelves to match the way \n you think.",
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.grey,
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w400),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
