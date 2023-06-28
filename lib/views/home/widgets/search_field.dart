import 'dart:developer';

import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Function onFieldSubmitted;
  final Function onTab;
  final Function onChanged;
  const SearchField({
    super.key,
    required this.onFieldSubmitted,
    required this.onTab,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(

        onFieldSubmitted: (_) {
          onFieldSubmitted();
        },
        onChanged: (value) {
          onChanged(value);
          log(value);
        },
        onTap: () {
          onTab();
        },
        
        decoration: const InputDecoration(
          
          hintText: 'Search for ..',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            size: 25,
            color: Colors.black26,
          ),
          enabledBorder: InputBorder.none,
          focusedBorder:  InputBorder.none,
        ),
      ),
    );
  }
}
