// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved. 
// Use of this source code is governed by the MIT license that can be found 
// in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:spending_tracker/constants.dart';
import 'package:spending_tracker/models/models.dart';

class FilterButton extends StatelessWidget {
  final PopupMenuItemSelected<VisibilityFilter> onSelected;
  final VisibilityFilter activeFilter;
  final bool visible;

  FilterButton({this.onSelected, this.activeFilter, this.visible, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).textTheme.body1;
    final activeStyle = Theme
        .of(context)
        .textTheme
        .body1
        .copyWith(color: Theme.of(context).accentColor);

    return new AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: new Duration(milliseconds: 150),
      child: new PopupMenuButton<VisibilityFilter>(
        key: ArchSampleKeys.filterButton,
        tooltip: "filterTodos",
        onSelected: onSelected,
        itemBuilder: (BuildContext context) =>
            <PopupMenuItem<VisibilityFilter>>[
              new PopupMenuItem<VisibilityFilter>(
                key: ArchSampleKeys.allFilter,
                value: VisibilityFilter.all,
                child: new Text(
                  "showAll",
                  style: activeFilter == VisibilityFilter.all
                      ? activeStyle
                      : defaultStyle,
                ),
              ),
              new PopupMenuItem<VisibilityFilter>(
                key: ArchSampleKeys.activeFilter,
                value: VisibilityFilter.active,
                child: new Text(
                  "showActive",
                  style: activeFilter == VisibilityFilter.active
                      ? activeStyle
                      : defaultStyle,
                ),
              ),
              new PopupMenuItem<VisibilityFilter>(
                key: ArchSampleKeys.completedFilter,
                value: VisibilityFilter.completed,
                child: new Text(
                  "showCompleted",
                  style: activeFilter == VisibilityFilter.completed
                      ? activeStyle
                      : defaultStyle,
                ),
              ),
            ],
        icon: new Icon(Icons.filter_list),
      ),
    );
  }
}
