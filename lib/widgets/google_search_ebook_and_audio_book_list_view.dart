import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/blocs/search_book_bloc.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:flutter_the_library_app/resources/strings.dart';
import 'package:provider/provider.dart';


class GoogleSearchEbookAndAudioBookListView extends StatefulWidget {

  final String searchQuery;

  GoogleSearchEbookAndAudioBookListView({required this.searchQuery});

  @override
  _GoogleSearchEbookAndAudioBookListViewState createState() => _GoogleSearchEbookAndAudioBookListViewState();
}

class _GoogleSearchEbookAndAudioBookListViewState extends State<GoogleSearchEbookAndAudioBookListView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // set the number of tabs here
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("GoogleSearchEbookAndAudioBookListView query ${widget.searchQuery}");
    return ChangeNotifierProvider(
      create: (context) => SearchBookBloc(widget.searchQuery),
      child: Selector<SearchBookBloc, List<BookVO>?>(
        selector: (context, bloc) => bloc.mBooksList,
        builder: (context, booksList, child) =>
        Column(
            children: [
              TabBar(
                // indicatorColor: Colors.blue, // set the color of the selected tab indicator
                indicatorSize:TabBarIndicatorSize.label,
                labelColor: Colors.blue, // set the color of the selected tab
                unselectedLabelColor: Colors.grey, // set the color of the unselected tabs
                controller: _tabController,
                tabs: [
                  Tab(child: Text(
                    EBOOKS_TXT,
                    style: TextStyle(
                        fontSize: TEXT_REGULAR_2X,
                        fontWeight: FontWeight.w600), // set the tab label size
                  ),), //
                  Tab(child: Text(
                    AUDIOBOOKS_TXT,
                    style: TextStyle(
                        fontSize: TEXT_REGULAR_2X,
                        fontWeight: FontWeight.w600), // set the tab label size
                  ),),

                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: MARGIN_MEDIUM),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      GoogleSearchBookListView(isEbook: true,mBookList:booksList),
                      GoogleSearchBookListView(isEbook: false,mBookList: booksList),

                    ],
                  ),
                ),
              ),
            ],
          ),
      ),
    );

  }
}
class GoogleSearchBookListView extends StatelessWidget {
  final bool isEbook;
  final List<BookVO>? mBookList;

  const GoogleSearchBookListView({
    super.key,
    required this.isEbook,
    required this.mBookList
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
        child: ListView.builder(
          // shrinkWrap: true,
          //  physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: mBookList?.length,
          itemBuilder: (BuildContext context, int index) {

            return GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height:  isEbook? 80 :60,
                        width: isEbook? 55 :60,
                        margin: const EdgeInsets.only(
                            top: MARGIN_MEDIUM, bottom: MARGIN_MEDIUM),
                        decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                               NetworkImage(mBookList?[index].bookImage??""),
                             // AssetImage("assets/images/sample_book_img.jpg"),
                            ),),
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
                            child: Text(
                              mBookList?[index].title??"",
                              style: TextStyle(
                                  fontSize: TEXT_REGULAR_2X,
                                  fontWeight: FontWeight.w600),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
                            child: Text(
                             isEbook? " ${mBookList?[index].author??""} \n Ebook.Sample" : "${mBookList?[index].author??""} \n Audiobook",
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

                ],
              ),
            );
          },
        ),
    );
  }
}