import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/blocs/add_to_shelves_bloc.dart';
import 'package:flutter_the_library_app/data/vos/shelves_vo.dart';
import 'package:flutter_the_library_app/resources/colors.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:flutter_the_library_app/resources/strings.dart';
import 'package:provider/provider.dart';

class AddToShelvesPage extends StatelessWidget {

  List<bool> isCheckedList = List.filled(5, false);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddToShelvesBloc(),
      child: Selector<AddToShelvesBloc, List<ShelvesVO>?>(
        selector: (context, bloc) => bloc.mShelvesList,
        builder: (context, shelvesVOList, child) =>
        Scaffold(
          backgroundColor: PRIMARY_COLOR,
          appBar: AppBar(
            backgroundColor: PRIMARY_COLOR,
            centerTitle: true,
            title: Text("Add to Shelves",
                style: TextStyle(
                    fontSize: TEXT_REGULAR_3X,
                    color:Colors.black,
                    fontWeight:FontWeight.w600)
            ),
            actions: [
              Icon(Icons.close,color: Colors.black,)
            ],
          ),
          body: ListView.builder(
            itemCount: shelvesVOList?.length, // Replace with the actual length of your list
            itemBuilder: (BuildContext context, int index) {
              return CheckboxListTile(
                title: Text('${shelvesVOList?[index].shelfName}'),
                value: isCheckedList[index],
                onChanged: (bool? value) {
                 // setState(() {
                    isCheckedList[index] = value!;
                //  });
                },
              );
            },
          ),
        ),
      ),
    );
  }
}


// void main() {
//   runApp(MaterialApp(
//     home: MyCheckboxListView(),
//   ));
// }