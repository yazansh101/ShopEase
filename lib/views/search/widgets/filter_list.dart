import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_models/search_view_model.dart';

class FilterList extends StatelessWidget {
  const FilterList({
    super.key,
    required this.isVisible,
    required this.filterList,
  });

  final bool isVisible;
  final List<FilterItemModel> filterList;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: isVisible ? 1.0 : 0.0,
      child: Wrap(
        children: List.generate(filterList.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: GetBuilder<SearchViewModel>(
              builder: (controller) => 
              FilterChip(
                showCheckmark: false,
                elevation:filterList[index].isSelected ? 3 : 0 ,
                label: Text(
                  filterList[index].title,
                  style: TextStyle(color: filterList[index].isSelected ? Colors.white : null),
                ),
                selected: filterList[index].isSelected,
                backgroundColor: Colors.grey.shade100,
                selectedColor: Colors.blueGrey.shade300,
               // checkmarkColor: Colors.white,
                onSelected: (value) {
                  controller.setNewFilter(index);

                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
