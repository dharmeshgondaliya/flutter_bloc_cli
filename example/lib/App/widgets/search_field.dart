import 'dart:async';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key, required this.searchController, this.onTextChange});
  final TextEditingController searchController;
  final Function(String text)? onTextChange;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  double height = 40;
  bool showClearIcon = false;
  Timer? _timer;

  @override
  void initState() {
    showClearIcon = widget.searchController.text.trim().isNotEmpty;
    super.initState();
  }

  void onTextChange(String text) {
    if (text.isEmpty && showClearIcon) {
      showClearIcon = false;
      setState(() {});
    } else if (text.isNotEmpty && !showClearIcon) {
      showClearIcon = true;
      setState(() {});
    }
    _timer?.cancel();
    _timer = Timer(const Duration(milliseconds: 300), () => widget.onTextChange?.call(text));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.maxFinite,
      child: TextField(
        controller: widget.searchController,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade300,
          suffixIconConstraints: BoxConstraints(maxWidth: height, minWidth: height, maxHeight: height, minHeight: height),
          constraints: BoxConstraints(minWidth: double.maxFinite, maxWidth: double.maxFinite, maxHeight: height, minHeight: height),
          contentPadding: const EdgeInsets.only(left: 10, right: 10),
          hintText: "Search...",
          prefixIcon: const Icon(Icons.search_outlined),
          suffixIcon: showClearIcon
              ? InkWell(
                  onTap: () {
                    widget.searchController.clear();
                    onTextChange("");
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Center(
                    child: Container(
                      width: 20,
                      height: 20,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: const Icon(Icons.close_outlined, size: 15),
                    ),
                  ),
                )
              : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
          disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        ),
        onChanged: (value) {
          onTextChange(value.trim());
        },
      ),
    );
  }
}