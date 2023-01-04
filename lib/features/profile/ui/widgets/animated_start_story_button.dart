import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/common.dart';

class AnimatedStartStoryButton extends StatefulWidget {
  const AnimatedStartStoryButton({super.key});

  @override
  _AnimatedStartStoryButtonState createState() =>
      _AnimatedStartStoryButtonState();
}

class _AnimatedStartStoryButtonState extends State<AnimatedStartStoryButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _colorAnimation = ColorTween(
      begin: Colors.green.shade300,
      end: Colors.green.shade900,
    ).animate(_animationController)
      ..addListener(
        () => setState(() {}),
      );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 500),
      child: ElevatedButton(
        onPressed: () {
          context.read<BottomNavCubit>().changeBottomNavIndex(2);
        },
        child: Text(
          'Start your first story',
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(_colorAnimation.value),
          side: MaterialStateProperty.all(BorderSide.none),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
