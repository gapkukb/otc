part of layout;

class SideBarItem {
  final IconData? icon;
  final Widget? iconWidget;
  final String? label;
  final Widget? labelWidget;
  final Widget? trailing;
  final VoidCallback? onTap;
  final String path;
  final String? pathname;

  const SideBarItem({
    this.icon,
    this.iconWidget,
    this.label,
    this.labelWidget,
    this.trailing,
    this.onTap,
    this.pathname,
    required this.path,
  });
}
