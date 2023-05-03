import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/blocs/home_bloc.dart';
import 'package:flutter_the_library_app/resources/colors.dart';
import 'package:flutter_the_library_app/widgets/my_tab_bar_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeBloc(),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // Container(
                // height: MediaQuery.of(context).size.height*0.8,
                //   child: Stack(
                //     children: <Widget>[
                //       Positioned(
                //         left: 0.0,
                //         top: 0.0,
                //         right: 0,
                //         child: Container(
                //           width: MediaQuery.of(context).size.width,
                //           height: 250,
                //           decoration: const BoxDecoration(
                //               gradient: LinearGradient(
                //                   begin: Alignment.centerLeft,
                //                   end: Alignment.centerRight,
                //                   colors: [
                //                     Color.fromRGBO(25, 91, 183, 1),
                //                     Color.fromRGBO(18, 17, 151, 1)
                //                   ])),
                //           // color: BACKGROUND_COLOR,
                //         ),
                //       ),
                //       Positioned(
                //         left: 0.0,
                //         top: 250.0,
                //         right: 0,
                //         child: Container(
                //           width: MediaQuery.of(context).size.width,
                //           height: MediaQuery.of(context).size.height,
                //           color: Color.fromRGBO(223, 235, 249, 1),
                //           child: MyTabBarView(),
                //           // color: BACKGROUND_COLOR,
                //         ),
                //       ),
                //
                //     ],
                //   ),),
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height*0.3,
                  height: MediaQuery.of(context).size.height * 0.3,
                  // decoration: const BoxDecoration(
                  //     gradient: LinearGradient(
                  //         begin: Alignment.centerLeft,
                  //         end: Alignment.centerRight,
                  //         colors: [
                  //           Color.fromRGBO(25, 91, 183, 1),
                  //           Color.fromRGBO(18, 17, 151, 1)
                  //         ])),
                  child: CarouselSlider(
                    items: items.map((item) {
                      return Container(width: 200, child: ReadBookItemView());
                    }).toList(),
                    options: CarouselOptions(
                      // aspectRatio: 16/8,
                      viewportFraction: 0.5,
                      enlargeFactor: 0.25,
                      enableInfiniteScroll: false,
                      // enable circular loop
                      height: 200,
                      enlargeCenterPage: true,
                      autoPlay: false,
                      onPageChanged: (index, reason) {
                        // Do something when the page changes.
                      },
                    ),
                  ),
                  // color: BACKGROUND_COLOR,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  color: Color.fromRGBO(223, 235, 249, 1),
                  child: MyTabBarView(),
                  // color: BACKGROUND_COLOR,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ReadBookItemView extends StatelessWidget {
  const ReadBookItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0.0,
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            margin: const EdgeInsets.only(top: 3.0, bottom: 3.0),
            decoration: const BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/sample_book_img.jpg"),
                )),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 32,
              height: 32,
              child: Image(
                image: AssetImage('assets/images/contextualMenu.png'),
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
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage('assets/images/earphone.png'),
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
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: const Image(
                image: AssetImage('assets/images/read_book.png'),
              ),
            ),
          ),
        )
      ],
    );
  }
}
