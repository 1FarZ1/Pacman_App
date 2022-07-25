import 'dart:async';
import 'dart:io';
import 'package:fgame/models/ghost.dart';
import 'package:fgame/models/path.dart';
import 'package:fgame/models/pixel.dart';
import 'package:fgame/models/player.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:restart_app/restart_app.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Data  for map and initial data
  int numberInRow = 12;
  bool MouthClosed = false;
  static int Squares = 216;
  int score = 0;
  bool start = true;
  String BigText = "Pac Man";
  // our starting cord
  String direction = "right";
  int player = 193;
  // our ghosts

  Ghost ghost1 = Ghost("assets/green.png", 20);
  Ghost ghost2 = Ghost("assets/yellow.png", 14);
  Ghost ghost3 = Ghost("assets/red.png", 74);

  List<Ghost> Ghosts = [
    Ghost("assets/green.png", 20),
    Ghost("assets/yellow.png", 14),
    Ghost("assets/red.png", 74)
  ];

// our List data;
// will implement this later using random numbers
  List GhostsP = [20, 14, 74];
  List<int> Food = [];
  List<int> br = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    24,
    36,
    48,
    60,
    72,
    84,
    120,
    132,
    23,
    35,
    47,
    59,
    71,
    83,
    95,
    26,
    38,
    50,
    67,
    85,
    86,
    87,
    88,
    91,
    92,
    93,
    94,
    79,
    33,
    45,
    57,
    40,
    41,
    42,
    28,
    62,
    69,
    76,
    64,
    43,
    31,
    131,
    144,
    156,
    168,
    180,
    192,
    204,
    205,
    206,
    207,
    208,
    209,
    210,
    211,
    212,
    213,
    214,
    130,
    129,
    128,
    127,
    124,
    123,
    122,
    121,
    136,
    148,
    139,
    151,
    153,
    165,
    177,
    189,
    146,
    158,
    179,
    182,
    170,
    172,
    173,
    174,
    175,
    187,
    184,
    143,
    155,
    167,
    179,
    191,
    203,
    215
  ];

  // our methodes
  int getRandomNumber() {
    var rng = Random();
    var i = rng.nextInt(Food.length);
    return Food[i];
  }

  void StartGame() {
    if (start) {
      Timer.periodic(Duration(milliseconds: 300), (timer) {
        print(GhostsP);
        MouthClosed = !MouthClosed;
        Ghostmove();
        if (Food.contains(player)) {
          setState(() {
            Food.remove(player);
            score++;
          });
        }
        if (GhostsP.contains(player)) {
          timer.cancel();
          setState(() {
            BigText = "Game Over!";
          });

          start = false;
        }

        switch (direction) {
          case "right":
            setState(() {
              if (!(br.contains(player + 1))) {
                player++;
              }
            });
            break;
          case "left":
            setState(() {
              if (!br.contains(player - 1)) {
                player--;
              }
            });
            break;
          case "up":
            setState(() {
              if (!(br.contains(player - 12))) {
                player = player - 12;
              }
            });
            break;
          case "down":
            setState(() {
              if (!(br.contains(player + 12))) {
                player = player + 12;
              }
            });
            break;
        }
      });
    }
  }

  //implemnting this later
  void ResetGame() {
    Phoenix.rebirth(context);
  }

  void Ghostmove() {
    for (int i = 0; i < GhostsP.length; i++) {
      var rng = Random();
      int x = rng.nextInt(5);
      // this is a bad automation for the ghost will implement this later
      switch (x % 5) {
        case 0:
          if (!br.contains(GhostsP[i] + 1)) {
            setState(() {
              GhostsP[i] = GhostsP[i] + 1;
            });
          }

          break;
        case 1:
          if (!br.contains(GhostsP[i] - 12)) {
            setState(() {
              GhostsP[i] = GhostsP[i] - 12;
            });
          }

          break;
        case 2:
          if (!br.contains(GhostsP[i] + 12)) {
            setState(() {
              GhostsP[i] = GhostsP[i] + 12;
            });
          }

          break;
        case 3:
          if (!br.contains(GhostsP[i] - 1)) {
            setState(() {
              GhostsP[i] = GhostsP[i] - 1;
            });
          }
          break;
        case 4:
          if (!br.contains(GhostsP[i] - 12)) {
            setState(() {
              GhostsP[i] = GhostsP[i] - 12;
            });
          }
          break;
      }
    }
  }

  Widget FindChild(int index) {
    if (index == player) {
      if (MouthClosed) {
        return Padding(
          padding: const EdgeInsets.all(4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(color: Colors.amber),
          ),
        );
      }

      switch (direction) {
        case "right":
          return Player("assets/5a1887148d421802430d2d04.png");

        case "left":
          return Transform.rotate(
              angle: pi, child: Player("assets/5a1887148d421802430d2d04.png"));

        case 'up':
          return Transform.rotate(
              angle: 3 * pi / 2,
              child: Player("assets/5a1887148d421802430d2d04.png"));

        case 'down':
          return Transform.rotate(
              angle: pi / 2,
              child: Player("assets/5a1887148d421802430d2d04.png"));
        default:
          return Container();
      }
    } else if (GhostsP.contains(index)) {
      // return ghosts[Ghosts.indexOf(index).toString()][1];
      return Ghosts[GhostsP.indexOf(index)];
    } else if (br.contains(index)) {
      return MyPixel(
        Color.fromARGB(255, 0, 13, 153),
        Color.fromARGB(255, 2, 12, 118),
      );
    } else if (Food.contains(index)) {
      return Path(
        Color.fromARGB(255, 0, 0, 0),
        Colors.yellow,

        // Text(index.toString(),style:TextStyle(color:Colors.white)),
      );
    } else {
      return Container();
    }
  }

  void getFood() {
    for (int i = 0; i < Squares; i++) {
      if (!br.contains(i)) {
        Food.add(i);
      }
    }
  }

  @override
  void initState() {
    getFood();
    super.initState();
    print(Food);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(BigText,
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 30,
                  fontWeight: FontWeight.w800)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: [
            Icon(Icons.menu),
          ],
          actionsIconTheme: IconThemeData(
            color: Colors.yellow,
            size: 40,
          ),
        ),
        backgroundColor: Colors.black,
        body: Column(children: [
          Expanded(
              flex: 6,
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.delta.dy > 0) {
                    direction = 'down';
                  } else {
                    direction = 'up';
                  }
                },
                onHorizontalDragUpdate: (details) {
                  if (details.delta.dx > 0) {
                    direction = 'right';
                  } else {
                    direction = 'left';
                  }
                },
                child: AbsorbPointer(
                  child: Container(
                    child: GridView.builder(
                      itemCount: Squares,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: numberInRow,
                      ),
                      itemBuilder: (BuildContext ctx, int index) {
                        return FindChild(index);
                      },
                    ),
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        StartGame();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Text("Play",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 25)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ResetGame();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Text("Reset",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontSize: 25)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 250, 249, 247),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 3),
                      child: Text("Score : ${score}",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w900,
                              fontSize: 25)),
                    ),
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}
