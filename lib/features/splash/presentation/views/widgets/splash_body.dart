import 'package:bazarly_app/core/utils/assets/app_images.dart';
import 'package:bazarly_app/core/utils/router/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  
  // حركات اللوجو الأساسي (Bazaarly)
  late Animation<Offset> logoSlidingAnimation;
  late Animation<double> logoOpacityAnimation;

  // حركات الجملة الفرعية (Bazaarly sentence) بتوقيت منفصل
  late Animation<Offset> sentenceSlidingAnimation;
  late Animation<double> sentenceOpacityAnimation;

 
  @override
  void initState() {
    super.initState();
    initAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
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
                // 1. أنيميشن اللوجو الأساسي
                FadeTransition(
                  opacity: logoOpacityAnimation,
                  child: SlideTransition(
                    position: logoSlidingAnimation,
                    child: Image.asset(
                      AppImages.imagesBazaarlyLogoPNG,
                      width: MediaQuery.of(context).size.width * 0.6, // أبعاد متناسقة responsive
                    ),
                  ),
                ),
                const SizedBox(height: 24), // مسافة منسقة بين اللوجو والجملة
                
                // 2. أنيميشن الجملة الفرعية (يتحرك بتأخير انسيابي)
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
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600), // زيادة المدة الإجمالية لتفصيل الحركات
    );

    // --- إعدادات حركة اللوجو الأساسي (تبدأ فوراً) ---
    logoSlidingAnimation = Tween<Offset>(
      begin: const Offset(0, 0.4), // قادم من الأسفل بشكل واضح
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve:  const Interval(0.0, 0.6, curve: Curves.easeOutBack), // ينتهي عند 60% من الوقت مع ارتداد مميز
      ),
    );

    logoOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeIn),
      ),
    );

    // --- إعدادات حركة الجملة الفرعية (تبدأ متأخرة لجعل الأنميشن غني وملاحظ) ---
    sentenceSlidingAnimation = Tween<Offset>(
      begin: const Offset(0, 0.6), // حركة صعود أعمق وأوضح
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOutCubic), // تبدأ بعد ظهور اللوجو جزئياً
      ),
    );

    sentenceOpacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.4, 0.8, curve: Curves.easeIn),
      ),
    );

    // تشغيل الأنيميشن المتناسق
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3500 ~/ 1000), // زيادة طفيفة لتستمتع العين برؤية الأنميشن كاملاً
      () {
        // كود الانتقال الخاص بك هنا
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeView()));
         context.go(RoutesName.login);
      },
    );
  }
}


// import 'package:bazarly_app/core/utils/assets/app_images.dart';
// import 'package:bazarly_app/core/utils/router/routes_name.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';

// class SplashBody extends StatefulWidget {
//   const SplashBody({super.key});

//   @override
//   State<SplashBody> createState() => _SplashBodyState();
// }

// class _SplashBodyState extends State<SplashBody> {
  
//   @override
//   void initState() {
//     super.initState();
//     navigateToHome();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: double.infinity,
//       child: Image.asset(
//         AppImages.imagesSplashScreenPNG,
//         fit: BoxFit.cover, // تجعل الصورة تغطي الشاشة بالكامل مثل التصميم تماماً
//       ),
//     );
//   }

//   // الانتقال التلقائي بعد 3 ثوانٍ إلى الشاشة الرئيسية
//   void navigateToHome() {
//     Future.delayed(
//       const Duration(seconds: 3),
//       () {
//         if (mounted) {
//           context.go(RoutesName.home);
//         }
//       },
//     );
//   }
// }