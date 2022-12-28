import 'package:flutter/material.dart';
import 'package:news_app/models/webview/webview_screen.dart';

Widget buildArticle(article, context) {
  return InkWell(
    onTap: () {
      navigatorTo(
        context,
        WebScreen(
          url: '${article['url']}',
          title: '${article['title']}',
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "${article['urlToImage']}",
                ),
              ),
            ),
            height: 120.0,
            width: 120.0,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${article['title']}",
                  maxLines: 3,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "${article['publishedAt']}",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget articleLine() {
  return Container(
    margin: const EdgeInsets.fromLTRB(7, 0, 7, 0),
    width: double.infinity,
    height: 1.0,
    color: Colors.grey,
  );
}

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  Text? label,
  required Function validatorFunction,
}) {
  return TextFormField(
    keyboardType: type,
    controller: controller,
    validator: validatorFunction(),
    decoration: InputDecoration(
      label: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
    ),
  );
}

void navigatorTo(context, widget) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ));
}

Widget textFieldBuilder({
  bool readOnly = false,
  bool showCursor = false,
  required TextEditingController? controller,
  TextInputType type = TextInputType.text,
  required String? label,
  bool isPassword = false,
  required Icon? prefixIcon,
  Icon? suffixIcon,
  double borderRadius = 5.0,
  required String? Function(String?)? validator,
  void Function()? onTap,
  void Function(String)? onSubmit,
  void Function(String)? onChange,
}) {
  return TextFormField(
    cursorColor: Colors.deepOrange,
    readOnly: readOnly,
    onChanged: onChange,
    showCursor: showCursor,
    controller: controller,
    keyboardType: type,
    onFieldSubmitted: onSubmit,
    onTap: onTap,
    validator: validator,
    obscureText: isPassword,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    ),
  );
}
