import 'package:destini/storyBrain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Destini',
      home: DestiniGame(),
    ),
  );
}

class DestiniGame extends StatefulWidget {
  const DestiniGame({Key? key}) : super(key: key);

  @override
  State<DestiniGame> createState() => _DestiniGameState();
}

class _DestiniGameState extends State<DestiniGame> {
  StoryBrain storyBrain = StoryBrain();

  bool isVisible = true;

  void nextStory(int choiceNumber) {
    setState(() {
      if (storyBrain.storyNumber == 0) {
        if (choiceNumber == 1) {
          storyBrain.storyNumber = 2;
        } else {
          storyBrain.storyNumber = 1;
        }
      } else if (storyBrain.storyNumber == 1) {
        if (choiceNumber == 1) {
          storyBrain.storyNumber = 2;
        } else {
          storyBrain.storyNumber = 3;
          isVisible = false;
        }
      } else if (storyBrain.storyNumber == 2) {
        if (choiceNumber == 1) {
          storyBrain.storyNumber = 5;
          isVisible = false;
        } else {
          storyBrain.storyNumber = 4;
          isVisible = false;
        }
      } else if (storyBrain.storyNumber > 2) {
        print('Game over');
        storyBrain.storyNumber = 0;
        isVisible = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                child: ElevatedButton(
                  onPressed: () {
                    nextStory(1);
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text(
                    storyBrain.getChoice1(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
              width: 100,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                child: Visibility(
                  visible: isVisible,
                  child: ElevatedButton(
                    onPressed: () {
                      nextStory(2);
                    },
                    child: Text(
                      storyBrain.getChoice2(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
