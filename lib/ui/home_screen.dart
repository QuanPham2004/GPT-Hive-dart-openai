import 'package:flutter/material.dart';
import '../screen_chat/home_chat.dart';
import 'course_screen.dart';

class HomePage extends StatelessWidget {
  final List catName = [
    "Categroy",
    "Classes",
    "Free Course",
    "ASPE Colab",
    "Live Course",
    "Leaderboard"
  ];

  final List<Color> catColor = [
    const Color(0xFFFFCF2F),
    const Color(0xFF6FE08D),
    const Color(0xFF61BDFD),
    const Color(0xFFFC7F7F),
    const Color(0xFFCB84FB),
    const Color(0xFF78E667)
  ];

  final List<Icon> catIcon = [
    const Icon(
      Icons.category,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.video_library,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.assignment,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.rocket_launch,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.play_circle_fill,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.emoji_events,
      color: Colors.white,
      size: 30,
    ),
  ];

  final List imgList = ['flutter', 'react', 'python', 'c'];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 15, bottom: 10),
              decoration: const BoxDecoration(
                  color: Color(0xFF674AEF),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.dashboard, size: 30, color: Colors.white),
                      Icon(Icons.notifications, size: 30, color: Colors.white)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 3, bottom: 15),
                    child: Text(
                      "Hi, Developer",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          wordSpacing: 2,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.height,
                    height: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Search here.....",
                          hintStyle:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 25,
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Column(
                children: [
                  GridView.builder(
                    itemCount: catName.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 1.1),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: catColor[index], shape: BoxShape.circle),
                            child: Center(child: catIcon[index]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            catName[index],
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6)),
                          )
                        ],
                      );
                    },
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Courses",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF674AEF)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                      itemCount: imgList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio:
                            (MediaQuery.of(context).size.height - 50 - 25) /
                                (4 * 240),
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CourseScreen(imgList[index])));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFFF5F3FF)),
                            child: Center(
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        "images/${imgList[index]}.png",
                                        scale: 1,
                                        width: 100,
                                        height: 100,
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    imgList[index],
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                  Text(
                                    "55 Videos",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.5)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 32,
          showUnselectedLabels: true,
          selectedItemColor: const Color(0xFF674AEF),
          selectedFontSize: 18,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.assessment), label: "Courses"),
            BottomNavigationBarItem(
                icon: Icon(Icons.rocket), label: "Miracle AI"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
          ],
          onTap: (int index) {
            switch (index) {
              case 2:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeChat())); //ChatBot
                break;
              default:
                break;
            }
          }),
    );
  }
}
