// test/auth_repository_test.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipes_app/data/auth_repository.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

void main() {
  late FirebaseAuth mockFirebaseAuth;
  late AuthRepository authRepository;
  late MockUserCredential userCredential;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    userCredential = MockUserCredential();
    authRepository = AuthRepository(mockFirebaseAuth);
  });

  group('AuthRepository', () {
    const email = 'test@example.com';
    const password = 'password123';

    test('signUp', () async {
      when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
              email: any(named: 'email'), password: any(named: 'password')))
          .thenAnswer((_) async => userCredential);

      expect(await authRepository.signUpWithEmailAndPassword(email, password),
          isA<UserCredential>());
      verify(() => mockFirebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password)).called(1);
    });

    test('logIn', () async {
      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
              email: any(named: 'email'), password: any(named: 'password')))
          .thenAnswer((_) async => userCredential);

      expect(await authRepository.logInWithEmailAndPassword(email, password),
          isA<UserCredential>());
      verify(() => mockFirebaseAuth.signInWithEmailAndPassword(
          email: email, password: password)).called(1);
    });
  });
}
