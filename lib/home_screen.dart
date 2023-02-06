import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.0, 1.5),
    end: const Offset(0.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.decelerate,
  ));
  late final Animation<Offset> _searchAnimation = Tween<Offset>(
    begin: const Offset(0.3, 0.0),
    end: const Offset(0.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.decelerate,
  ));
  late final Animation<Offset> _notiAnimation = Tween<Offset>(
    begin: const Offset(-0.3, 0.0),
    end: const Offset(0.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.decelerate,
  ));
  TextEditingController txtController = TextEditingController();
  ScrollController scrollController = ScrollController();
  bool typeAppBar = false;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.offset >= 300) {
        if (typeAppBar == false) {
          typeAppBar = true;
          _controller.reset();
          _controller.forward();
        }
      } else {
        typeAppBar = false;
      }

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            typeAppBar
                ? SliverAppBar(
                    pinned: true,
                    backgroundColor: Colors.pinkAccent,
                    flexibleSpace: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 8,
                          ),
                          SlideTransition(
                            position: _searchAnimation,
                            child: const Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          SlideTransition(
                            position: _offsetAnimation,
                            child: const Icon(
                              Icons.wallet,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          SlideTransition(
                            position: _offsetAnimation,
                            child: const Icon(
                              Icons.shield,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          SlideTransition(
                            position: _offsetAnimation,
                            child: const Icon(
                              Icons.wallet_giftcard,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          SlideTransition(
                            position: _offsetAnimation,
                            child: const Icon(
                              Icons.qr_code,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          SlideTransition(
                            position: _offsetAnimation,
                            child: const Icon(
                              Icons.document_scanner_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          SlideTransition(
                            position: _notiAnimation,
                            child: const Icon(
                              Icons.notification_important,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('assets/image/img.jpg'))),
                            height: 30,
                            width: 30,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                  )
                : SliverAppBar(
                    pinned: true,
                    backgroundColor: Colors.pinkAccent,
                    flexibleSpace: Center(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black.withOpacity(0.6)),
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Icon(Icons.search,
                                      color: Colors.white, size: 20),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  DefaultTextStyle(
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'Bobbers',
                                    ),
                                    child: AnimatedTextKit(
                                      isRepeatingAnimation: true,
                                      repeatForever: true,
                                      animatedTexts: [
                                        TyperAnimatedText(
                                            'It is not enough to do your best,'),
                                        TyperAnimatedText(
                                            'you must know what to do,'),
                                        TyperAnimatedText(
                                            'and then do your best'),
                                        TyperAnimatedText('W.Edwards Deming'),
                                      ],
                                      onTap: () {
                                        print("Tap Event");
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black.withOpacity(0.6)),
                              padding: const EdgeInsets.all(5),
                              child: const Icon(
                                Icons.notification_add,
                                color: Colors.white,
                              )),
                          const SizedBox(
                            width: 12,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('assets/image/img.jpg'))),
                            height: 30,
                            width: 30,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                        ],
                      ),
                    ),
                    centerTitle: true,
                  ),
            SliverToBoxAdapter(
              child: Container(
                height: 300,
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 500,
                color: Colors.blue.withOpacity(0.5),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 500,
                color: Colors.green.withOpacity(0.5),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 500,
                color: Colors.black.withOpacity(0.5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
