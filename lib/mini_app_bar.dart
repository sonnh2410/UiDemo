import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MiniAppBar extends StatefulWidget {
  const MiniAppBar({Key? key}) : super(key: key);

  @override
  State<MiniAppBar> createState() => _MiniAppBarState();
}

class _MiniAppBarState extends State<MiniAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.pinkAccent,
            leading: Column(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
                const SizedBox(height: 12)
              ],
            ),
            flexibleSpace: Column(
              children: [
                const Spacer(),
                Row(
                  children: const [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "AhaMart",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
            actions: [
              Column(
                children: [
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(20),
                        color: Colors.black.withOpacity(0.3),
                        shape: BoxShape.circle),
                    padding: EdgeInsets.all(5),
                    child: const Icon(Icons.qr_code_outlined,
                        color: Colors.white, size: 16),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black.withOpacity(0.3)),
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 2,
                        ),
                        SvgPicture.asset(
                          'assets/icons/more.svg',
                          width: 16,
                          height: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        const SizedBox(
                          height: 15,
                          child: VerticalDivider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            'assets/icons/close.svg',
                            width: 16,
                            height: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
              const SizedBox(
                width: 24,
              ),
            ],
            centerTitle: true,
          ),
        ],
      ),
    );
  }
}
