import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastNotification {
  static Future success({
    required String title,
    required String text,
  }) async {
    return toastification.show(
      title: Text(title, style: TextStyle(fontSize: 13, overflow: TextOverflow.ellipsis)),
      description: Text(text, style: TextStyle(fontSize: 13, overflow: TextOverflow.ellipsis)),
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.topCenter,
      showProgressBar: false,
      direction: TextDirection.ltr,
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
    );
  }

  static Future error({
    required String title,
    required String text,
  }) async {
    return toastification.show(
      title: Text(title, style: TextStyle(fontSize: 13, overflow: TextOverflow.ellipsis)),
      description: Text(text, style: TextStyle(fontSize: 13, overflow: TextOverflow.ellipsis)),
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.topCenter,
      direction: TextDirection.ltr,
      showProgressBar: false,
      closeOnClick: false,
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
    );
  }

  static Future info({
    required String title,
    required String text,
  }) async {
    return toastification.show(
      title: Text(title, style: TextStyle(fontSize: 13, overflow: TextOverflow.ellipsis)),
      description: Text(text, style: TextStyle(fontSize: 13, overflow: TextOverflow.ellipsis)),
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.topCenter,
      direction: TextDirection.ltr,
      showProgressBar: false,
      type: ToastificationType.info,
      style: ToastificationStyle.fillColored,
    );
  }

  static Future CustomError({
    required String text,
  }) async {
    return toastification.showCustom(
      // context: context, // optional if you use ToastificationWrapper
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.topCenter,
      builder: (BuildContext context, ToastificationItem holder) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.red,
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.transparent),
                  child: Center(
                      child: Text(
                        'X',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ))),
              SizedBox(width: 10),
              Flexible(
                child: Text(text, maxLines: 2, style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future CustomSuccess({
    required String text,
  }) async {
    return toastification.showCustom(
      // context: context, // optional if you use ToastificationWrapper
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.topCenter,
      builder: (BuildContext context, ToastificationItem holder) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.green.withOpacity(0.9),
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.transparent),
                  child: Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 10,
                      ))),
              SizedBox(width: 10),
              Flexible(
                child: Text(text, maxLines: 2, style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future CustomInfo({
    required String text,
  }) async {
    return toastification.showCustom(
      // context: context, // optional if you use ToastificationWrapper
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.topCenter,
      builder: (BuildContext context, ToastificationItem holder) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.orange.withOpacity(0.9),
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.transparent),
                  child: Center(
                      child: Text(
                        'i',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ))),
              SizedBox(width: 10),
              Flexible(
                child: Text(text, maxLines: 2, style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ],
          ),
        );
      },
    );
  }
}
