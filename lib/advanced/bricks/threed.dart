import 'package:flutter/material.dart';

class Icon3DFb13 extends StatelessWidget {
  const Icon3DFb13({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url =
        "https://www.brainline.org/sites/all/modules/custom/bl_brain/images/brain-lateral.png";
    const imageButton = Image(
      image: NetworkImage(
          "https://www.brainline.org/sites/all/modules/custom/bl_brain/images/brain-lateral.png"),
      fit: BoxFit.cover,
    );
    return Image.network(
      url,
      fit: BoxFit.cover,
    );
  }
}
