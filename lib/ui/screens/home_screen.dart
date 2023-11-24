import 'package:flutter/material.dart';
import 'package:session7test/Models/ShopScreen/catagory.dart';
import 'package:session7test/Models/ShopScreen/products.dart';
import 'package:session7test/ui/screens/video_courses.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final List<String> videoPaths = [
      'videos/course1.mp4',
      'videos/course1.mp4',
      'videos/course1.mp4',
      'videos/course1.mp4',
      'videos/course1.mp4',
      'videos/course1.mp4',
      // Add paths for other videos here
    ];

    Widget buildMego(Products products, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {
          });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoCourse(videoPath: videoPaths[index]),
            ),
          );
        },
        child: SizedBox(
          width: 150,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            // shape: BoxShape.
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    products.image,
                    scale: 5,
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    products.desc,
                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xff385f98)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$${products.price}',
                    style: const TextStyle(fontSize: 10, color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    children: [
                      Text(
                        '\$530,3',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '24% off',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget buildFlash(Products products, int index) {
      return GestureDetector(
        onTap: () {
          setState(() {

            print(videoPaths[index]);
          });

          // Navigate to VideoCourse screen with the selected video path
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoCourse(videoPath: videoPaths[index]),
            ),
          );
        },
        child: SizedBox(
          width: 180,
          height: 400,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 215, 221, 237)),
              //color: Color.fromARGB(255, 215, 221, 237),
              borderRadius: BorderRadius.circular(15),
            ),
            // shape: BoxShape.
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      products.image,
                      scale: 4,
                      width: 170,
                      height: 100,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      products.desc,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff385f98),),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '${products.price} L.E',
                          style: const TextStyle(fontSize: 10, color: Colors.blue),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: Colors.amber,
                        ),
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: Colors.amber,
                        ),
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: Colors.amber,
                        ),
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: Colors.amber,
                        ),
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        Text(
                          '\$530,3',
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '24% off',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    final List<String> list = [
      'https://www.techrepublic.com/wp-content/uploads/2023/07/tr71123-ai-art.jpeg',
      'https://www.chieflearningofficer.com/wp-content/uploads/2023/05/AdobeStock_557955842.jpeg',
      'https://www.frost.com/wp-content/uploads/2022/07/Metaverse-Virtual-World-Interconnected-Network.jpeg',
      'https://www.emizentech.com/blog/wp-content/uploads/sites/2/2022/04/what-is-metaverse-learn-everthing-about-it.jpg',
      'https://kpmg.com/content/dam/kpmgblogs/in/images/post/2023/04/a-sneak-peek-into-2030-with-generative-ai-2200x1500.jpg',
      'https://www.artificialintelligence.news/pathal/uploads/2022/02/AdobeStock_473715449-metaverso-VR-cyber.jpeg',
    ];

    final List<Products> productsObj = [
      Products(
          image:
              'https://play-lh.googleusercontent.com/mO5Gx_wJK7qC__SrsF-2h6VXFMlv3nbXpyv--s9-snJzz2TTfuhKCvz--lSqG_NlWq0',
          desc: 'Introduction to Astronomy ',
          price: 299.5,),
      Products(
          image:
              'https://www.ngaus.org/sites/default/files/styles/cover_image/public/2022-06/Mark%20Satellite%20WR-min.jpg?itok=0YoyttVq',
          desc: 'HARNESSING SATELLITES FOR ENVIRONMENT',
          price: 250.0,),
      Products(
          image:
              'https://www.plt.org/wp-content/uploads/2018/09/Depositphotos_64716325_l-2015.jpg',
          desc: 'SCIENCE AND CLIMATE CHANGE',
          price: 250.0,),

    ];

    final List<Products> MegoObj = [
      Products(
          image:
              'https://www.plt.org/wp-content/uploads/2018/09/Depositphotos_64716325_l-2015.jpg',
          desc: 'SCIENCE AND CLIMATE CHANGE',
          price: 250.0,),
      Products(
          image:
              'https://www.ngaus.org/sites/default/files/styles/cover_image/public/2022-06/Mark%20Satellite%20WR-min.jpg?itok=0YoyttVq',
          desc: 'HARNESSING SATELLITES FOR ENVIRONMENT',
          price: 250.0,),
      Products(
          image:
              'https://play-lh.googleusercontent.com/mO5Gx_wJK7qC__SrsF-2h6VXFMlv3nbXpyv--s9-snJzz2TTfuhKCvz--lSqG_NlWq0',
          desc: 'Introduction to Astronomy ',
          price: 299.5,),

    ];

    final List<Catagory> catagoryObj = [
      Catagory(image: 'images/visualization.png', desc: 'ALL'),
      Catagory(image: 'images/study.png', desc: 'COURSES'),
      Catagory(image: 'images/star.png', desc: 'POINTS'),
      Catagory(image: 'images/online.png', desc: 'BLOGS'),
      Catagory(image: 'images/menu.png', desc: 'OTHERS'),
    ];
    return  Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 140,
                decoration: BoxDecoration(
                    color: const Color(0xff385f98),
                    borderRadius: BorderRadius.circular(10),),
                child: Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 15, top: 20, bottom: 20,),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "FREE VOUCHERS",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 9),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "TAP HERE TO CLAME YOUR  ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                            Text(
                              "FREE DISCOUNT VOUCHERS",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(right: 20),
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          "images/percentage.png",
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'CATEGORIES',
                          style: TextStyle(color: Color(0xff385f98)),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'VIEW MORE',
                              style: TextStyle(color: Color(0xff385f98)),
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

                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            buildCatagory(catagoryObj[index]),
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 4,
                            ),
                        itemCount: catagoryObj.length,),
                  ),

                  const SizedBox(
                    height: 10,
                  ), //2section

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'FEATURED PRODUCT',
                        style: TextStyle(color: Color(0xff385f98)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'VIEW MORE',
                            style: TextStyle(color: Color(0xff385f98)),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Color(0xff385f98),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 10, left: 15, top: 15, bottom: 30,),
                    child: Row(
                      children: [
                        const Expanded(
                            child: Text(
                          "ALL",
                          style: TextStyle(color: Color(0xff385f98)),
                        ),),
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff385f98),),),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text(
                                    "NEWEST",
                                    style: TextStyle(
                                        color: Color(0xff385f98), fontSize: 11,),
                                  ),
                                ),
                              ),),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff385f98),),),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text(
                                    "POPULAR",
                                    style: TextStyle(
                                        color: Color(0xff385f98), fontSize: 11,),
                                  ),
                                ),
                              ),),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff385f98),),),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text(
                                    "TREND",
                                    style: TextStyle(
                                        color: Color(0xff385f98), fontSize: 11,),
                                  ),
                                ),
                              ),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            buildFlash(productsObj[index], index),
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 4,
                            ),
                        itemCount: productsObj.length,),
                  ),

                  const SizedBox(
                    height: 10,
                  ), //3section

                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Recommended',
                           style: TextStyle(color: Color(0xff385f98)),
                        ),
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('See More',
                               style: TextStyle(color: Color(0xff385f98)),),
                        ],
                      ),),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          buildMego(MegoObj[index], index),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                      itemCount: MegoObj.length,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }

  Widget buildCatagory(Catagory catagory) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: const Color(0xff385f98),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              catagory.image,
              scale: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 8),
            child: Text(
              catagory.desc,
              style: const TextStyle(
                fontSize: 8,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
