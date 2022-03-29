import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../config/colors_.dart';

class TeacherCard extends StatelessWidget {
  const TeacherCard({
    Key? key,
    required this.faker,
  }) : super(key: key);

  final Faker faker;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 111,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: greenDark.withOpacity(0.12), width: 1),
          color: Colors.white),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                faker.image.image(random: true, keywords: ["person"]),
                width: 75,
                height: 75,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Title for teacher, you can write anything here",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              const Flexible(
                flex: 1,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "\$10 - \$15",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    "⭐ 4.5 • by " + faker.person.name() + " • All Levels",
                    style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xff91919F),
                        fontWeight: FontWeight.normal),
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
