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

class Profile extends Route {
  Profile() : super("Profile");
}

class EditProfile extends Route {
  EditProfile() : super("EditProfile");
}

class Chat extends Route {
  Chat() : super("Chat");
}

class NewOrder extends Route {
  NewOrder() : super("NewOrder");
}

class Orders extends Route {
  Orders() : super("Orders");
}

class OrderDetails extends Route {
  OrderDetails() : super("OrderDetails");
}

class OpenBox extends Route {
  OpenBox() : super("OpenBox");
}

class VideoSurveilance extends Route {
  VideoSurveilance() : super("VideoSurveilance");
}
