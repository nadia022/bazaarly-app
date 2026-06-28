import 'package:bazarly_app/core/cache/secure_storage.dart';
import 'package:bazarly_app/core/utils/assets/app_images.dart';
import 'package:bazarly_app/core/utils/router/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  // Slide and fade animations for the main logo (Bazaarly)
  late Animation<Offset> logoSlidingAnimation;
  late Animation<double> logoOpacityAnimation;

  // Slide and fade animations for the tagline image, with a separate timing offset
  late Animation<Offset> sentenceSlidingAnimation;
  late Animation<double> sentenceOpacityAnimation;

  @override
  void initState() {
    super.initState();
    // Set up all animations before the first frame is drawn
    initAnimation();
    // Start the navigation timer in parallel with the animation
    navigateToHome();
  }

  @override
  void dispose() {
    // Always dispose the controller to free resources
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            return Column(
              children: [
                // 1. Main logo animation — slides up and fades in immediately
                FadeTransition(
                  opacity: logoOpacityAnimation,
                  child: SlideTransition(
                    position: logoSlidingAnimation,
                    child: Image.asset(
                      AppImages.imagesBazaarlyLogoPNG,
                      // 60% of screen width for a balanced responsive size
                      width: MediaQuery.of(context).size.width * 0.6,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // 2. Tagline animation — starts after the logo is visible
                //    to create a layered, smooth entrance effect
                FadeTransition(
                  opacity: sentenceOpacityAnimation,
                  child: SlideTransition(
                    position: sentenceSlidingAnimation,
                    child: Image.asset(
                      AppImages.imagesBazaarlySentencePNG,
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  void initAnimation() {
    // Total animation duration covers both the logo and tagline sequences
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );

    // ── Logo animations (start immediately at 0%) ───────────────

    // Slides the logo up from a slightly lower position
    logoSlidingAnimation =
        Tween<Offset>(begin: const Offset(0, 0.4), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animationController,
            // Runs from 0% to 60% of total duration with a springy overshoot
            curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
          ),
        );

    // Fades the logo in during the first 40% of the animation
    logoOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
      ),
    );

    // ── Tagline animations (start at 40%, after the logo appears) ──

    // Slides the tagline up from a deeper starting position for a richer feel
    sentenceSlidingAnimation =
        Tween<Offset>(begin: const Offset(0, 0.6), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animationController,
            // Runs from 40% to 100% — begins only after the logo is mostly visible
            curve: const Interval(0.4, 1.0, curve: Curves.easeOutCubic),
          ),
        );

    // Fades the tagline in between 40% and 80% of the total duration
    sentenceOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.4, 0.8, curve: Curves.easeIn),
      ),
    );

    // Kick off the full animation sequence
    animationController.forward();
  }

  void navigateToHome() async {
    // Wait long enough for the user to enjoy the full animation
    await Future.delayed(const Duration(seconds: 3));

    // Guard against navigation on a widget that is no longer in the tree
    if (!mounted) return;

    // Read the saved auth token from secure storage
    final token = await SecureStorageService.instance.getAccessToken();

    // Check mount again after the async gap
    if (!mounted) return;

    if (token != null && token.isNotEmpty) {
      // Token exists → user is already logged in, skip the login screen
      context.go(RoutesName.mainLayout);
    } else {
      // No token found → user must log in
      context.go(RoutesName.login);
    }
  }
}
