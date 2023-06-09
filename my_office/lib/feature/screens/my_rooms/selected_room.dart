import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_office/feature/constants/theme.dart';
import 'package:my_office/service/repositories.dart';

bool isLoad = true;

class SelectedRoom extends StatefulWidget {
  final String barTitle;
  final String roomId;
  const SelectedRoom({super.key, required this.roomId, required this.barTitle});

  @override
  State<SelectedRoom> createState() => _SelectedRoomState();
}

class _SelectedRoomState extends State<SelectedRoom> {
  List<XFile> selectedImages = []; // List to store the selected images
  late ImageRepository repository;
  List<Map<String, dynamic>> _images = [];
  bool _isLoading = false;

  Future<void> pickImages() async {
    List<XFile>? selectedFiles = await ImagePicker().pickMultiImage();
    setState(() {
      selectedImages = selectedFiles;
      repository = ImageRepository();
      fetchImages();
    });
  }

  // List<dynamic> _data = [];

  @override
  void initState() {
    repository = ImageRepository();
    fetchImages();
    super.initState();
    // _getData();
  }

  Future<void> fetchImages() async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<Map<String, dynamic>> images = await repository.fetchImages();
      setState(() {
        _images = images;
      });
    } catch (e) {
      print('Error: $e');
      // Handle the exception or display an error message
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
  // Future<void> _getData() async {
  //   final response =
  //       await http.get(Uri.parse('https://fakestoreapi.com/products'));
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       _data = json.decode(response.body);
  //       isLoad = false;
  //     });
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: SelectedRoomAppBar(widget: widget),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // height: 500,
        // color: Colors.red,
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.92,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Өрөөний мэдээлэл', style: TextStyles.black17),
                    Text(
                      'Дэлгэрэнгүй',
                      style: TextStyle(color: Colors.blue, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                // height: 520,
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                    // color: AppColors.mainColor,
                    border: Border.all(color: AppColors.mainColor, width: 5),
                    borderRadius: BorderRadius.circular(15)),
                child: const Column(
                  children: [
                    MyRoomWidget(
                      text: 'Төлөв',
                      text2: 'Түрээслэгдсэн',
                    ),
                    MyRoomWidget(
                      text: 'Барилгын нэр',
                      text2: 'Union building',
                    ),
                    MyRoomWidget(
                      text: 'Тоот',
                      text2: '804',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.92,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Зургууд', style: TextStyles.black17),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          width: MediaQuery.of(context).size.width * 0.955,
                          child: _isLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ListView.builder(
                                  itemCount: _images.length,
                                  itemBuilder: (context, index) {
                                    final isFirstItem = index == 0;
                                    final image = _images[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.15,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                1,
                                            decoration: BoxDecoration(
                                              // border: Border.all(
                                              //     width: 0, color: AppColors.mainColor),
                                              borderRadius: isFirstItem
                                                  ? const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(12),
                                                      topRight:
                                                          Radius.circular(12))
                                                  : null,
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(image['name'],
                                                            style: TextStyles
                                                                .black14semibold),
                                                        Text(
                                                            'Төрөл : ${image['description']}'),
                                                        Text(
                                                            'Тоо ширхэг : ${image['quantity']}'),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount: image.length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                            child: Image.network(
                                                                'https://ub-office.mn/${image['url']}'),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10.0),
                                                      child: InkWell(
                                                        onTap: pickImages,
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.08,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            color: AppColors
                                                                .greyBack,
                                                          ),
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons.add,
                                                              size: 35,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  height: 0.4,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: Container(
                                                  height: 0.4,
                                                  color: AppColors.mainColor,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectedRoomAppBar extends StatelessWidget {
  const SelectedRoomAppBar({
    super.key,
    required this.widget,
  });

  final SelectedRoom widget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.barTitle,
        style: TextStyles.white17,
      ),
      backgroundColor: AppColors.mainColor,
      elevation: 0,
      leadingWidth: 70,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          // height: 55,
          width: 60,
          decoration: BoxDecoration(
            // color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.arrow_back_ios,
                // color: AppColors.secondBlack,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LineGreen extends StatelessWidget {
  const LineGreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      color: AppColors.mainColor,
    );
  }
}

class MyRoomWidget extends StatefulWidget {
  final String text;

  final String text2;
  const MyRoomWidget({super.key, required this.text, required this.text2});

  @override
  State<MyRoomWidget> createState() => _MyRoomWidgetState();
}

class _MyRoomWidgetState extends State<MyRoomWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // border: Border.all(width: 3, color: AppColors.mainColor),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: Text(
                  widget.text,
                  style: TextStyles.white17,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                widget.text2,
                style: TextStyles.black17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
