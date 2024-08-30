import 'dart:developer';

import 'package:edipro_prueba/constants/app_icons.dart';
import 'package:edipro_prueba/encomienda/view.dart';
import 'package:edipro_prueba/expenses/view.dart';
import 'package:edipro_prueba/home/view.dart';
import 'package:edipro_prueba/news/view.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_svg/flutter_svg.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  TabEnum _currentTab = TabEnum.home;

  onTap(TabEnum tab) {
    setState(() {
      _currentTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    // instead of use a indexStack, we use a switch case to show the current tab
    getChild() {
      switch (_currentTab) {
        case TabEnum.home:
          return const HomeScreen();
        case TabEnum.payments:
          return const ExpensesView();
        case TabEnum.shipments:
          return const EncomiendaView();
        case TabEnum.news:
          return const NewsView();
      }
    }

    return Scaffold(
        backgroundColor: const Color(0xfffafdfe),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: getChild(),
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color(0xffe7f0f8),
          child: SizedBox(
            height: 70,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _TabButton(
                      groupValue: _currentTab,
                      icon: AppIcons.home,
                      label: 'Inicio',
                      value: TabEnum.home,
                      onTab: onTap,
                    ),
                    _TabButton(
                      groupValue: _currentTab,
                      icon: AppIcons.dollar,
                      label: 'Pagos',
                      value: TabEnum.payments,
                      onTab: onTap,
                    ),
                    _TabButton(
                      hasNotification: true,
                      groupValue: _currentTab,
                      icon: AppIcons.save,
                      label: 'Encomiendas',
                      value: TabEnum.shipments,
                      onTab: onTap,
                    ),
                    _TabButton(
                      groupValue: _currentTab,
                      icon: AppIcons.newspaper,
                      label: 'Noticias',
                      value: TabEnum.news,
                      onTab: onTap,
                    ),
                  ]),
            ),
          ),
        ));
  }
}

class _TabButton extends StatefulWidget {
  const _TabButton({
    required this.icon,
    required this.label,
    required this.value,
    required this.groupValue,
    this.hasNotification = false,
    required this.onTab,
  });

  final String icon;
  final String label;
  final TabEnum groupValue;
  final TabEnum value;
  final bool hasNotification;
  final Function(TabEnum) onTab;

  @override
  State<_TabButton> createState() => _TabButtonState();
}

class _TabButtonState extends State<_TabButton> {
  bool isSelected = false;

  @override
  void didUpdateWidget(covariant _TabButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      isSelected = widget.value == widget.groupValue;
    });
    log('didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        widget.onTab(widget.value);
      },
      child: Stack(
        children: [
          // if (widget.value == widget.groupValue)
          Positioned.fill(
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  constraints: const BoxConstraints(
                    minHeight: 33,
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xffbbe9ff),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 10,
                  width: isSelected ? 100 : 0,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 37),
                  child: Center(
                    child: badges.Badge(
                        position: badges.BadgePosition.topEnd(top: -3, end: -2),
                        badgeContent: null,
                        showBadge: widget.hasNotification,
                        child: SvgPicture.asset(widget.icon)),
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 70),
                  child: Center(
                    child: Text(
                      widget.label,
                      style: const TextStyle(
                        /// FIXME: use theme
                        color: Color(0xff171C1F),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
