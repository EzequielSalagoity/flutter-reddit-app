import 'package:flutter/material.dart';
import 'package:flutter_reddit_app/core/constants/ui_values.dart';

class CustomNavBar extends StatefulWidget {
  final int selectedIndex;
  final EdgeInsets? padding;
  final double? borderRadius; // Tiene que ser igual que el padding
  final void Function(int) onTap;
  final List<CustomBottomNavigationBarItem> items;

  const CustomNavBar({
    Key? key,
    this.selectedIndex = 0,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    this.borderRadius = 8,
    required this.items,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
        color: color_2,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.borderRadius!),
            topRight: Radius.circular(widget.borderRadius!)),
        boxShadow: [
          BoxShadow(
              color: color_6.withOpacity(0.15),
              blurRadius: 20,
              spreadRadius: 12,
              offset: const Offset(0, -2))
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widget.items.map((item) {
            var index = widget.items.indexOf(item);
            return GestureDetector(
              onTap: () {
                widget.onTap.call(index);
              },
              child: ItemWidget(
                item: item,
                isSelected: index == widget.selectedIndex,
                backgroundColor: color_2,
                selectedBackgroundColor: Theme.of(context).primaryColor,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

}

class ItemWidget extends StatelessWidget {
  final bool isSelected;
  final CustomBottomNavigationBarItem item;
  final Color backgroundColor;
  final Color selectedBackgroundColor;

  const ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.selectedBackgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      width: 80,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              isSelected ? item.activeIcon : item.inactiveIcon,
              const SizedBox(height: 2),
              Text(
                item.text,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: isSelected ? color_9 : color_5
                ),
              )
            ],
          ),
          if (item.hasNotifications && !isSelected)
                Positioned(
                  top: 0,
                  right: 20,  
                  child: Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: Text(
                        "${item.notifications}",
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: color_background,
                        ),
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}

class CustomBottomNavigationBarItem {
  final String text;
  final Widget activeIcon;
  final Widget inactiveIcon;
  bool hasNotifications;
  int? notifications;

  CustomBottomNavigationBarItem({
    required this.text,
    required this.activeIcon,
    required this.inactiveIcon,
    this.hasNotifications= false,
    this.notifications,
  });
}
