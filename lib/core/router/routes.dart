enum Routes {
  splash(path: '/'),
  home(path: '/home'),
  login(path: '/login'),
  signUp(path: '/signup'),
  profile(path: '/profile');

  //declaration
  final String path;
  const Routes({required this.path});
  String get childPath => path.toString().replaceFirst('/', '');
}
