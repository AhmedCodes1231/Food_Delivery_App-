class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingModel> onboardingContents = [
  OnboardingModel(
    image:
        'https://img.freepik.com/free-vector/delivery-service-with-mask-concept_23-2148505116.jpg',
    title: 'All your favorites',
    description:
        'Get all your loved foods in one once place, you just place the order we do the rest',
  ),
  OnboardingModel(
    image:
        'https://img.freepik.com/free-vector/chef-concept-illustration_114360-1463.jpg',
    title: 'Order from chosen chef',
    description:
        'Get all your loved foods in one once place, you just place the order we do the rest',
  ),
  OnboardingModel(
    image:
        'https://img.freepik.com/free-vector/delivery-service-concept_23-2148505113.jpg',
    title: 'Free delivery offers',
    description:
        'Get all your loved foods in one once place, you just place the order we do the rest',
  ),
];
