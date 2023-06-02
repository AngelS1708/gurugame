import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) => LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => LoginWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: 'home',
          path: '/home',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'home')
              : HomeWidget(
                  userId: params.getParam('userId', ParamType.String),
                  admin: params.getParam('admin', ParamType.bool),
                  name: params.getParam('name', ParamType.String),
                ),
        ),
        FFRoute(
          name: 'Search',
          path: '/search',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Search')
              : SearchWidget(
                  userId: params.getParam('userId', ParamType.String),
                ),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Profile')
              : ProfileWidget(
                  userId: params.getParam('userId', ParamType.String),
                  name: params.getParam('name', ParamType.String),
                  admin: params.getParam('admin', ParamType.bool),
                ),
        ),
        FFRoute(
          name: 'editarPerfil',
          path: '/editarPerfil',
          builder: (context, params) => EditarPerfilWidget(
            userId: params.getParam('userId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'editImage',
          path: '/editImage',
          builder: (context, params) => EditImageWidget(
            userId: params.getParam('userId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'contenidoJuego',
          path: '/contenidoJuego',
          builder: (context, params) => ContenidoJuegoWidget(
            userId: params.getParam('userId', ParamType.String),
            gameId: params.getParam('gameId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'allGames',
          path: '/allGames',
          builder: (context, params) => AllGamesWidget(
            uerId: params.getParam('uerId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'AddGame',
          path: '/addGame',
          builder: (context, params) => AddGameWidget(
            userId: params.getParam('userId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'EliminateGames',
          path: '/eliminateGames',
          builder: (context, params) => EliminateGamesWidget(
            userId: params.getParam('userId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'AdminViewer',
          path: '/adminViewer',
          builder: (context, params) => AdminViewerWidget(
            userId: params.getParam('userId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'juegosCompletados',
          path: '/juegosCompletados',
          builder: (context, params) => JuegosCompletadosWidget(
            userId: params.getParam('userId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'juegosEspera',
          path: '/juegosEspera',
          builder: (context, params) => JuegosEsperaWidget(
            userId: params.getParam('userId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'juegosenCurso',
          path: '/juegosenCurso',
          builder: (context, params) => JuegosenCursoWidget(
            userId: params.getParam('userId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'juegosAbandonados',
          path: '/juegosAbandonados',
          builder: (context, params) => JuegosAbandonadosWidget(
            userId: params.getParam('userId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'terminosYCondiciones',
          path: '/terminosYCondiciones',
          builder: (context, params) => TerminosYCondicionesWidget(),
        ),
        FFRoute(
          name: 'register',
          path: '/register',
          builder: (context, params) => RegisterWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (GoRouter.of(this).routerDelegate.matches.length <= 1) {
      go('/');
    } else {
      pop();
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
