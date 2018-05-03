// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved. 
// Use of this source code is governed by the MIT license that can be found 
// in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spending_tracker/constants.dart';
import 'package:spending_tracker/containers/app_loading.dart';
import 'package:spending_tracker/presentation/loading_indicator.dart';

class StatsCounter extends StatelessWidget {
  final int numActive;
  final int numCompleted;

  StatsCounter({
    @required this.numActive,
    @required this.numCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return new AppLoading(builder: (context, loading) {
      return loading
          ? new LoadingIndicator(key: new Key('__statsLoading__'))
          : _buildStats(context);
    });
  }

  Widget _buildStats(BuildContext context) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Padding(
            padding: new EdgeInsets.only(bottom: 8.0),
            child: new Text(
              "completedTodos",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          new Padding(
            padding: new EdgeInsets.only(bottom: 24.0),
            child: new Text(
              '$numCompleted',
              key: ArchSampleKeys.statsNumCompleted,
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
          new Padding(
            padding: new EdgeInsets.only(bottom: 8.0),
            child: new Text(
              "activeTodos",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          new Padding(
            padding: new EdgeInsets.only(bottom: 24.0),
            child: new Text(
              "$numActive",
              key: ArchSampleKeys.statsNumActive,
              style: Theme.of(context).textTheme.subhead,
            ),
          )
        ],
      ),
    );
  }
}
