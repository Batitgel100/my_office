import 'package:flutter/material.dart';

import '../constants/theme.dart';

class AdvertiseItem extends StatelessWidget {
  final Advertise advertise;
  const AdvertiseItem({
    Key? key,
    required this.advertise,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(advertise.thumbnail),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(164, 63, 162, 157),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class Advertise {
  final int id;
  final String title;
  final String thumbnail;
  Advertise(this.id, this.title, this.thumbnail);
}

List<Advertise> advertiseList = [
  Advertise(1, 'title',
      'https://fastly.picsum.photos/id/101/2621/1747.jpg?hmac=cu15YGotS0gIYdBbR1he5NtBLZAAY6aIY5AbORRAngs'),
  Advertise(2, 'title',
      'https://fastly.picsum.photos/id/122/4147/2756.jpg?hmac=-B_1uAvYufznhjeA9xSSAJjqt07XrVzDWCf5VDNX0pQ'),
  Advertise(3, 'title',
      'https://fastly.picsum.photos/id/116/3504/2336.jpg?hmac=C46vgpj3R407e8pCyy8NhIsNaBZCjb4r5d71keNgMJY'),
  Advertise(4, 'title',
      'https://fastly.picsum.photos/id/133/2742/1828.jpg?hmac=0X5o8bHUICkOIvZHtykCRL50Bjn1N8w1AvkenF7n93E'),
];

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: isActive ? 35 : 10,
        height: 10,
        decoration: BoxDecoration(
          color: isActive ? AppColors.mainColor : Colors.grey,
          borderRadius: BorderRadius.circular(60),
        ),
      ),
    );
  }
}
