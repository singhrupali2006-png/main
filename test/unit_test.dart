import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_lab_experiments/experiments/exp1_dart_basics/dart_basics.dart';
import 'package:flutter_lab_experiments/experiments/exp9_api/exp9a_api_service.dart';

void main() {
  group('Exp 10(a) - Unit Tests for Business Logic & Models', () {
    test('calculateAverage accurately computes mean of numbers', () {
      final scores = [10.0, 20.0, 30.0, 40.0];
      final avg = calculateAverage(scores);
      expect(avg, equals(25.0));
    });

    test('calculateAverage handles empty list gracefully', () {
      expect(calculateAverage([]), equals(0.0));
    });

    test('Student GPA setter adheres to boundary limits (0.0 to 4.0)', () {
      final student = Student(
        name: 'Rupali',
        age: 21,
        studentId: 'TEST-01',
        major: 'CS',
        initialGpa: 3.5,
      );

      // Valid update
      student.gpa = 3.9;
      expect(student.gpa, equals(3.9));

      // Out of bounds update (should remain unchanged)
      student.gpa = 5.2;
      expect(student.gpa, equals(3.9));

      student.gpa = -1.0;
      expect(student.gpa, equals(3.9));
    });

    test('Post.fromJson deserializes JSON map accurately', () {
      final jsonMap = {
        'id': 42,
        'userId': 99,
        'title': 'Test Post Title',
        'body': 'Test Post Body Content',
      };

      final post = Post.fromJson(jsonMap);
      expect(post.id, equals(42));
      expect(post.userId, equals(99));
      expect(post.title, equals('Test Post Title'));
      expect(post.body, equals('Test Post Body Content'));
    });

    test('Email regex validation rule functions accurately', () {
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

      expect(emailRegex.hasMatch('valid.user@example.com'), isTrue);
      expect(emailRegex.hasMatch('rupali123@domain.org'), isTrue);
      expect(emailRegex.hasMatch('invalid-email-format'), isFalse);
      expect(emailRegex.hasMatch('@missingusername.com'), isFalse);
      expect(emailRegex.hasMatch('missingdomain@'), isFalse);
    });
  });
}
