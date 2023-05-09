import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/widgets/search_widget_view.dart';

class SearchBoxView extends StatefulWidget {

  final Function(String) onSearch;

  SearchBoxView({Key? key, required this.onSearch}) : super(key: key);

  @override
  State<SearchBoxView> createState() => _SearchBoxViewState(this.onSearch);
}

class _SearchBoxViewState extends State<SearchBoxView> {
  final Function(String) onSearch;
  _SearchBoxViewState(this.onSearch);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       // const Icon(Icons.search_rounded,color: Colors.black87,),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SearchWidgetView(onSearch: onSearch,),
          ),)
      ],
    );
  }
}