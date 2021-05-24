import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: drawerItems
          .map((element) => Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  children: [
                    Icon(
                      element['icon'],
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(element['title'],
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20))
                  ],
                ),
              ))
          .toList(),
    );
  }
}

List<Map> drawerItems = [
  {
    'icon': Icons.airport_shuttle_sharp,
    'title': 'Fire Control Services',
    'onTap': () {}
  },
  {'icon': Icons.bus_alert, 'title': 'Police Services', 'onTap': () {}},
  {'icon': Icons.local_hospital, 'title': 'Hospital Services', 'onTap': () {}},
  {'icon': Icons.mail, 'title': 'Covid report Services', 'onTap': () {}},
  {'icon': Icons.ad_units_outlined, 'title': 'About Us', 'onTap': () {}},
];
