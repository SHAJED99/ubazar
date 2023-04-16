import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  final bool enable;
  final double? height;
  final double? width;
  final Duration duration;
  final double? iconHeight;
  final BoxConstraints? constraints;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final Future<bool?>? Function()? onTap;
  final Function(bool? isSuccess)? onDone;
  final Widget? child;
  final Widget? onRunningWidget;
  final Widget? onSuccessWidget;
  final Widget? onErrorWidget;
  final bool expanded;
  final MainAxisAlignment mainAxisAlignment;
  final Duration statusShowingDuration;
  final Color? backgroundColor;
  final Color iconColor;
  const CustomElevatedButton({
    super.key,
    this.height = 48,
    this.iconHeight,
    this.width,
    this.constraints,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    this.onTap,
    this.child,
    this.onRunningWidget,
    this.expanded = false,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.onSuccessWidget,
    this.onErrorWidget,
    this.statusShowingDuration = const Duration(seconds: 2),
    this.onDone,
    this.backgroundColor,
    this.iconColor = Colors.white,
    this.enable = true,
    this.duration = const Duration(milliseconds: 150),
  });

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  ButtonStatus isRunning = ButtonStatus.stable;
  bool? result;

  Widget child(Widget c) {
    return Expanded(
      child: Container(
        padding: widget.iconHeight == null ? widget.contentPadding : null,
        child: SizedBox(
          height: widget.iconHeight,
          child: AspectRatio(
            aspectRatio: 1,
            child: FittedBox(
              child: c,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: widget.duration,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: widget.borderRadius),
        child: Material(
          color: widget.backgroundColor ?? Theme.of(context).primaryColor,
          child: InkWell(
            onTap: () async {
              if (!widget.enable) return;
              if (isRunning != ButtonStatus.stable) return;
              if (mounted) setState(() => isRunning = ButtonStatus.running);
              if (widget.onTap != null) {
                result = await widget.onTap!();
                if (result != null) {
                  if (result! && mounted) setState(() => isRunning = ButtonStatus.success);
                  if (!result! && mounted) setState(() => isRunning = ButtonStatus.error);
                  await Future.delayed(widget.statusShowingDuration);
                }
              }
              if (widget.onDone != null) widget.onDone!(result);
              if (mounted) setState(() => isRunning = ButtonStatus.stable);
            },
            child: Container(
              alignment: widget.expanded ? Alignment.center : null,
              padding: widget.contentPadding,
              height: widget.height,
              width: widget.width,
              constraints: widget.constraints,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isRunning == ButtonStatus.running)
                    child(widget.onRunningWidget ?? CircularProgressIndicator(color: widget.iconColor))
                  else if (isRunning == ButtonStatus.success)
                    child(widget.onSuccessWidget ?? Icon(Icons.done, color: widget.iconColor))
                  else if (isRunning == ButtonStatus.error)
                    child(widget.onErrorWidget ?? Icon(Icons.error, color: widget.iconColor))
                  else
                    widget.child ?? Container()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum ButtonStatus { stable, running, success, error }
