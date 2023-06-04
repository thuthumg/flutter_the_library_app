import 'package:flutter/material.dart';
import 'package:flutter_the_library_app/blocs/add_to_shelves_bloc.dart';
import 'package:flutter_the_library_app/data/vos/book_vo.dart';
import 'package:flutter_the_library_app/data/vos/shelves_vo.dart';
import 'package:flutter_the_library_app/resources/colors.dart';
import 'package:flutter_the_library_app/resources/dimens.dart';
import 'package:provider/provider.dart';

class AddToShelvesPage extends StatelessWidget {
  BookVO? bookVO;

  AddToShelvesPage({required this.bookVO});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddToShelvesBloc(),
      child: Selector<AddToShelvesBloc, List<ShelvesVO>?>(
        selector: (context, bloc) => bloc.mShelvesList,
        builder: (context, shelvesVOList, child) =>
            Selector<AddToShelvesBloc, String?>(
              selector: (context, bloc) => bloc.checkedDataId,
              builder: (context, checkedDataId, child)=>
              Selector<AddToShelvesBloc, bool>(
                selector: (context, bloc) => bloc.isChecked,
                builder: (context, isChecked, child)=>
              Scaffold(
          backgroundColor: PRIMARY_COLOR,
          appBar: AppBar(
              backgroundColor: PRIMARY_COLOR,
              centerTitle: true,
              title: Text("Add to Shelves",
                  style: TextStyle(
                      fontSize: TEXT_REGULAR_3X,
                      color: Colors.black,
                      fontWeight: FontWeight.w600)),
              actions: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      key:Key('closeIcon'),
                      Icons.close,
                      color: Colors.black,
                    ))
              ],
          ),
          body: ListView.builder(
                key: Key('shelvesCheckBoxListView'),
              itemCount: shelvesVOList?.length,
              // Replace with the actual length of your list
              itemBuilder: (BuildContext context, int index) {
                return
                    // Selector<AddToShelvesBloc, bool>(
                    //   selector: (context, bloc) => bloc.isChecked,
                    //   builder: (context, isChecked, child) =>
                    ShelfCheckBoxListItemView(bookVO: bookVO,
                        shelvesVO:shelvesVOList?[index],
                        checkedDataId:checkedDataId,
                        isChecked:isChecked);
                // );
              },
          ),
        ),
         ),
            ),
      ),
    );
  }
}

class ShelfCheckBoxListItemView extends StatelessWidget {
  const ShelfCheckBoxListItemView({
    super.key,
    required this.bookVO,
    required this.shelvesVO,
    required this.checkedDataId,
    required this.isChecked
  });

  final BookVO? bookVO;
  final ShelvesVO? shelvesVO;
  final String? checkedDataId;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      key: Key('chk-${shelvesVO?.shelfId}'),
                  tristate: true,
                  title: Text('${shelvesVO?.shelfName}'),
                  value: ((checkedDataId == shelvesVO?.shelfId) &&
      isChecked)? true : false,
                  //isCheckedList[index],
                  onChanged: (bool? value) {
    // setState(() {
    // isCheckedList[index] = value!;
    // shelvesVOList?[index].isSelected = value ?? false;
    // if(shelvesVOList?[index].isSelected == true)
    //   {
    //
    //   }
    AddToShelvesBloc bloc =
        Provider.of<AddToShelvesBloc>(context, listen: false);
    bloc.onTapCheckBox(
        shelvesVO?.shelfId ?? "0", bookVO,value??false);
    //  });
                  },
                );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: MyCheckboxListView(),
//   ));
// }
