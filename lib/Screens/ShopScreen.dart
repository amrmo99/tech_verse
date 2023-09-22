import 'package:flutter/material.dart';
import 'package:session7test/Components/CarouselWithDotsPage.dart';
import 'package:session7test/Models/ShopScreen/Catagory.dart';
import 'package:session7test/Models/ShopScreen/Products.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchProduct = TextEditingController();
    // List<int> list = [1, 2, 3, 4, 5];
    final List<String> list = [
      'https://www.techrepublic.com/wp-content/uploads/2023/07/tr71123-ai-art.jpeg',
      'https://www.chieflearningofficer.com/wp-content/uploads/2023/05/AdobeStock_557955842.jpeg',
      'https://www.frost.com/wp-content/uploads/2022/07/Metaverse-Virtual-World-Interconnected-Network.jpeg',
      'https://www.emizentech.com/blog/wp-content/uploads/sites/2/2022/04/what-is-metaverse-learn-everthing-about-it.jpg',
      'https://kpmg.com/content/dam/kpmgblogs/in/images/post/2023/04/a-sneak-peek-into-2030-with-generative-ai-2200x1500.jpg',
      'https://www.artificialintelligence.news/pathal/uploads/2022/02/AdobeStock_473715449-metaverso-VR-cyber.jpeg'
    ];

    List<Products> productsObj = [
      Products(
          image:
              'https://play-lh.googleusercontent.com/mO5Gx_wJK7qC__SrsF-2h6VXFMlv3nbXpyv--s9-snJzz2TTfuhKCvz--lSqG_NlWq0',
          desc: 'Introduction to Astronomy ',
          price: 299.5),
      Products(
          image:
              'https://www.ngaus.org/sites/default/files/styles/cover_image/public/2022-06/Mark%20Satellite%20WR-min.jpg?itok=0YoyttVq',
          desc: 'HARNESSING SATELLITES FOR ENVIRONMENT',
          price: 250.0),
      Products(
          image:
              'https://www.plt.org/wp-content/uploads/2018/09/Depositphotos_64716325_l-2015.jpg',
          desc: 'SCIENCE AND CLIMATE CHANGE',
          price: 250.0),
      Products(
          image:
              'https://img.freepik.com/free-vector/flat-design-nft-concept-illustration_23-2148954417.jpg?w=900&t=st=1694823916~exp=1694824516~hmac=31e94701741e0b07c5eb0731b0f9255207365579a7dfa1b9e7322ac2121c75ed',
          desc: 'BASICS OF BLOCKCHAIN COURSE',
          price: 250.0),
      Products(
          image:
              'https://st5.depositphotos.com/1006318/66236/v/450/depositphotos_662368066-stock-illustration-woman-learning-foreign-language-computer.jpg',
          desc: 'ARTIFICIAL INTELLIGENCE COURSE',
          price: 250.0),
      Products(
          image:
              'https://img.freepik.com/free-vector/characters-people-holding-blockchain-network_53876-26824.jpg?w=826&t=st=1694823969~exp=1694824569~hmac=e470ca8a1dfc26f72e15391ebc4106c12010ea9382fbf45c396ff3614d73fc35',
          desc: 'ADVANCED BLOCK CHAIN COURSE',
          price: 250.0),
    ];

    List<Products> MegoObj = [
Products(
          image:
              'https://www.plt.org/wp-content/uploads/2018/09/Depositphotos_64716325_l-2015.jpg',
          desc: 'SCIENCE AND CLIMATE CHANGE',
          price: 250.0),
      Products(
          image:
              'https://www.ngaus.org/sites/default/files/styles/cover_image/public/2022-06/Mark%20Satellite%20WR-min.jpg?itok=0YoyttVq',
          desc: 'HARNESSING SATELLITES FOR ENVIRONMENT',
          price: 250.0),
                Products(
          image:
              'https://play-lh.googleusercontent.com/mO5Gx_wJK7qC__SrsF-2h6VXFMlv3nbXpyv--s9-snJzz2TTfuhKCvz--lSqG_NlWq0',
          desc: 'Introduction to Astronomy ',
          price: 299.5),
      
      Products(
          image:
              'https://img.freepik.com/free-vector/flat-design-nft-concept-illustration_23-2148954417.jpg?w=900&t=st=1694823916~exp=1694824516~hmac=31e94701741e0b07c5eb0731b0f9255207365579a7dfa1b9e7322ac2121c75ed',
          desc: 'BASICS OF BLOCKCHAIN COURSE',
          price: 250.0),
      Products(
          image:
              'https://st5.depositphotos.com/1006318/66236/v/450/depositphotos_662368066-stock-illustration-woman-learning-foreign-language-computer.jpg',
          desc: 'ARTIFICIAL INTELLIGENCE COURSE',
          price: 250.0),
      Products(
          image:
              'https://img.freepik.com/free-vector/characters-people-holding-blockchain-network_53876-26824.jpg?w=826&t=st=1694823969~exp=1694824569~hmac=e470ca8a1dfc26f72e15391ebc4106c12010ea9382fbf45c396ff3614d73fc35',
          desc: 'ADVANCED BLOCK CHAIN COURSE',
          price: 250.0),
    ];

    List<Catagory> catagoryObj = [
      Catagory(image: 'images/visualization.png', desc: 'ALL'),
      Catagory(image: 'images/study.png', desc: 'COURSES'),
      Catagory(image: 'images/star.png', desc: 'POINTS'),
      Catagory(image: 'images/online.png', desc: 'BLOGS'),
      Catagory(image: 'images/menu.png', desc: 'OTHERS'),
    ];
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 140,
                decoration: BoxDecoration(
                    color: Color(0xff385f98),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, top: 20, bottom: 20),
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
                              "TAP HERE TO CLAM YOUR  ",
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
                        padding: EdgeInsets.only(right: 20),
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
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    child: Row(
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
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 120,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            buildCatagory(catagoryObj[index]),
                        separatorBuilder: (context, index) => SizedBox(
                              width: 4,
                            ),
                        itemCount: catagoryObj.length),
                  ),

                  SizedBox(
                    height: 10,
                  ), //2section

                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'FEATURED PRODUCT',
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
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 10, left: 15, top: 15, bottom: 30),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          "ALL",
                          style: TextStyle(color: Color(0xff385f98)),
                        )),
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Color(0xff385f98))),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text(
                                    "NEWEST",
                                    style: TextStyle(
                                        color: Color(0xff385f98), fontSize: 11),
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Color(0xff385f98))),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text(
                                    "POPULAR",
                                    style: TextStyle(
                                        color: Color(0xff385f98), fontSize: 11),
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Color(0xff385f98))),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text(
                                    "TREND",
                                    style: TextStyle(
                                        color: Color(0xff385f98), fontSize: 11),
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            buildFlash(productsObj[index]),
                        separatorBuilder: (context, index) => SizedBox(
                              width: 4,
                            ),
                        itemCount: 6),
                  ),

                  SizedBox(
                    height: 10,
                  ), //3section

                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Recommande',
                          ),
                        ),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('See More',
                                style: TextStyle(color: Colors.blue)),
                          ],
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: GestureDetector(
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              buildMego(MegoObj[index]),
                          separatorBuilder: (context, index) => SizedBox(
                                width: 10,
                              ),
                          itemCount: 6),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
                color: Color(0xff385f98),
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              catagory.image,
              scale: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 8),
            child: Text(
              catagory.desc,
              style: TextStyle(
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

  Widget buildFlash(Products products) {
    return Container(
      width: 180,
      height: 400,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 215, 221, 237)),
          //color: Color.fromARGB(255, 215, 221, 237),
          borderRadius: BorderRadius.circular(15),
        ),
        // shape: BoxShape.
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.network(
                    products.image,
                    scale: 4,
                    width: 170,
                    height: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    products.desc,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff385f98)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '${products.price.toString()} L.E',
                        style: TextStyle(fontSize: 10, color: Colors.blue),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.star,
                        size: 12,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star,
                        size: 12,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star,
                        size: 12,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star,
                        size: 12,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star,
                        size: 12,
                        color: Colors.amber,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$530,3',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '24\% off',
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

  Widget buildMego(Products products) {
    return Container(
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
              SizedBox(
                height: 10,
              ),
              Text(
                products.desc,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '\$${products.price.toString()}',
                style: TextStyle(fontSize: 10, color: Colors.blue),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '\$530,3',
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '24\% off',
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
    );
  }
}
