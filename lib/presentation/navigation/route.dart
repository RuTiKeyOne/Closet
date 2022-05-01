class Route {
  String route;

  Route(this.route);
}

class Authorization extends Route {
  Authorization() : super("Authorization");
}

class Registration extends Route {
  Registration() : super("Registration");
}

class Main extends Route {
  Main() : super("Main");
}
