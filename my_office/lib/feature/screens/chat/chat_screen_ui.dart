import 'package:flutter/material.dart';
import 'package:my_office/feature/constants/theme.dart';
import 'package:my_office/feature/screens/chat/conversation_screen_ui.dart';
import 'package:my_office/feature/screens/chat/model/chatModel.dart';

class ChatScreenUI extends StatelessWidget {
  const ChatScreenUI({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Зурвас',
          style: TextStyles.white17,
        ),
        elevation: 0,
        backgroundColor: AppColors.mainColor,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_horiz), onPressed: () {}),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.only(topLeft: ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
          child: ListView.builder(
            itemCount: dummyData.length,
            itemBuilder: (context, i) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConversationScreen(
                            profilePic: dummyData[i].avatarUrl,
                            username: dummyData[i].name,
                            online: dummyData[i].online,
                            time: dummyData[i].time,
                          ),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        dummyData[i].avatarUrl,
                      ),
                      radius: 26,
                      child: dummyData[i].online
                          ? Container(
                              margin:
                                  const EdgeInsets.only(bottom: 40, right: 40),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Container(),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          dummyData[i].name,
                          style: TextStyles.black17semibold,
                        ),
                        Text(
                          dummyData[i].time,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            if (dummyData[i].seen) const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                dummyData[i].message,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            if (!dummyData[i].seen)
                              Container(
                                height: 25,
                                width: 25,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 252, 98, 87),
                                  shape: BoxShape.circle,
                                ),
                                child: const Align(
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(
                                Icons.done_all,
                                size: 18,
                                color: Colors.blue[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                  indent: 70,
                  endIndent: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
