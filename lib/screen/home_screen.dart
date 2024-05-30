import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StoryArea(),
          FeedList()
        ]
    
      ),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(10, (index) => UserStory(userName: 'User $index',))
      ),
    );
  }
}

class UserStory extends StatelessWidget {

  final String userName;

  const UserStory({
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
      child: Column(
       children: [
           Container(
             width: 80,
             height: 80,
             margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
             decoration: BoxDecoration(
               color: Colors.blue.shade300,
               borderRadius: BorderRadius.circular(40)
             ),
           ),
         Text(userName),
       ],
                  ),
    );
  }
}

class FeedData {
  final String userName;
  final int likeCount;
  final String content;

  FeedData({required this.userName, required this.likeCount, required this.content});

}


final feedDataList = [
  FeedData(userName: 'User1', likeCount: 50, content: '오늘 점심은 카레지만 많이 없었다. 그래도 다먹었다.'),
  FeedData(userName: 'User2', likeCount: 44, content: '오늘 점심은 김밥'),
  FeedData(userName: 'User3', likeCount: 3, content: '오늘 점심은 만두'),
  FeedData(userName: 'User4', likeCount: 2, content: '오늘 점심은 케이크'),
  FeedData(userName: 'User5', likeCount: 5666, content: '오늘 점심은 짬뽕'),
  FeedData(userName: 'User6', likeCount: 133, content: '오늘 점심은 불고기'),
  FeedData(userName: 'User7', likeCount: 23, content: '오늘 점심은 집밥'),
  FeedData(userName: 'User8', likeCount: 45, content: '오늘 점심은 돈까스'),
  FeedData(userName: 'User9', likeCount: 0, content: '오늘 점심은 냉면'),
  FeedData(userName: 'User10', likeCount: 6, content: '오늘 점심은 호박죽'),
];




class FeedList extends StatelessWidget {
  const FeedList({super.key});



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: feedDataList.length,
      itemBuilder:(context,index) =>  FeedItem( feedData: feedDataList[index], ));
  }
}


class FeedItem extends StatelessWidget {
  final FeedData feedData;
  const FeedItem({super.key, required this.feedData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue.shade300,
                    ),
                  ),
                  SizedBox(width: 8,),
                  Text(feedData.userName),
                ],
              ),
              Icon(Icons.more_vert)
            ],
          ),
        ),


        Container(
          width: double.infinity,
          height: 400,
          color: Colors.indigo.shade50,
        ),
         SizedBox(height: 5,),
         Padding(
              padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: () {},
                          icon: Icon(Icons.favorite_outline)),
                      IconButton(onPressed: () {},
                          icon: Icon(CupertinoIcons.chat_bubble)),
                      IconButton(onPressed: () {},
                          icon: Icon(CupertinoIcons.paperplane))
                    ],
                  ),
                  IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bookmark))
                ],
              ),

            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 12),
              child: Text('좋아요 ${feedData.likeCount}개',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 14),
              child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: feedData.userName, style: TextStyle(fontWeight: FontWeight.bold)),
                      WidgetSpan(
                        child: SizedBox(
                          width: 10,
                        ),
                      ),
                      TextSpan(text: feedData.content,),

                    ],
                style: TextStyle(color: Colors.black),
              )),
            ),
        const SizedBox(height: 8,)


      ]
    );
  }
}



