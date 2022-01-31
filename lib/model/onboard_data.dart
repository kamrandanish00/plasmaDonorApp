class OnBoarding {
  final String title;
  final String image;

  OnBoarding({
    required this.title,
    required this.image,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: 'Wash Your Hands',
    image: 'assets/lottie/wash_hands.json',
  ),
  OnBoarding(
    title: 'Wear Masks',
    image: 'assets/lottie/wear_mask.json',
  ),
  OnBoarding(
      title: 'Sanitize Your Hands', image: 'assets/lottie/sanitizer.json'),
  OnBoarding(
      title: 'Keey siz feet distance from each other.',
      image: 'assets/lottie/keep_distance.json')
];
