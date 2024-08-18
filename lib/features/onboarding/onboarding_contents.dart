class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Anywhere you are",
    image: "assets/icons/splash1.svg",
    desc:
        "Sell houses easily with the help of Listenoryx and to make this line big I am writing more.",
  ),
  OnboardingContents(
    title: "At anytime",
    image: "assets/icons/splash2.svg",
    desc:
        "Sell houses easily with the help of Listenoryx and to make this line big I am writing more.",
  ),
  OnboardingContents(
    title: "Book your car",
    image: "assets/icons/splash3.svg",
    desc:
        "Sell houses easily with the help of Listenoryx and to make this line big I am writing more.",
  ),
];
