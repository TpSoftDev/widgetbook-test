import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'user_card.dart';  // This will work when file is in lib/widgets/

@widgetbook.UseCase(name: 'User Card', type: UserCard)
Widget userCard(BuildContext context) {
  return UserCard(
    name: 'User1',
    email: 'user1@gmail.com',
  );
}

@widgetbook.UseCase(name: 'User2 with Avatar Icon', type: UserCard)
Widget user2(BuildContext context) {
  return UserCard(
    name: 'User2',
    email: 'user2@gmail.com',
    avatarIcon: Icons.account_circle,
  );
}
@widgetbook.UseCase(name: 'User Card with Custom Color', type: UserCard)
Widget buildUserCardWithColor(BuildContext context) {
  return UserCard(
    name: 'User3',
    email: 'user3@gmail.com',
    backgroundColor: Colors.blue,
  );
}
