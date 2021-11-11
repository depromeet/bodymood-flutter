class BodymoodRouteSetting {
  final String path;
  final bool replace;
  final bool pop;
  final bool reset;

  BodymoodRouteSetting({
    this.path = '/',
    this.replace = false,
    this.pop = false,
    this.reset = false,
  });
}
