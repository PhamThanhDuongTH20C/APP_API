// ignore_for_file: must_be_immutable, sort_constructors_first

import 'package:flutter/material.dart';

class Icontim extends StatefulWidget {
  const Icontim();

  @override
  State<Icontim> createState() => _IcontimState();
}

class _IcontimState extends State<Icontim>
    with AutomaticKeepAliveClientMixin<Icontim> {
  bool ischeck = false;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return IconButton(
      color: ischeck ? Colors.red : Colors.black,
      icon: const Icon(Icons.favorite),
      onPressed: () {
        setState(() {
          ischeck = !ischeck;
        });
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
