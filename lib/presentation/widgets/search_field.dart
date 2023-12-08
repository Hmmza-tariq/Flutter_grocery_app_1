import 'package:abc/data/models/product.dart';
import 'package:abc/presentation/bloc/search/search_bloc.dart';
import 'package:abc/presentation/resources/form_field_styles.dart';
import 'package:abc/presentation/resources/styles_manager.dart';
import 'package:abc/presentation/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
