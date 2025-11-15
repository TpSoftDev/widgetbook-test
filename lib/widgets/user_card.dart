import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  //Properties
  final String name;
  final String email;
  // "?" means the property is optional
  final String ? avatarUrl;
  final Color ? backgroundColor;
  final IconData ? avatarIcon;



  //Constructor
  const UserCard({super.key,
  required this.name,
  required this.email,
  this.avatarUrl,
  this.backgroundColor,
  this.avatarIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor ?? Colors.white,
      child: ListTile(
        title: Text(name),
        subtitle: Text(email),
        leading: CircleAvatar(
          child: avatarUrl != null 
      ? Image.network(avatarUrl!)  // If avatarUrl exists, show image
      : Icon(avatarIcon ?? Icons.person), // Else check avatarIcon
    ),
  ),
);
}
}
