// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved. 
// Use of this source code is governed by the MIT license that can be found 
// in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:spending_tracker/constants.dart';
import 'package:spending_tracker/containers/active_tab.dart';
import 'package:spending_tracker/containers/extra_actions_container.dart';
import 'package:spending_tracker/containers/filter_selector.dart';
import 'package:spending_tracker/containers/filtered_todos.dart';
import 'package:spending_tracker/containers/stats.dart';
import 'package:spending_tracker/containers/tab_selector.dart';
import 'package:spending_tracker/models/models.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen() : super(key: ArchSampleKeys.homeScreen);

  @override
  Widget build(BuildContext context) {
    return new ActiveTab(
      builder: (BuildContext context, AppTab activeTab) {
        return new Scaffold(
          appBar: new AppBar(
            title: new Text("appTitle"),
            actions: [
              new FilterSelector(visible: activeTab == AppTab.todos),
              new ExtraActionsContainer(),
            ],
          ),
          body: activeTab == AppTab.todos ? new FilteredTodos() : new Stats(),
          floatingActionButton: new FloatingActionButton(
            key: ArchSampleKeys.addTodoFab,
            onPressed: () {
              Navigator.pushNamed(context, Routes.addTodo);
            },
            child: new Icon(Icons.add),
            tooltip: "addTodo",
          ),
          bottomNavigationBar: new TabSelector(),
        );
      },
    );
  }
}
