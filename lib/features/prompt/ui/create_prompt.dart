import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:stability_image_generation/stability_image_generation.dart';
import 'package:text_to_image/constants/colors.dart';

import '../../theme/theme_provider.dart';

class CreatePromptScreen extends StatefulWidget {
  const CreatePromptScreen({Key? key}) : super(key: key);

  @override
  State<CreatePromptScreen> createState() => _CreatePromptScreenState();
}

class _CreatePromptScreenState extends State<CreatePromptScreen> {

  TextEditingController controller = TextEditingController();
  // String stability_ApiKey = 'sk-hWHoLrLE7LCGmgLPozIGd5xDFz2GMakctV7Pp0vn73iBSRBo';
  String stability_ApiKey = 'sk-0d2w6R5g8DzRxqV5ljkDUZCDy2Q2h6ibefCYBH2D6FeRVLdd';
  final StabilityAI _ai = StabilityAI();
  final ImageAIStyle imageAIStyle = ImageAIStyle.noStyle;
  bool run = false;

  Future<Uint8List> _generate(String query) async {
    /// Call the generateImage method with the required parameters.
    Uint8List image = await _ai.generateImage(
      apiKey: stability_ApiKey,
      imageAIStyle: imageAIStyle,
      prompt: query,
    );
    return image;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('Generate Images 🚀'),
        ),
        titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
          fontSize: 25
        ),
        // centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                // color: Theme.of(context).colorScheme.secondary,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.4),
                    blurRadius: 5,
                    offset: const Offset(0, 0),
                    spreadRadius: 1,
                  )
                ],
              ),
              child: CupertinoSwitch(
                value: Provider.of<ThemeProvider>(context, listen: false).isDark,
                onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
                trackColor: Theme.of(context).colorScheme.secondary,
                thumbColor: Theme.of(context).colorScheme.inversePrimary,
                activeColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
          )
        ],
      ),

      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              // color: Colors.red,
              height: 640,
              width: screenWidth,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  // color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
              ),
              child: run ?
              FutureBuilder<Uint8List>(
                /// Call the [_generate] function to get the image data.
                future: _generate(controller.text),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    /// While waiting for the image data, display a loading indicator.
                    return const Center(
                      child: CircularProgressIndicator(color: tdRed, ),
                    );
                  } else if (snapshot.hasError) {
                    /// If an error occurred while getting the image data, display an error message.
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    /// If the image data is available, display the image using Image.memory().
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.memory(snapshot.data!),
                    );
                  } else {
                    /// If no data is available, display a placeholder or an empty container.
                    return Container();
                  }
                },
              ) :
              Image.asset('assets/images/Hello_AI.png', fit: BoxFit.contain, filterQuality: FilterQuality.high,)
            )
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(5.0),
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.4),
                    blurRadius: 5,
                    offset: const Offset(0, 0),
                    spreadRadius: 4,
                  )
                ]
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      // autofocus: true,
                        cursorColor: tdRed,
                        // cursorHeight: 8,
                        // cursorWidth: 22,
                        // cursorRadius: const Radius.circular(50),
                        // textAlignVertical: TextAlignVertical.bottom,
                        maxLines: 3,
                        minLines: 1,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              // color: Colors.red
                            )
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Theme.of(context).scaffoldBackgroundColor
                                // color: Colors.red
                              )
                          ),
                          fillColor: Theme.of(context).colorScheme.secondary,
                          filled: true,
                          hintText: 'Enter you prompt',
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
                            fontSize: 20,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.tertiary
                            )
                          )
                        )
                    ),
                  ),

                  const SizedBox(width: 10,),

                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: tdGreen
                    ),
                    // margin: const EdgeInsets.only(right: 20),
                    child: IconButton(
                        onPressed: (){
                          FocusScope.of(context).unfocus();
                          String query = controller.text;
                          if (query.isNotEmpty) {
                            /// If the user input is not empty, set [run] to true to generate the image.
                            setState(() {
                              run = true;
                            });
                          } else {
                            /// If the user input is empty, print an error message.
                            if (kDebugMode) {
                              print('Query is empty !!');
                            }
                          }
                        },
                        icon: const Icon(Icons.send)
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
