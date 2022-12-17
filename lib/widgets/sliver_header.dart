import 'package:flutter/material.dart';

class SliverHeader extends StatelessWidget {
  final Color backgroundColor;
  final String _title;

  const SliverHeader(this.backgroundColor, this._title, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: Delegate(backgroundColor, _title),
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  final Color backgroundColor;
  final String _title;

  Delegate(this.backgroundColor, this._title);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
          style: BorderStyle.solid),
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30)
        ),
      ),
      child: Center(
        child: Text(
          _title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
