/// Experiment 1(b): Dart Language Basics
/// Demonstrates foundational syntax, types, OOP, collections, and async in Dart.

// 1. Mixin for logging capabilities
mixin LoggerMixin {
  void log(String message) {
    print('[LOG - ${DateTime.now().toIso8601String().substring(11, 19)}] $message');
  }
}

// 2. Abstract Base Class
abstract class Person {
  final String name;
  final int age;

  Person({required this.name, required this.age});

  void displayProfile();
}

// 3. Derived Class demonstrating Inheritance and Mixin
class Student extends Person with LoggerMixin {
  final String studentId;
  final String major;
  double _gpa; // Private field

  Student({
    required super.name,
    required super.age,
    required this.studentId,
    required this.major,
    double initialGpa = 3.8,
  }) : _gpa = initialGpa;

  // Getter and Setter with validation
  double get gpa => _gpa;
  set gpa(double value) {
    if (value >= 0.0 && value <= 4.0) {
      _gpa = value;
      log('GPA updated to $_gpa for $name');
    } else {
      log('Invalid GPA value: $value. Must be between 0.0 and 4.0.');
    }
  }

  @override
  void displayProfile() {
    print('-----------------------------------------');
    print('Student Profile:');
    print('  Name       : $name');
    print('  Age        : $age');
    print('  ID         : $studentId');
    print('  Major      : $major');
    print('  GPA        : $_gpa / 4.0');
    print('-----------------------------------------');
  }
}

// 4. Standalone functions demonstrating parameters and arrow syntax
double calculateAverage(List<double> scores) {
  if (scores.isEmpty) return 0.0;
  final sum = scores.reduce((a, b) => a + b);
  return sum / scores.length;
}

String formatGreeting({required String user, String title = 'Developer'}) =>
    'Welcome, $title $user to Dart & Flutter programming!';

// 5. Asynchronous computation demonstration
Future<String> fetchMockUserData(String id) async {
  await Future.delayed(const Duration(milliseconds: 300));
  return '{"id": "$id", "status": "Active", "verified": true}';
}

void main() async {
  print('==============================================');
  print('    EXPERIMENT 1(b): DART LANGUAGE BASICS    ');
  print('==============================================');

  // Core Data Types
  final int labNumber = 1;
  const String courseName = 'Mobile Application Development';
  final bool isEnrolled = true;
  final double progress = 95.5;

  print('Course: $courseName | Lab: $labNumber');
  print('Enrolled: $isEnrolled | Progress: $progress%\n');

  // Collections: List, Map, Set
  final List<String> subjects = ['Dart', 'Flutter', 'State Management', 'APIs'];
  final Set<String> uniqueTags = {'mobile', 'cross-platform', 'dart', 'mobile'};
  final Map<String, dynamic> metadata = {
    'platform': 'Web & Mobile',
    'framework': 'Flutter 3.24',
    'version': 1.0,
  };

  print('Subjects (${subjects.length}): ${subjects.join(', ')}');
  print('Unique Tags: ${uniqueTags.toList()}');
  print('Framework Info: ${metadata['framework']} on ${metadata['platform']}\n');

  // Control Flow: Loop and Condition
  print('Subjects Iteration:');
  for (int i = 0; i < subjects.length; i++) {
    print('  [$i] ${subjects[i]}');
  }

  // Object-Oriented Programming (OOP)
  final student = Student(
    name: 'Rupali Singh',
    age: 21,
    studentId: 'CS2026-089',
    major: 'Computer Science',
    initialGpa: 3.92,
  );

  student.displayProfile();
  student.gpa = 3.98; // Trigger setter validation & mixin log

  // Function calls
  final scores = [92.0, 88.5, 96.0, 94.0];
  final avg = calculateAverage(scores);
  print('\nAverage Score across ${scores.length} modules: ${avg.toStringAsFixed(2)}');
  print(formatGreeting(user: student.name));

  // Asynchronous await
  print('\nFetching async network data...');
  final userData = await fetchMockUserData(student.studentId);
  print('Received User Data: $userData');
  print('==============================================\n');
}
