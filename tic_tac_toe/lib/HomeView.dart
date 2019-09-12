import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  List<String> locs;
  String message;
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage dot = AssetImage("images/edit.png");
  bool isCross = true;

  @override
  initState() {
    super.initState();
    this.locs = [
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty",
      "empty"
    ];
    this.message = "";
  }

  void resetButton() {
    setState(() {
      this.locs = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty"
      ];
      this.message = "";
    });
  }

  void playGame(int index) {
    if (locs[index] == "empty") {
      setState(() {
        if (isCross == true) {
          locs[index] = "cross";
        } else {
          locs[index] = "circle";
        }
        isCross = !isCross;
        whoWon();
      });
    }
  }

  AssetImage getImage(String val) {
    switch (val) {
      case 'cross':
        return cross;
        break;
      case 'circle':
        return circle;
        break;
      case 'empty':
        return dot;
        break;
    }
  }

  whoWon() {
    if ((this.locs[0] != "empty") &&
        (this.locs[0] == this.locs[1]) &&
        (this.locs[1] == this.locs[2])) {
      //locs[0] wins
      setState(() {
        this.message = "${locs[0]} wins!";
      });
    } else if ((this.locs[3] != "empty") &&
        (this.locs[3] == this.locs[4]) &&
        (this.locs[4] == this.locs[5])) {
      //locs[3] wins
      setState(() {
        this.message = "${locs[3]} wins!";
      });
    } else if ((this.locs[6] != "empty") &&
        (this.locs[6] == this.locs[7]) &&
        (this.locs[7] == this.locs[8])) {
      //locs[6] wins
      setState(() {
        this.message = "${locs[6]} wins!";
      });
    } else if ((this.locs[0] != "empty") &&
        (this.locs[0] == this.locs[3]) &&
        (this.locs[3] == this.locs[6])) {
      //locs[0] wins
      setState(() {
        this.message = "${locs[0]} wins!";
      });
    } else if ((this.locs[1] != "empty") &&
        (this.locs[1] == this.locs[4]) &&
        (this.locs[4] == this.locs[7])) {
      //locs[1] wins
      setState(() {
        this.message = "${locs[1]} wins!";
      });
    } else if ((this.locs[2] != "empty") &&
        (this.locs[2] == this.locs[5]) &&
        (this.locs[5] == this.locs[8])) {
      //locs[2] wins
      setState(() {
        this.message = "${locs[2]} wins!";
      });
    } else if ((this.locs[0] != "empty") &&
        (this.locs[0] == this.locs[4]) &&
        (this.locs[4] == this.locs[8])) {
      //locs[0] wins
      setState(() {
        this.message = "${locs[0]} wins!";
      });
    } else if ((this.locs[2] != "empty") &&
        (this.locs[2] == this.locs[4]) &&
        (this.locs[4] == this.locs[6])) {
      //locs[2] wins
      setState(() {
        this.message = "${locs[2]} wins!";
      });
    } else if (!this.locs.contains("empty")) {
      setState(() {
        this.message = "Game Draw";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: GridView.builder(
                padding: EdgeInsets.all(5.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: MaterialButton(
                      onPressed: () {
                        playGame(index);
                      },
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 0.2),
                          ),
                          child: GridTile(
                            child: Image(
                              image: getImage(this.locs[index]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: this.locs.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: MaterialButton(
                onPressed: resetButton,
                child: Text(
                  "Reset",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                minWidth: 150,
                height: 50,
                color: Colors.pink,
                highlightElevation: 20.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


