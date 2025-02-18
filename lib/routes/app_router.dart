import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo2/view/add_todo_page.dart';
import 'package:todo2/view/home_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/add',
      builder: (context, state) => AddTodoPage(),
    ),
  ],
);
