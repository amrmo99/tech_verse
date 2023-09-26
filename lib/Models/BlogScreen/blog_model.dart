

import 'package:session7test/Models/BlogScreen/author_model.dart';

class Blog {
  String imageUrl;
  String name;
  Author author;
  bool liked;
  String created_at;
  String content;

  Blog({
    required this.imageUrl,
    required this.name,
    required this.author,
   required this.liked,
   required this.created_at,
    required this.content
  });
}

final List<Blog> blogs = [
  Blog(
    imageUrl: 'assets/images/blog1.jpg',
    name: 'Astronomy/Astrophysics',
    author: mike,
    liked: true,
    created_at: "56 min ago",
    content: "Astronomy and astrophysics explore the universe's mysteries, studying celestial objects and phenomena. They seek to understand the cosmos's origins, evolution, and fundamental laws, from black holes to galaxies. These fields rely on advanced telescopes, simulations, and theories to unveil the secrets of the cosmos. Their discoveries expand our knowledge of the universe and inspire wonder about our place in it."
  ),
  Blog(
    imageUrl: 'assets/images/blog2.png',
    name: 'Role of Python in space',
    author: sam,
    liked: true,
    created_at: "2 days ago",
    content: "In the boundless realm of space exploration, Python shines as a guiding star. Its versatility and simplicity empower scientists and engineers to navigate the cosmos with ease. From crunching orbital data to controlling Mars rovers, Python's impact is undeniable, making it an essential tool in unraveling the mysteries of the universe. Join us on a cosmic journey as we uncover the pivotal role Python plays in expanding our knowledge of the final frontier."
  ),
  Blog(
    imageUrl: 'assets/images/blog3.jpeg',
    name: 'NASA Space Apps Challenge',
    author: john,
    liked: false,
    created_at: "1 week ago",
    content: 'In the thrilling realm of the NASA Space Apps Challenge, brilliant minds from across the globe unite to tackle cosmic conundrums. Teams harness cutting-edge technology, data, and creativity to solve real-world space exploration challenges. With teamwork as their launchpad, participants reach for the stars, pushing the boundaries of human innovation in the quest for a brighter cosmic future. Join the adventure and witness the limitless potential of human ingenuity!, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32'
  )
];