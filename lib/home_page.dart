import 'package:flutter/material.dart';
import 'package:music_app/components/bottom_sheet.dart';
import 'package:music_app/components/category_tile.dart';
import 'package:music_app/components/community_component.dart';
import 'package:music_app/components/myImage.dart';
import 'package:music_app/components/person_tile.dart';
import 'package:music_app/components/search_button.dart';
import 'package:readmore/readmore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMuted = false;
  final bool _showCommunityComponent = true;
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset > 150 && !_isScrolled) {
      setState(() {
        _isScrolled = true;
      });
    } else if (_scrollController.offset <= 150 && _isScrolled) {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                backgroundColor: const Color.fromARGB(255, 167, 23, 12),
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding:
                      const EdgeInsets.only(left: 50, bottom: 8, top: 8),
                  title: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: AnimatedOpacity(
                          opacity: _isScrolled ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: const CircleAvatar(
                            backgroundImage: AssetImage(
                              'lib/assets/image.png',
                            ),
                            radius: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Padding(
                        padding: EdgeInsets.only(left: _isScrolled ? 50 : 0),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'The weeknd',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Proxima Nova',
                              ),
                            ),
                            Text(
                              'Community • +11K Members',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  background: Image.asset(
                    'lib/assets/weeknd.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => BottomSheetComponent(),
                      );
                    },
                  ),
                ],
              ),
            ];
          },
          body: CustomScrollView(
            slivers: [
              if (_showCommunityComponent)
                SliverPersistentHeader(
                  delegate: _CommunityComponentDelegate(),
                  pinned: false,
                ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: ReadMoreText(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        colorClickableText: Colors.red,
                        trimCollapsedText: 'Read more',
                        trimMode: TrimMode.Line,
                        trimLines: 4,
                        style: TextStyle(
                          fontFamily: 'Proxima Nova',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CategoryTile(text: 'Outdoor'),
                        CategoryTile(text: 'Outdoor'),
                        CategoryTile(text: 'Outdoor'),
                        CategoryTile(text: 'Outdoor'),
                        CategoryTile(text: '+1'),
                      ],
                    ),
                    const ListTile(
                      title: Text(
                        'Media, docs and links',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const MyImage();
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        'Mute Notification',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: Switch(
                        value: isMuted,
                        onChanged: (bool value) {
                          setState(() {
                            isMuted = value;
                          });
                        },
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.delete_outline,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Clear chat',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.lock_outline,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Encryption',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.exit_to_app,
                        color: Colors.red,
                      ),
                      title: Text(
                        'Exit community',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.thumb_down_alt_outlined,
                        color: Colors.red,
                      ),
                      title: Text(
                        'Report',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SearchButton(),
                    ListView.builder(
                      itemCount: 20,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return const PersonTile();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CommunityComponentDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const CommunityComponent();
  }

  @override
  double get maxExtent => 75.0;

  @override
  double get minExtent => 75.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
