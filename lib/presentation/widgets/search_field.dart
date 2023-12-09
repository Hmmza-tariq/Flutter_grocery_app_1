import 'package:abc/presentation/resources/form_field_styles.dart';
import 'package:abc/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        // To prevent open the keyboard
        readOnly: true,
        showCursor: true,
        maxLines: 1,
        style: kSearchFieldTextStyle,
        onTap: () {
          // showProductSearchDelegate<Product>(
          //     context: context,
          //     delegate: ProductSearchDelegate(
          //         productBloc: BlocProvider.of<SearchBloc>(context)));
        },
        decoration: searchFieldInputDecoration);
  }
}
