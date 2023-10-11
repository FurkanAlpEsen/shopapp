import 'package:flutter/material.dart';

PreferredSizeWidget CustomAppBar() {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 75, 75, 75),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 25,
          width: 110,
          child: ElevatedButton.icon(
              icon: Icon(
                Icons.euro,
                size: 13,
                color: Colors.black,
              ),
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
                  backgroundColor: MaterialStatePropertyAll(Colors.yellow)),
              onPressed: () {},
              label: Text(
                overflow: TextOverflow.clip,
                softWrap: false,
                maxLines: 1,
                '142.000',
                style: TextStyle(fontSize: 12, color: Colors.black),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 3, right: 3),
          child: Image.asset(
            'assets/images/foto.png',
            scale: 1,
          ),
        ),
        Icon(
          Icons.menu,
          color: Colors.white,
        )
      ],
    ),
  );
}
