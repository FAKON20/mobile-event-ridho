import 'package:e_music/src/features/authentication/sign_in_page.dart';
import 'package:e_music/src/features/home/detail_page.dart';
import 'package:e_music/src/features/home/home_page.dart';
import 'package:go_router/go_router.dart';

import '../features/account/account_page.dart';
import '../features/account/add_data_fest.dart';
import '../features/authentication/register_page.dart';
import '../features/home/data_booking_page.dart';
// GoRouter configuration

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'sign_in', // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/',
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: 'register',
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      name: 'account',
      path: '/account',
      builder: (context, state) => const AccountPage(),
    ),
    GoRoute(
      name: 'addDataFest',
      path: '/addDataFest',
      builder: (context, state) => const AddDataFest(),
    ),
    GoRoute(
      name: 'detail',
      path: '/detail',
      builder: (context, state) {
        final data = state.extra! as Map<String,dynamic>;
        return DetailPage( index: data['index']
      );},
    ),
    GoRoute(
      name: 'bookingPage',
      path: '/bookingPage',
      builder: (context, state) {
        final data = state.extra! as Map<String,dynamic>;
        return DataBookingPage( index: data['index']
      );},
    ),
  ],
);

// class ScaffoldBottomNavigationBar extends StatelessWidget {
//   const ScaffoldBottomNavigationBar({
//     required this.navigationShell,
//     Key? key,
//   }) : super(key: key ?? const ValueKey<String>('ScaffoldBottomNavigationBar'));
//
//   final StatefulNavigationShell navigationShell;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: navigationShell,
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Section_A'),
//           BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Section_B'),
//         ],
//         currentIndex: navigationShell.currentIndex,
//         onTap: (int tappedIndex) {
//           navigationShell.goBranch(tappedIndex);
//         },
//       ),
//     );
//   }
// }
//
// class StatefulShellRouteExampleApp extends StatelessWidget {
//   StatefulShellRouteExampleApp({super.key});
//
//   final GoRouter _router = GoRouter(
//     initialLocation: '/sign_in',
//     routes: <RouteBase>[
//       GoRoute(
//         name: 'sign_in',
//         path: '/sign_in',
//         builder: (BuildContext context, GoRouterState state) {
//           return const SignInPage();
//         },
//       ),
//       GoRoute(
//         name: 'register',
//         path: '/register',
//         builder: (BuildContext context, GoRouterState state) {
//           return const RegisterPage();
//         },
//       ),
//       StatefulShellRoute.indexedStack(
//         builder: (BuildContext context, GoRouterState state,
//             StatefulNavigationShell navigationShell) {
//           return ScaffoldBottomNavigationBar(
//             navigationShell: navigationShell,
//           );
//         },
//         branches: <StatefulShellBranch>[
//           StatefulShellBranch(
//             routes: <RouteBase>[
//               GoRoute(
//                 name: 'home',
//                 path: '/home',
//                 builder: (BuildContext context, GoRouterState state) {
//                   return const HomePage();
//                 },
//                 // routes: <RouteBase>[
//                 //   GoRoute(
//                 //     path: 'details',
//                 //     builder: (BuildContext context, GoRouterState state) {
//                 //       return const DetailsScreen(label: 'A');
//                 //     },
//                 //   ),
//                 // ],
//               ),
//             ],
//           ),
//           // StatefulShellBranch(
//           //   routes: <RouteBase>[
//           //     GoRoute(
//           //       path: '/sectionB',
//           //       builder: (BuildContext context, GoRouterState state) {
//           //         return const RootScreen(
//           //           label: 'Section B',
//           //           detailsPath: '/sectionB/details',
//           //         );
//           //       },
//           //       routes: <RouteBase>[
//           //         GoRoute(
//           //           path: 'details',
//           //           builder: (BuildContext context, GoRouterState state) {
//           //             return const DetailsScreen(label: 'B');
//           //           },
//           //         ),
//           //       ],
//           //     ),
//           //   ],
//           // ),
//         ],
//       ),
//     ],
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: 'Go_router Complex Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       routerConfig: _router,
//     );
//   }
// }