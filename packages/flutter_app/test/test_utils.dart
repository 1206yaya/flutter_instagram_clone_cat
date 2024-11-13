class TestUser {
  final String email;
  final String password;

  const TestUser({
    required this.email,
    required this.password,
  });
}

final user = TestUser(
  email: 'test1@test.com',
  password: 'password',
);
