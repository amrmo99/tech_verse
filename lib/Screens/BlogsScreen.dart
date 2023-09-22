import 'package:flutter/material.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          margin: EdgeInsets.only(top: 17),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xff385f98), width: 1)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    'Search',
                    style: TextStyle(fontSize: 15),
                  ),
                )),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.search_rounded,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              margin: EdgeInsets.only(top: 15),
              height: 50,
              width: 40,
              decoration: BoxDecoration(
                  color: Color(0xff385f98),
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, bottom: 5, right: 15, top: 10),
              child: Container(
                height: 320,
                decoration: BoxDecoration(
                    color: Color(0xfff0f0f0),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Astronomy/Astrophysicsi",
                        style: TextStyle(
                            color: Color(0xff385f98),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "What You Should Know About Getting a Career In Astronomy/Astrophysics ?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'A Day AGO | 12 MIN',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'READ MORE',
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xff385f98)),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Color(0xff385f98),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.network(
                        "https://i.ytimg.com/vi/vGw0l8qLlOA/maxresdefault.jpg",
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, bottom: 5, right: 15, top: 10),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    color: Color(0xfff0f0f0),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Role of Python in space",
                        style: TextStyle(
                            color: Color(0xff385f98),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Discover the role of Python in space exploration -",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        " Training | Microsoft Learn",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '3 Days AGO | 20 MIN',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'READ MORE',
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xff385f98)),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Color(0xff385f98),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.network(
                          "https://learn.microsoft.com/training/achievements/introduction-python-space-exploration-nasa-social.png")
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, bottom: 5, right: 15, top: 10),
              child: Container(
                height: 235,
                decoration: BoxDecoration(
                    color: Color(0xfff0f0f0),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Read about Block-Chain",
                        style: TextStyle(
                            color: Color(0xff385f98),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "How to use block-chain?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '5 Day AGO | 20 MIN',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'READ MORE',
                                    style: TextStyle(
                                        fontSize: 13, color: Color(0xff385f98)),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Color(0xff385f98),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.network(
                          "https://geekflare.com/wp-content/uploads/2021/10/blockchain-as-a-service-1200x385.png")
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
