import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// Import the widget from the main app (package name = pubspec name of main app)
import 'package:widgetbook_test/widgets/user_card.dart';

// INTERACTIVE STORY - Change user properties with knobs!
@widgetbook.UseCase(name: 'Interactive User Card', type: UserCard)
Widget interactiveUserCard(BuildContext context) {
  final name = context.knobs.string(
    label: 'Name',
    initialValue: 'John Doe',
  );
  
  final email = context.knobs.string(
    label: 'Email',
    initialValue: 'john.doe@example.com',
  );
  
  final colorName = context.knobs.string.fromOptionsNullable(
    label: 'Card Color',
    initialOption: 'None',
    options: ['White', 'Blue', 'Green', 'Purple', 'None'],
  ) ?? 'None';
  
  final backgroundColor = {
    'White': Colors.white,
    'Blue': Colors.blue.shade50,
    'Green': Colors.green.shade50,
    'Purple': Colors.purple.shade50,
    'None': null,
  }[colorName];
  
  final avatarType = context.knobs.string.fromOptionsNullable(
    label: 'Avatar Type',
    initialOption: 'icon',
    options: ['icon', 'account', 'none'],
  ) ?? 'icon';
  
  IconData? avatarIcon;
  if (avatarType == 'icon') {
    avatarIcon = Icons.person;
  } else if (avatarType == 'account') {
    avatarIcon = Icons.account_circle;
  }
  
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: UserCard(
        name: name,
        email: email,
        backgroundColor: backgroundColor,
        avatarIcon: avatarIcon,
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'User Card', type: UserCard)
Widget userCard(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: UserCard(name: 'User1', email: 'user1@gmail.com'),
    ),
  );
}

@widgetbook.UseCase(name: 'User2 with Avatar Icon', type: UserCard)
Widget user2(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: UserCard(
        name: 'User2',
        email: 'user2@gmail.com',
        avatarIcon: Icons.account_circle,
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'User Card with Custom Color', type: UserCard)
Widget buildUserCardWithColor(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: UserCard(
        name: 'User3',
        email: 'user3@gmail.com',
        backgroundColor: Colors.blue,
      ),
    ),
  );
}
