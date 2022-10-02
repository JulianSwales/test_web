
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '/screens/web_home_screen.dart';
import '/screens/home_page_reactive.dart';
import '/screens/splash_screen.dart';
import '/screens/admin_page.dart';
import '/screens/claims_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    // Keep this to `true` if want to know what's going on under the hood
    debugLogDiagnostics: true,
    redirect: (state) {

      final _tempAdmin = 'staff';
      if (state.location == '/') {
        if (_tempAdmin == 'staff') {
          return '/admin';
        } else {
          return '/user';
        }
      }
      // There's no need for a redirect at this point.
      return null;
    },
    // This is crucial to make the router work with Riverpod.
    refreshListenable: RouterNotifier(),
    routes: [
      GoRoute(
        name: "home",
        path: '/',
        builder: (context, _) => kIsWeb ? WebHomeScreen() : SplashScreen(),
      ),
      GoRoute(
        name: "admin",
        path: '/admin',
        //builder: (context, _) => HomePage(),
        builder: (context, _) => AdminPage(),
      ),
      GoRoute(
        name: "user",
        path: '/user',
        builder: (context, _) => HomePage(),
      ),
      GoRoute(
        name: "claims",
        path: '/admin/claims',
        builder: (context, _) => ClaimsPage(),
      ),
    ],
  );
});

class RouterNotifier extends ChangeNotifier {
  //final Ref _ref;

  /// Creates a Notifier to be used in GoRouter
  ///
  /// While it is not recommended to use `ChangeNotifier` anywhere else
  /// (reference: https://riverpod.dev/docs/concepts/providers/#different-types-of-providers),
  /// `ChangeNotifier` is a forced choice with go_router.
  ///
  /// GoRouter's refreshListenable only accepts a `Listenable` object as a parameter
  /// and therefore `ChangeNotifier` is used here,
  /// whereas `StateNotifier` is not a `Listenable`, so we can't use it.
  ///
  /// Here we inject a `Ref` so that it's possible to exploit `ref.listen()` to
  /// notify GoRouter that something's changed in our providers.
  ///
  /// Note how we're forced to explicitly call `notifyListeners()`
  /// to make this work.
  /*RouterNotifier(this._ref) {
    _ref.listen<AuthorizedUser?>(
      userProvider,
      (_, __) => notifyListeners(),
    );
  }*/
}
