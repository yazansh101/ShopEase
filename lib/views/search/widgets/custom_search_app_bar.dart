import 'package:flutter/material.dart';

class CustomSearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String hintText;
  final List<String> filterList;
  final Function(String, List<String>) onSearch;
  final Function(List<String>) onFilter;
  final double height;

  const CustomSearchAppBar({
    Key? key,
    required this.hintText,
    required this.filterList,
    required this.onSearch,
    required this.onFilter,
    this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  _CustomSearchAppBarState createState() => _CustomSearchAppBarState();
}

class _CustomSearchAppBarState extends State<CustomSearchAppBar> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _selectedFilters = [];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: widget.hintText,
        ),
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {
          widget.onSearch(value, _selectedFilters);
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            widget.onSearch(_searchController.text, _selectedFilters);
          },
        ),
        IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () {
            _showFilterDialog();
          },
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _selectedFilters.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Chip(
                  label: Text(_selectedFilters[index]),
                  onDeleted: () {
                    setState(() {
                      _selectedFilters.removeAt(index);
                      widget.onFilter(_selectedFilters);
                    });
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Filters'),
          contentPadding: const EdgeInsets.only(top: 12),
          content: SingleChildScrollView(
            child: Column(
              children: widget.filterList
                  .map(
                    (filter) => CheckboxListTile(
                      title: Text(filter),
                      value: _selectedFilters.contains(filter),
                      onChanged: (value) {
                        setState(() {
                          if (value!) {
                            _selectedFilters.add(filter);
                          } else {
                            _selectedFilters.remove(filter);
                          }
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
          actions: [
            MaterialButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            MaterialButton(
              child: const Text('Apply'),
              onPressed: () {
                widget.onFilter(_selectedFilters);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
