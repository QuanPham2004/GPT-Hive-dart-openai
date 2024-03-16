import 'package:flutter/material.dart';
import 'description_section.dart';
import 'video_section.dart';

class CourseScreen extends StatefulWidget {
  final String img;
  const CourseScreen(this.img, {super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  bool isvideoSelect = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.img,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.notifications,
              size: 28,
              color: Color.fromARGB(246, 64, 117, 191),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  color: const Color(0xFFF5F3FF),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage("images/${widget.img}.png"))),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(Icons.play_arrow_rounded),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "${widget.img} complete Course",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),
            Text(
              "Created by Quan",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.6)),
            ),
            const SizedBox(height: 6),
            Text(
              "55 Videos",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.5)),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F3FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    color: isvideoSelect
                        ? const Color(0xFF674AEF)
                        : const Color(0xFF674AEF).withOpacity(0.5),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isvideoSelect = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 35),
                        child: const Text(
                          "Videos",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    color: isvideoSelect
                        ? const Color(0xFF674AEF).withOpacity(0.5)
                        : const Color(0xFF674AEF),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isvideoSelect = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 35),
                        child: const Text(
                          "Description",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            isvideoSelect ? const VideoScreen() : const DescriptionScreen(),
          ],
        ),
      ),
    );
  }
}
