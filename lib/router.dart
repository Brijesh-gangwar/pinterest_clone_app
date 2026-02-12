import 'package:clerk_flutter/clerk_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:pinterest_clone_app/presentation/screens/auth/auth_screen.dart';
import 'presentation/screens/auth-details/country_selection_screen.dart';
import 'presentation/screens/splash_screen.dart';
import 'presentation/screens/auth-details/signup_age_screen.dart';
import 'presentation/screens/auth-details/signup_gender_screen.dart';
import 'presentation/screens/auth-details/signup_interest_screen.dart';
import 'presentation/screens/dashboard/dashboard_shell.dart';
import 'presentation/screens/dashboard/home_tab.dart';
import 'presentation/screens/dashboard/search_tab.dart';
import 'presentation/screens/dashboard/inbox_tab.dart';
import 'presentation/screens/dashboard/saved_tab.dart';
import 'presentation/screens/accounts/account_screen.dart';
import 'presentation/widgets/image_view_widget.dart';
import 'presentation/widgets/view_profile_widget.dart';


final router = GoRouter(
  initialLocation: '/',

  redirect: (context, state) {
    final auth = ClerkAuth.of(context);
    final loggedIn = auth.user != null;

    final isAuthRoute = state.matchedLocation == '/auth';

    if (!loggedIn && !isAuthRoute) {
      return '/auth';
    }

    if (loggedIn && isAuthRoute) {
      return '/home';
    }

    return null;
  },

  routes: [


    GoRoute(
      path: '/',
      builder: (_, __) => const SplashScreen(),
    ),


  // auth routes
    GoRoute(
      path: '/auth',
      builder: (_, __) => const AuthScreen(),
    ),


  // signup details routes
      GoRoute(
      path: '/signup-age',
      builder: (_, __) => const SignupAgeScreen(),
    ),
    GoRoute(
      path: '/signup-gender',
      builder: (_, __) => const SignupGenderScreen(),
    ),
    GoRoute(
      path: '/signup-country',
      builder: (_, __) => const CountryRegionSelectionScreen(),
    ),
    GoRoute(
      path: '/signup-interest',
      builder: (_, __) => const SignupInterestScreen(),
    ),

  // main dashboard routes
    ShellRoute(
      builder: (context, state, child) {
        return DashboardShell(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (_, __) => const HomeTab(),
        ),
        GoRoute(
          path: '/search',
          builder: (_, __) => const SearchTab(),
        ),
        GoRoute(
          path: '/inbox',
          builder: (_, __) => const InboxTab(),
        ),
        GoRoute(
          path: '/saved',
          builder: (_, __) => const SavedTab(),
        ),
         GoRoute(
          path: '/saved/account',
          builder: (_, __) => const AccountScreen(),
        ),
      ],
    ),



    // image viewer route
    GoRoute(
      path: '/viewer',
      name: 'viewer',
      builder: (context, state) {
        final imageUrl = state.extra as String;
        return ImageDetailScreen(
          imageUrl: imageUrl,
          heroTag: imageUrl,
        );
      },
    ),

    // account profile route
    GoRoute(path: 
    '/profile', builder: (_, __) => const ViewProfileWidget())
  ],
);
