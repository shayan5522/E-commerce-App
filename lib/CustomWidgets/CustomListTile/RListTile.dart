import 'package:flutter/material.dart';

class RlistTile extends StatelessWidget {
  const RlistTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.icon,
     this.trailing,
  });
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final IconData icon;
  final Widget? trailing;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,size: 28,),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text(subtitle),
      onTap: () {},
      trailing: trailing,
    );
  }
}
