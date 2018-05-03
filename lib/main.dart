import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:spending_tracker/actions/actions.dart';
import 'package:spending_tracker/containers/add_todo.dart';
import 'package:spending_tracker/middleware/store_todos_middleware.dart';
import 'package:spending_tracker/models/models.dart';
import 'package:spending_tracker/presentation/home_screen.dart';
import 'package:spending_tracker/reducers/app_state_reducer.dart';
import 'package:spending_tracker/constants.dart';

void main() => runApp(new ReduxApp());

class SampleTheme {
  static get theme {
    final originalTextTheme = new ThemeData.dark().textTheme;
    final originalBody1 = originalTextTheme.body1;

    return new ThemeData.dark().copyWith(
        primaryColor: Colors.grey[800],
        accentColor: Colors.cyan[300],
        buttonColor: Colors.grey[800],
        textSelectionColor: Colors.cyan[100],
        backgroundColor: Colors.grey[800],
        textTheme: originalTextTheme.copyWith(
            body1:
                originalBody1.copyWith(decorationColor: Colors.transparent)));
  }
}

class ReduxApp extends StatelessWidget {
  final store = new Store<AppState>(
    appReducer,
    initialState: new AppState.loading(),
    middleware: createStoreTodosMiddleware(),
  );

  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
        store: store,
        child: new MaterialApp(
          title: "Spending Tracker",
          theme: SampleTheme.theme,
          routes: {
            Routes.home: (context) {
              return new StoreBuilder<AppState>(
                  onInit: (store) => store.dispatch(new LoadTodosAction()),
                  builder: (context, store) {
                    return new HomeScreen();
                  },
              );
            },
            Routes.addTodo: (context) {
              return new AddTodo();
            },
            /*
            "/cards": (context) {
              return new Cards();
            },
            "/cards/add": (context) {
              return new AddCard();
            },
            */
          },
        )
    );
  }
}
