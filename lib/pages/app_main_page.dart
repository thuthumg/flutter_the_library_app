import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/pages/home_page.dart';
import 'package:flutter_the_library_app/pages/library_page.dart';
import 'package:flutter_the_library_app/pages/search_page.dart';
import 'package:flutter_the_library_app/resources/colors.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:flutter_the_library_app/resources/strings.dart';

class AppMainPage extends StatefulWidget {
  const AppMainPage({super.key});

  @override
  State<AppMainPage> createState() => _AppMainPageState();
}

class _AppMainPageState extends State<AppMainPage> {
  int _currentIndex = 0;

  final List<Widget> _children = [HomePage(), LibraryPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         // centerTitle: true,
        elevation: 0,
          backgroundColor: PRIMARY_COLOR,
          title: Padding(
            padding: const EdgeInsets.only(
                top: MARGIN_MEDIUM_3,
                bottom: MARGIN_MEDIUM_3,
                left: 0,
                right: 0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height:45,
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(MARGIN_MEDIUM)),
                  color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes the shadow direction
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: MARGIN_MEDIUM_2),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SearchSectionView(),
                      Container(
                        margin: const EdgeInsets.only(top: 3.0,bottom: 3.0),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue,
                            // set the border stroke color here
                            width: 2.0,
                            // set the width of the border stroke here
                          ),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/pic_profile.jpg"),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          )),
      backgroundColor: PRIMARY_COLOR,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Library',
          ),
        ],
      ),
      body: _children[_currentIndex],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class SearchSectionView extends StatelessWidget {
  const SearchSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchPage(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
        child: Row(
          children: const [
            Icon(Icons.search,color: Colors.grey,),
            SizedBox(
              width: 10,
            ),
            Text(

             SEARCH_TXT,
              style: TextStyle(
                  color: Color.fromRGBO(85, 85, 85, 1),
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
