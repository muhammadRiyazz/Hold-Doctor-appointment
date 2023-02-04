import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

ValueNotifier<int> IndexValueNotifier = ValueNotifier(0);

class BottomNavigatonBar extends StatelessWidget {
  BottomNavigatonBar({
    super.key,
  });
  // final int index;
  @override
  Widget build(BuildContext context) {
    IndexValueNotifier.value = 0;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 12, right: 12),
      child: ValueListenableBuilder(
        valueListenable: IndexValueNotifier,
        builder: (context, newindex, child) {
          return CustomNavigationBar(
              currentIndex: newindex,
              onTap: (index) {
                IndexValueNotifier.value = index;
              },
              borderRadius: const Radius.circular(20.0),
              iconSize: 25,
              selectedColor: const Color.fromARGB(255, 46, 44, 53),
              strokeColor: const Color(0x30040307),
              unSelectedColor: const Color(0xffacacac),
              backgroundColor: Colors.white,
              items: [
                CustomNavigationBarItem(
                  icon: const Icon(Icons.home),
                ),
                CustomNavigationBarItem(
                  icon: const Icon(Icons.menu_book_rounded),
                ),
                CustomNavigationBarItem(
                  icon: const Icon(Icons.account_circle),
                ),
              ]);
        },
      ),
    );
  }
}
