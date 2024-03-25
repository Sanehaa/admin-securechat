import 'package:flutter/material.dart';

class DataContainer extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String imagePath;
  final String subTitle1;
  final String subTitle2;

  const DataContainer({
    required this.title,
    required this.iconData,
    required this.imagePath,
    required this.subTitle1,
    required this.subTitle2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green), // Add border
      ),
      width: 300,
      height: 250,
      margin: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(iconData, color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Image.asset(
            imagePath,
            width: 150,
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 14.0),
            child: Column(
              children: [
                Text(subTitle1,
                style: TextStyle(color: Colors.white),),
                Text(subTitle2, style: TextStyle(color: Colors.white),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
