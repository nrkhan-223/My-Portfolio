class Project {
  final String title;
  final String description;
  final String url;

  const Project({
    required this.title,
    required this.description,
    required this.url,
  });
}

const List<Project> projects = [
  Project(
    title: 'Restora Job',
    description: 'A mobile app built with Java for posting and applying for jobs.',
    url: 'https://play.google.com/store/apps/details?id=com.restora.jobs.bd&hl=en',
  ),
  Project(
    title: 'Gari Lagbee',
    description: 'A Flutter application for ride-sharing services with separate customer and driver interfaces.',
    url: 'https://play.google.com/store/apps/details?id=com.quicktechit.garilagbee.app&hl=en',
  ),
  Project(
    title: 'Bibaaha.com',
    description: 'A matrimony Flutter app with features like live chat, video calls, and audio calls.',
    url: 'https://play.google.com/store/apps/details?id=com.zegocloud.uikit.flutter.call_with_invitation&hl=en',
  ),
  Project(
    title: 'Professors English Academy',
    description: 'A learning platform for students to participate in quizzes and purchase courses.',
    url: 'https://play.google.com/store/apps/details?id=com.quicktechIt.professors_english_academy&hl=en',
  ),
  Project(
    title: 'Tourtur',
    description: 'a renting/booking platform whaer user can book rooms or hotel for tour and other travel related services and also host can provide service to the user.',
    url: 'https://play.google.com/store/apps/details?id=com.quicktechIT.tour_tur&hl=en',
  ),
  Project(
    title: 'Dr. Iftekhar',
    description: 'a online doctor booking platform whaer user can book private appointment with doctors submit prescription and more',
    url: 'https://play.google.com/store/apps/details?id=com.quicktech.driftekhar&hl=en',
  ),
];