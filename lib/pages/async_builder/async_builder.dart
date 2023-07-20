import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nil/nil.dart';
import 'package:otc/widgets/ui_button.dart';
import 'package:otc/widgets/ui_empty_view.dart';

class AsyncBuilder<T> extends StatefulWidget {
  final Widget Function(BuildContext context, T data) builder;
  final Future<T> Function() future;
  final bool showLoadingView;
  final bool showErrorView;
  final Widget? loadingView;
  final Widget? errorView;

  const AsyncBuilder({
    super.key,
    required this.future,
    this.showErrorView = true,
    this.showLoadingView = true,
    this.errorView,
    this.loadingView,
    required this.builder,
  });

  @override
  State<AsyncBuilder> createState() => _AsyncBuilderState<T>();
}

class _AsyncBuilderState<T> extends State<AsyncBuilder<T>> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: Future(
        () async {
          return widget.future();
        },
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.active:
            return widget.showLoadingView
                ? widget.loadingView ??
                    const SizedBox(
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    )
                : const Nil();
          case ConnectionState.none:
          default:
            if (snapshot.hasError) {
              if (!widget.showErrorView) return const Nil();
              return widget.errorView ??
                  UiEmptyView(
                    icon: const Icon(
                      Icons.sentiment_dissatisfied_rounded,
                      size: 108,
                      color: Colors.red,
                    ),
                    title: "数据获取失败",
                    subtitle: "网络连接不稳定或服务器错误，请稍后再试",
                    actions: [
                      UiButton(
                        label: "点击重试",
                        onPressed: () {
                          setState(() {});
                        },
                      )
                    ],
                  );
            } else {
              //正常数据返回回调
              return widget.builder(context, snapshot.data as dynamic);
            }
        }
      },
    );
  }
}
