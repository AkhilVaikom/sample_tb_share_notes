import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
 final String name;
  const DrawerWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
              const CircleAvatar(
                  radius: 30,
                  backgroundImage:  NetworkImage('https://mpng.subpng.com/20180326/wzw/kisspng-computer-icons-user-profile-avatar-female-profile-5ab915f791e2c1.8067312315220792235976.jpg'),
                ),
               const SizedBox(
                  width: 20,
                ),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 26,
                    color: Colors.orange,
                    fontFamily: "Lobster",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.teal[700],
          ),
        ),
        const ListTile(
      title: Text("Log Out"),
      trailing: Icon(Icons.power_settings_new),
    ),
        
        // DrawerMenu(
        //   titleText: "Settle App Menu 6",
        //   subTitleText: "Click to open Menu 6",
        //   leadIcon: Icon(Icons.person_search_sharp),
        //   trailIcon: Icon(Icons.arrow_forward_sharp),
        // ),
      ],
    );
  }
}
