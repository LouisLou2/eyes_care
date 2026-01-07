
import 'dart:async';

import 'package:eyescare/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

class AILoadingScreen extends StatefulWidget {
  final VoidCallback? onLoadingComplete;

  const AILoadingScreen({super.key, required this.onLoadingComplete});

  @override
  State<AILoadingScreen> createState() => _AILoadingScreenState();
}

class _AILoadingScreenState extends State<AILoadingScreen> with SingleTickerProviderStateMixin {
  final List<String> _processingSteps = [
    "初步分析图像...",
    "正在处理关键区域...",
    "整理分析结果...",
    "优化呈现效果...",
  ];

  int _currentStepIndex = 0;
  bool _isVisible = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Create fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    // Start the animation sequence
    _startAnimationSequence();
  }

  void _startAnimationSequence() {
    // Show the first step
    _showCurrentStep();
  }

  void _showCurrentStep() {
    setState(() {
      _isVisible = true;
    });

    // Fade in
    _animationController.forward().then((_) {
      // Wait for some time before fading out
      Timer(const Duration(milliseconds: 1000), () {
        // Fade out
        _animationController.reverse().then((_) {
          // Move to next step
          setState(() {
            if (_currentStepIndex < _processingSteps.length - 1) {
              _currentStepIndex++;
              _showCurrentStep();
            }else {
              widget.onLoadingComplete?.call();
            }
          });
        });
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: AnimatedMeshGradient(
          colors: [
            Colors.black,
            Colors.deepOrange.shade500,
            Colors.black,
            Colors.deepOrange,
          ],
          options: AnimatedMeshGradientOptions(),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(color: Colors.white,),
                ),
                const SizedBox(width: 20),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Text(
                    _processingSteps[_currentStepIndex],
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: AppStyle.fontFamily2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}