import 'package:flutter/material.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: onTap ?? () => Navigator.pop(context),
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back_outlined, color: Colors.black),
        ),
      ),
    );
  }
}