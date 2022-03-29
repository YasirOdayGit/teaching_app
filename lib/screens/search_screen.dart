import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teaching_app/config/colors_.dart';

import '../widgets/card_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Faker faker = Faker();
  double _price = 0;
  List<String> priceRange = [
    "\$1 - \$5",
    "\$5 - \$10",
    "\$10 - \$15",
    "\$15 - \$25",
    "\$25 - \$50",
    "\$50 - \$100"
  ];
  int selectedPrice = 4;

  double _age = 0;
  List<String> ageRange = ["5+", "10+", "15+", "18+", "20+"];
  int selectedAge = 2;
  String selectedGender = "Male";
  List<String> subjects = [
    "Maths",
    "English",
    "Physics",
    "Biology",
    "Chemistry",
    "Social Studies",
    "Dart",
    "Computer Science",
    "Flutter",
  ];
  List<String> selectedSubjects = [];
  bool search = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Center(
            child: SizedBox(
              width: size.width * 0.9,
              child: TextFormField(
                cursorColor: greenMed,
                enableSuggestions: true,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    filled: true,
                    alignLabelWithHint: true,
                    fillColor: const Color(0xffDCEBEA),
                    hintStyle: TextStyle(fontSize: 15, color: greenDark),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SvgPicture.asset(
                        "assets/icons/search.svg",
                        color: greenDark,
                      ),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
                            enableDrag: true,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15))),
                            builder: (_) => StatefulBuilder(
                                  builder: (context, setState) =>
                                      SingleChildScrollView(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Text(
                                            "Filters",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: greenDark,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Price",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: greenDark,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            Container(
                                              width: size.width / 2,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: greenTint1,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffABC7C7))),
                                              child: Row(
                                                children: [
                                                  Material(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _price--;
                                                        });
                                                      },
                                                      splashColor: greenTint2,
                                                      child: Ink(
                                                        width: 30,
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                color: const Color(
                                                                    0xffABC7C7))),
                                                        child: const Icon(
                                                          Icons.remove,
                                                          color:
                                                              Color(0xff6B9696),
                                                          size: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                      child: Align(
                                                          child: FittedBox(
                                                              fit: BoxFit
                                                                  .scaleDown,
                                                              child: Text(
                                                                  "$_price")))),
                                                  Material(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _price++;
                                                        });
                                                      },
                                                      splashColor: greenTint2,
                                                      child: Ink(
                                                        width: 30,
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                color: const Color(
                                                                    0xffABC7C7))),
                                                        child: const Icon(
                                                          Icons.add,
                                                          color:
                                                              Color(0xff6B9696),
                                                          size: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16),
                                          child: Wrap(
                                            spacing: 6,
                                            runSpacing: 12,
                                            runAlignment: WrapAlignment.start,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            children: List.generate(
                                                priceRange.length,
                                                (index) => IntrinsicWidth(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(
                                                            () {
                                                              selectedPrice =
                                                                  index;
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                          height: 30,
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      16),
                                                          decoration: BoxDecoration(
                                                              color: index ==
                                                                      selectedPrice
                                                                  ? greenLight
                                                                  : greenTint1,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15)),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            priceRange[index],
                                                            style: TextStyle(
                                                                color: index ==
                                                                        selectedPrice
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                      ),
                                                    )),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 15),
                                          child: Divider(
                                            color: Color(0xffE1E7E7),
                                            indent: 10,
                                            endIndent: 10,
                                            height: 1,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Price",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: greenDark,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            Container(
                                              width: size.width / 2,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: greenTint1,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffABC7C7))),
                                              child: Row(
                                                children: [
                                                  Material(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _age--;
                                                        });
                                                      },
                                                      splashColor: greenTint2,
                                                      child: Ink(
                                                        width: 30,
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                color: const Color(
                                                                    0xffABC7C7))),
                                                        child: const Icon(
                                                          Icons.remove,
                                                          color:
                                                              Color(0xff6B9696),
                                                          size: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                      child: Align(
                                                          child: FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text("$_age years"),
                                                  ))),
                                                  Material(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _age++;
                                                        });
                                                      },
                                                      splashColor: greenTint2,
                                                      child: Ink(
                                                        width: 30,
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                color: const Color(
                                                                    0xffABC7C7))),
                                                        child: const Icon(
                                                          Icons.add,
                                                          color:
                                                              Color(0xff6B9696),
                                                          size: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16),
                                          child: Wrap(
                                            spacing: 6,
                                            runSpacing: 12,
                                            runAlignment: WrapAlignment.start,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            children: List.generate(
                                                ageRange.length,
                                                (index) => IntrinsicWidth(
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          setState(
                                                            () {
                                                              selectedAge =
                                                                  index;
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                            height: 30,
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        16),
                                                            decoration: BoxDecoration(
                                                                color: index ==
                                                                        selectedAge
                                                                    ? greenLight
                                                                    : greenTint1,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              ageRange[index],
                                                              style: TextStyle(
                                                                  color: index ==
                                                                          selectedAge
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            )),
                                                      ),
                                                    )),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 15),
                                          child: Divider(
                                            color: Color(0xffE1E7E7),
                                            indent: 10,
                                            endIndent: 10,
                                            height: 1,
                                          ),
                                        ),
                                        Text(
                                          "Gender",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: greenDark,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16),
                                          child: Wrap(
                                            spacing: 6,
                                            runSpacing: 12,
                                            runAlignment: WrapAlignment.start,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            children: [
                                              IntrinsicWidth(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(
                                                      () {
                                                        selectedGender = "Male";
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                      height: 30,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 32),
                                                      decoration: BoxDecoration(
                                                          color: "Male" ==
                                                                  selectedGender
                                                              ? greenLight
                                                              : greenTint1,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "Male",
                                                        style: TextStyle(
                                                            color: "Male" ==
                                                                    selectedGender
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      )),
                                                ),
                                              ),
                                              IntrinsicWidth(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(
                                                      () {
                                                        selectedGender =
                                                            "Female";
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                      height: 30,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 32),
                                                      decoration: BoxDecoration(
                                                          color: "Female" ==
                                                                  selectedGender
                                                              ? greenLight
                                                              : greenTint1,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "Female",
                                                        style: TextStyle(
                                                            color: "Female" ==
                                                                    selectedGender
                                                                ? Colors.white
                                                                : Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 50,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 7),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "Apply Filter",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17),
                                            ),
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        greenLight),
                                                shape:
                                                    MaterialStateProperty.all(
                                                        RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ))),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 50,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 7),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            child: Text(
                                              "Clear All",
                                              style: TextStyle(
                                                  color: greenLight,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17),
                                            ),
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.white),
                                                overlayColor:
                                                    MaterialStateProperty.all(
                                                        greenLight
                                                            .withOpacity(0.2)),
                                                shape: MaterialStateProperty.all(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                4.0),
                                                        side: BorderSide(
                                                            color:
                                                                greenLight)))),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                      },
                      child: Image.asset(
                        "assets/search.png",
                      ),
                    ),
                    hintText: "Search for teacher",
                    prefixIconConstraints:
                        const BoxConstraints(maxHeight: 17, maxWidth: 50),
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    prefixStyle: TextStyle(color: greenDark),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none)),
              ),
            ),
          ),
          search
              ? ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 15,
                  itemBuilder: (context, index) => TeacherCard(faker: faker),
                )
              : Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 16, horizontal: size.width * 0.075),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Subjects",
                        style: TextStyle(
                            color: greenDark,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Wrap(
                      spacing: 6,
                      runSpacing: 12,
                      runAlignment: WrapAlignment.start,
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: List.generate(
                        subjects.length,
                        (index) => IntrinsicWidth(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (selectedSubjects
                                    .contains(subjects[index])) {
                                  selectedSubjects.remove(subjects[index]);
                                } else {
                                  selectedSubjects.add(subjects[index]);
                                }
                              });
                            },
                            child: Container(
                              height: 30,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  color:
                                      selectedSubjects.contains(subjects[index])
                                          ? greenLight
                                          : greenTint1,
                                  borderRadius: BorderRadius.circular(15)),
                              alignment: Alignment.center,
                              child: Text(
                                subjects[index],
                                style: TextStyle(
                                    color: selectedSubjects
                                            .contains(subjects[index])
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 16, horizontal: size.width * 0.075),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Grade/Class",
                        style: TextStyle(
                            color: greenDark,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.9,
                      child: TextFormField(
                        cursorColor: greenMed,
                        autofocus: false,
                        decoration: InputDecoration(
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 10.0),
                            fillColor: const Color(0xffDCEBEA),
                            hintStyle:
                                TextStyle(fontSize: 15, color: greenDark),
                            hintText: "What is your class?",
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Container(
                      width: size.width * 0.9,
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 7),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            search = true;
                          });
                        },
                        child: const Text(
                          "Find Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(greenLight),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ))),
                      ),
                    ),
                    Container(
                      width: size.width * 0.9,
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 7),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedSubjects.clear();
                            selectedAge = 0;
                            selectedGender = "Male";
                            selectedPrice = 0;
                            _age = 0;
                            _price = 0;
                          });
                        },
                        child: Text(
                          "Clear All",
                          style: TextStyle(
                              color: greenLight,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            overlayColor: MaterialStateProperty.all(
                                greenLight.withOpacity(0.2)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    side: BorderSide(color: greenLight)))),
                      ),
                    )
                  ],
                )
        ],
      ),
    );
  }
}
