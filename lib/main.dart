import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final dGreen = const Color(0xFF54D3C2);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotels Booking',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SearchSection(),
            HotelSection(),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Color(0xFF424242),
          size: 20,
        ),
        onPressed: () {},
      ),
      title: Text(
        'Explore',
        style: GoogleFonts.nunito(
          fontSize: 22,
          color: Colors.black,
          fontWeight: FontWeight.w800,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.favorite_outline_rounded,
            color: Color(0xFF424242),
            size: 20,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.place,
            color: Color(0xFF424242),
            size: 20,
          ),
          onPressed: () {},
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 19, 78, 125),
      padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 4,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for hotels',
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 0.5,
                      offset: Offset(0, 1),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: dGreen,
                    padding: const EdgeInsets.all(10),
                  ),
                  child: const Icon(
                    Icons.search,
                    size: 26,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose date',
                      style: GoogleFonts.nunito(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '22 Dec - 28 Dec',
                      style: GoogleFonts.nunito(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Number of Rooms',
                      style: GoogleFonts.nunito(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '1 Room - 2 Adults',
                      style: GoogleFonts.nunito(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HotelSection extends StatelessWidget {
  HotelSection({Key? key}) : super(key: key);

  final List hotelList = [
    {
      'title': 'Bhutan Hotel',
      'location': 'Thimphu, Bhutan',
      'distance': 2.5,
      'reviews': 4.5,
      'picture': 'images/bali2.png',
      'price': 200,
    },
    {
      'title': 'Bali Hotel',
      'location': 'Kuta, Bali',
      'distance': 3.5,
      'reviews': 4.8,
      'picture': 'images/bali3.png',
      'price': 300,
    },
    {
      'title': 'Dubai Hotel',
      'location': 'Dubai, UAE',
      'distance': 5.5,
      'reviews': 4.9,
      'picture': 'images/bali4.png',
      'price': 400,
    },
    {
      'title': 'Paris Hotel',
      'location': 'Paris, France',
      'distance': 6.5,
      'reviews': 4.7,
      'picture': 'images/bali5.png',
      'price': 500,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '550 hotels found',
                  style: GoogleFonts.nunito(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Filters',
                      style: GoogleFonts.nunito(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.filter_list_outlined,
                        color: dGreen,
                        size: 25,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: hotelList.map((hotel) {
              return HotelCard(hotel);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class HotelCard extends StatefulWidget {
  final Map hotelData;
  const HotelCard(this.hotelData, {super.key});

  @override
  _HotelCardState createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 19, 78, 125),
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 4,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 135,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              color: Colors.red,
              image: DecorationImage(
                image: AssetImage(widget.hotelData['picture']),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  right: -15,
                  child: MaterialButton(
                    color: Colors.white,
                    shape: const CircleBorder(),
                    onPressed: () {},
                    child: Icon(
                      Icons.favorite_outline_rounded,
                      color: dGreen,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.hotelData['title'],
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${widget.hotelData['price']}',
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'per night',
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Icon(Icons.place, color: dGreen, size: 14),
                const SizedBox(width: 4), // İkon ve metin arasına boşluk ekler
                Text(
                  widget.hotelData['location'],
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  '/ ${widget.hotelData['distance']} km to city',
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 3, 10, 0),
            child: Row(
              children: [
                Row(
                  children: List.generate(5, (index) {
                    if (index < widget.hotelData['reviews']) {
                      return Icon(
                        Icons.star,
                        color: dGreen,
                        size: 14,
                      );
                    } else {
                      return const Icon(
                        Icons.star,
                        color: Colors.grey,
                        size: 14,
                      );
                    }
                  }),
                ),
                const SizedBox(width: 20),
                const SizedBox(width: 4),
                Text(
                  '${widget.hotelData['reviews']} reviews',
                  style: GoogleFonts.nunito(
                    fontSize: 11,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
