import 'package:flutter/material.dart';
import 'package:autitrack/model/educatorModel.dart';
import 'package:autitrack/screen/addFeedPage.dart';
import 'package:autitrack/widgets/feedContainerBoth.dart';
import '../constants/constants.dart';
import '../model/feedModel.dart';
import '../services/databaseServices.dart';
import 'educatorProfilePage.dart';
import 'moodPage.dart';


class MainFeedPageEdu extends StatefulWidget {
  final String? currentUserId;


  const MainFeedPageEdu({required this.currentUserId});

  @override
  _MainFeedPageEduState createState() => _MainFeedPageEduState();
}

class _MainFeedPageEduState extends State<MainFeedPageEdu> {
  List _followingFeeds = [];
  bool _loading = false;

  buildFeeds(Feed feed, EducatorModel edu) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: FeedContainerBoth(
        feed: feed,
        edu: edu,
        currentUserId: widget.currentUserId,
        users: [],
      ),
    );
  }

  showFeeds(String? currentUserId) {
    List<Widget> followingFeedsList = [];
    for (Feed feed in _followingFeeds) {
      followingFeedsList.add(FutureBuilder(
          future: eduRef.doc(feed.authorId).get(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              EducatorModel author = EducatorModel.fromDoc(snapshot.data);
              author.id = feed.authorId;
              return buildFeeds(feed, author);
            } else {
              return SizedBox.shrink();
            }
          }));
    }
    return followingFeedsList;
  }


  setupFollowingFeeds() async {
    setState(() {
      _loading = true;
    });
    List followingFeeds =
    await DatabaseServices.getUserFeeds(widget.currentUserId);
    if (mounted) {
      setState(() {
        _followingFeeds = followingFeeds;
        _loading = false;
      });
    }
  }


  @override
  void initState() {
    super.initState();
    setupFollowingFeeds();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddFeedPage(
                        currentUserId: widget.currentUserId,
                      )));
        }, child: const Icon(Icons.add),

      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.mood), // You can replace 'mood' with the appropriate emotion icon.
          onPressed: () {
            // Navigate to the mood page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MoodPage(currentUserId: '',), // Replace 'MoodPage' with the actual page you want to navigate to.
              ),
            );
          },
        ),
        title: Text(
          'Feeds',
          style: TextStyle(
            color: AutiTrackColor,
          ),
        ),  actions: [
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            // Navigate to the profile page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EducatorProfilePage(
                  userId: widget.currentUserId, currentUserId: '',
                ),
              ),
            );
          },
        ),
      ],
      ),
      body: RefreshIndicator(
        onRefresh: () => setupFollowingFeeds(),
        child: ListView(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            _loading ? LinearProgressIndicator() : SizedBox.shrink(),
            SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 5),
                Column(
                  children: _followingFeeds.isEmpty && _loading == false
                      ? [
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        'There is No New Tweets',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    )
                  ]
                      : showFeeds(widget.currentUserId),
                ),

              ],
            )
          ],

        ),

      ),
    );
  }
}