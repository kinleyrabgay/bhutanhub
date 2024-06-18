import 'package:bhutan_hub/core/models/nav_item.model.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

const Color bottomNavigator = Color(0xFF17203A);

class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key});

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  List<SMIBool> riveIconInputs = [];
  List<StateMachineController?> controllers = [];
  int selectedNavIndex = 0;
  List<Widget> pages = [
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  void _animateTheIcon(int index) {
    riveIconInputs[index].change(true);
    Future.delayed(const Duration(seconds: 1), () {
      riveIconInputs[index].change(false);
    });
  }

  void _onInit(Artboard artboard, {required String stateMachineNmae}) {
    StateMachineController? controller = StateMachineController.fromArtboard(
      artboard,
      stateMachineNmae,
    );
    artboard.addController(controller!);
    controllers.add(controller);
    riveIconInputs.add(controller.findInput<bool>('active') as SMIBool);
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: pages[selectedNavIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
          // color: bottomNavigator.withOpacity(0.8),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: bottomNavigator.withOpacity(0.3),
              offset: const Offset(0, 20),
              blurRadius: 20,
            )
          ],
          border: const Border(
            top: BorderSide(
              color: Colors.grey,
              width: 1.0, // Adjust the width as needed
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomNavItem.length, (index) {
            final riveIcon = bottomNavItem[index].rive;
            return GestureDetector(
              onTap: () {
                _animateTheIcon(index);
                setState(() {
                  selectedNavIndex = index;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Opacity(
                      opacity: selectedNavIndex == index ? 1 : 0.5,
                      child: RiveAnimation.asset(
                        riveIcon.src,
                        artboard: riveIcon.artboard,
                        onInit: (artboard) => _onInit(
                          artboard,
                          stateMachineNmae: riveIcon.stateMachineName,
                        ),
                      ),
                    ),
                  ),
                  AnimatedBar(
                    isActive: selectedNavIndex == index,
                    color: bottomNavItem[index].color,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.isActive,
    required this.color,
  });

  final bool isActive;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 4,
      width: isActive ? 20 : 0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
    );
  }
}
