enum AppRoutes {
  root,
  login,
  forgot,
  Register,
  managementplanvsactualscreen,
  Monthlyreport,
  Annualreport,
  DashBoard,
  Alertpage,
  menupage,
}

extension AppRouteExtension on AppRoutes {
  static const appRoutes = {
    AppRoutes.root: "/",
    AppRoutes.login: "/login",
    AppRoutes.forgot: "/forgot",
    AppRoutes.Register: "/Register",
    AppRoutes.managementplanvsactualscreen: "/managementplanvsactualscreen",
    AppRoutes.Monthlyreport: "/Monthlyreportscreen",
    AppRoutes.Annualreport: "/Annualreportscreen",
    AppRoutes.DashBoard: "/DashBoardscreen",
    AppRoutes.Alertpage: "/Alertpage",
    AppRoutes.menupage: "/menupage",
  };

  String get toName => appRoutes[this] ?? "/";
}

enum ApiRoutes {
  login,
}

extension ApiRouteExtension on ApiRoutes {
  static const apiRoutes = {
    ApiRoutes.login: "",
  };

  String get toName => apiRoutes[this]!;
}
