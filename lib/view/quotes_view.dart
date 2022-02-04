import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes/main.dart';
import 'package:share_plus/share_plus.dart';

class ViewQuotes extends StatefulWidget {
  int? id;
  String name;

  ViewQuotes({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  _ViewQuotesState createState() => _ViewQuotesState();
}

class _ViewQuotesState extends State<ViewQuotes> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void getQuotes() {
    for (int i = 0; i < dbHelper.quotes.length; i++) {
      if (dbHelper.quotes[i]['category_id'] == widget.id) {
        quotes.add(dbHelper.quotes[i]);
      }
    }
    setState(() {});
  }

  ValueNotifier<bool> likeQuotes = ValueNotifier(false);

  List quotes = [];

  @override
  void initState() {
    getQuotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        key: _scaffoldKey,
        elevation: 0.0,
        backgroundColor: const Color(0xffF6CED5),
        centerTitle: true,
        title: Text(
          widget.name,
          style: GoogleFonts.satisfy(
              color: Colors.black, fontWeight: FontWeight.w700),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 30,
            )),
      ),
      body: quotes.isEmpty
          ? const CircularProgressIndicator()
          : Stack(
              children: [
                Image.asset(
                  'assets/images/homepage.jpg',
                  height: h,
                  width: w,
                  fit: BoxFit.cover,
                ),
                ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: quotes.length,
                    itemBuilder: (context, v) {
                      return Column(
                        children: [
                          Card(
                            elevation: 5.0,
                            shadowColor: Colors.purple,
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              height: h * 0.25,
                              width: w,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                border:
                                    Border.all(color: Colors.pink, width: 2),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Stack(
                                  children: [
                                    Text(
                                      "${quotes[v]['quote']}",
                                      style: GoogleFonts.changa(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0.0,
                                      left: 0.0,
                                      right: 0.0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ValueListenableBuilder(
                                              valueListenable: likeQuotes,
                                              builder: (context, a, c) {
                                                return  likeQuotes.value ==  true ? Row(
                                                  children: [
                                                    const Icon(
                                                        CupertinoIcons.heart_fill,color: Colors.pink,),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Like",
                                                      style:
                                                      GoogleFonts.changa(
                                                        color: Colors.black,
                                                        fontSize: 18.0,
                                                      ),
                                                    ),
                                                  ],
                                                ) : GestureDetector(
                                                  onTap: () {
                                     likeQuotes.value =  true;
                                                    dbHelper.insertDataIntoDB(
                                                        quotes[v]['_id'],
                                                        quotes[v]['quote']);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                          CupertinoIcons.heart),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        "Like",
                                                        style:
                                                            GoogleFonts.changa(
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                          GestureDetector(
                                            onTap: () {
                                              Clipboard.setData(ClipboardData(
                                                  text: quotes[v]['quote']));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text("Copied"),
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                ),
                                              );
                                            },
                                            child: Row(
                                              children: [
                                                const Icon(CupertinoIcons
                                                    .doc_on_clipboard),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Copy",
                                                  style: GoogleFonts.changa(
                                                    color: Colors.black,
                                                    fontSize: 18.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Share.share(
                                                  '${quotes[v]['quote']}');
                                            },
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.share,
                                                  size: 25,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Share",
                                                  style: GoogleFonts.changa(
                                                    color: Colors.black,
                                                    fontSize: 18.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      );
                    }),
              ],
            ),
    );
  }
}
