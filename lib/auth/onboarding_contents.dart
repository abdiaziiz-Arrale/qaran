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
    title: "Welcome to Qaran Application",
    image: "assets/sl.png",
    desc:
        "A simple, free, fast, secure and reliable way for watch and read news, activites, oppertunity og traing & jobs the government.",
  ),
  OnboardingContents(
    title: "News & Activties About Government",
    image: "assets/images/spr.jpg",
    desc:
        "You can get easly the news, activties about the government as post and videos.",
  ),
  OnboardingContents(
    title: "Oppertunities, Traning & Jobs",
    image: "assets/slflag.png",
    desc: "Also you can get free training course and jos to the government.",
  ),
];
