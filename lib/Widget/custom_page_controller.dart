import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/foundation.dart' show precisionErrorTolerance;

class CustomPageController extends ScrollController {
  CustomPageController({
    this.initialCustomPage = 0,
    this.keepCustomPage = true,
    this.viewportFraction = 1.0,
  })  : assert(initialCustomPage != null),
        assert(keepCustomPage != null),
        assert(viewportFraction != null),
        assert(viewportFraction > 0.0);

  final int initialCustomPage;

  final bool keepCustomPage;

  final double viewportFraction;

  double get page {
    assert(
      positions.isNotEmpty,
      'CustomPageController.page cannot be accessed before a CustomPageView is built with it.',
    );
    assert(
      positions.length == 1,
      'The page property cannot be read when multiple CustomPageViews are attached to '
      'the same CustomPageController.',
    );
    final _CustomPagePosition position = this.position as _CustomPagePosition;
    return position.page;
  }

  Future<void> animateToCustomPage(
    int page, {
    @required Duration duration,
    @required Curve curve,
  }) {
    final _CustomPagePosition position = this.position as _CustomPagePosition;
    return position.animateTo(
      position.getPixelsFromCustomPage(page.toDouble()),
      duration: duration,
      curve: curve,
    );
  }

  void jumpToCustomPage(int page) {
    final _CustomPagePosition position = this.position as _CustomPagePosition;
    position.jumpTo(position.getPixelsFromCustomPage(page.toDouble()));
  }

  Future<void> nextCustomPage(
      {@required Duration duration, @required Curve curve}) {
    return animateToCustomPage(page.round() + 1,
        duration: duration, curve: curve);
  }

  Future<void> previousCustomPage(
      {@required Duration duration, @required Curve curve}) {
    return animateToCustomPage(page.round() - 1,
        duration: duration, curve: curve);
  }

  @override
  ScrollPosition createScrollPosition(ScrollPhysics physics,
      ScrollContext context, ScrollPosition oldPosition) {
    return _CustomPagePosition(
      physics: physics,
      context: context,
      initialCustomPage: initialCustomPage,
      keepCustomPage: keepCustomPage,
      viewportFraction: viewportFraction,
      oldPosition: oldPosition,
    );
  }

  @override
  void attach(ScrollPosition position) {
    super.attach(position);
    final _CustomPagePosition pagePosition = position as _CustomPagePosition;
    pagePosition.viewportFraction = viewportFraction;
  }
}

class CustomPageMetrics extends FixedScrollMetrics {
  CustomPageMetrics({
    @required double minScrollExtent,
    @required double maxScrollExtent,
    @required double pixels,
    @required double viewportDimension,
    @required AxisDirection axisDirection,
    @required this.viewportFraction,
  }) : super(
          minScrollExtent: minScrollExtent,
          maxScrollExtent: maxScrollExtent,
          pixels: pixels,
          viewportDimension: viewportDimension,
          axisDirection: axisDirection,
        );

  @override
  CustomPageMetrics copyWith({
    double minScrollExtent,
    double maxScrollExtent,
    double pixels,
    double viewportDimension,
    AxisDirection axisDirection,
    double viewportFraction,
  }) {
    return CustomPageMetrics(
      minScrollExtent: minScrollExtent ?? this.minScrollExtent,
      maxScrollExtent: maxScrollExtent ?? this.maxScrollExtent,
      pixels: pixels ?? this.pixels,
      viewportDimension: viewportDimension ?? this.viewportDimension,
      axisDirection: axisDirection ?? this.axisDirection,
      viewportFraction: viewportFraction ?? this.viewportFraction,
    );
  }

  double get page {
    return math.max(0.0, pixels.clamp(minScrollExtent, maxScrollExtent)) /
        math.max(1.0, viewportDimension * viewportFraction);
  }

  final double viewportFraction;
}

class _CustomPagePosition extends ScrollPositionWithSingleContext
    implements CustomPageMetrics {
  _CustomPagePosition({
    ScrollPhysics physics,
    ScrollContext context,
    this.initialCustomPage = 0,
    bool keepCustomPage = true,
    double viewportFraction = 1.0,
    ScrollPosition oldPosition,
  })  : assert(initialCustomPage != null),
        assert(keepCustomPage != null),
        assert(viewportFraction != null),
        assert(viewportFraction > 0.0),
        _viewportFraction = viewportFraction,
        _pageToUseOnStartup = initialCustomPage.toDouble(),
        super(
          physics: physics,
          context: context,
          initialPixels: null,
          keepScrollOffset: keepCustomPage,
          oldPosition: oldPosition,
        );

  final int initialCustomPage;
  double _pageToUseOnStartup;

  @override
  double get viewportFraction => _viewportFraction;
  double _viewportFraction;
  set viewportFraction(double value) {
    if (_viewportFraction == value) return;
    final double oldCustomPage = page;
    _viewportFraction = value;
    if (oldCustomPage != null)
      forcePixels(getPixelsFromCustomPage(oldCustomPage));
  }

  double get _initialCustomPageOffset =>
      math.max(0, viewportDimension * (viewportFraction + 1) / 2);

  double getCustomPageFromPixels(double pixels, double viewportDimension) {
    
    final double actual = math.max(0.0, pixels - _initialCustomPageOffset) /
        math.max(1.0, viewportDimension * viewportFraction);
    final double round = actual.roundToDouble();
    if ((actual - round).abs() < precisionErrorTolerance) {
      return round;
    }
    return actual;
  }

  double getPixelsFromCustomPage(double page) {
    return page * viewportDimension * viewportFraction +
        _initialCustomPageOffset;
  }

  @override
  double get page {
    assert(
      pixels == null || (minScrollExtent != null && maxScrollExtent != null),
      'CustomPage value is only available after content dimensions are established.',
    );
    return pixels == null
        ? null
        : getCustomPageFromPixels(
            pixels.clamp(minScrollExtent, maxScrollExtent) as double,
            viewportDimension);
  }

  @override
  void saveScrollOffset() {
    PageStorage.of(context.storageContext)?.writeState(context.storageContext,
        getCustomPageFromPixels(pixels, viewportDimension));
  }

  @override
  void restoreScrollOffset() {
    if (pixels == null) {
      final double value = PageStorage.of(context.storageContext)
          ?.readState(context.storageContext) as double;
      if (value != null) _pageToUseOnStartup = value;
    }
  }

  @override
  bool applyViewportDimension(double viewportDimension) {
    final double oldViewportDimensions = this.viewportDimension;
    final bool result = super.applyViewportDimension(viewportDimension);
    final double oldPixels = pixels;
    final double page = (oldPixels == null || oldViewportDimensions == 0.0)
        ? _pageToUseOnStartup
        : getCustomPageFromPixels(oldPixels, oldViewportDimensions);
    final double newPixels = getPixelsFromCustomPage(page);

    if (newPixels != oldPixels) {
      correctPixels(newPixels);
      return false;
    }
    return result;
  }

  @override
  bool applyContentDimensions(double minScrollExtent, double maxScrollExtent) {
    final double newMinScrollExtent =
        minScrollExtent + _initialCustomPageOffset;
    return super.applyContentDimensions(
      newMinScrollExtent,
      math.max(newMinScrollExtent, maxScrollExtent - _initialCustomPageOffset),
    );
  }

  @override
  CustomPageMetrics copyWith({
    double minScrollExtent,
    double maxScrollExtent,
    double pixels,
    double viewportDimension,
    AxisDirection axisDirection,
    double viewportFraction,
  }) {
    return CustomPageMetrics(
      minScrollExtent: minScrollExtent ?? this.minScrollExtent,
      maxScrollExtent: maxScrollExtent ?? this.maxScrollExtent,
      pixels: pixels ?? this.pixels,
      viewportDimension: viewportDimension ?? this.viewportDimension,
      axisDirection: axisDirection ?? this.axisDirection,
      viewportFraction: viewportFraction ?? this.viewportFraction,
    );
  }
}

class _ForceImplicitScrollPhysics extends ScrollPhysics {
  const _ForceImplicitScrollPhysics({
    @required this.allowImplicitScrolling,
    ScrollPhysics parent,
  })  : assert(allowImplicitScrolling != null),
        super(parent: parent);

  @override
  _ForceImplicitScrollPhysics applyTo(ScrollPhysics ancestor) {
    return _ForceImplicitScrollPhysics(
      allowImplicitScrolling: allowImplicitScrolling,
      parent: buildParent(ancestor),
    );
  }

  @override
  final bool allowImplicitScrolling;
}

class CustomPageScrollPhysics extends ScrollPhysics {
  const CustomPageScrollPhysics({ScrollPhysics parent}) : super(parent: parent);

  @override
  CustomPageScrollPhysics applyTo(ScrollPhysics ancestor) {
    return CustomPageScrollPhysics(parent: buildParent(ancestor));
  }

  double _getCustomPage(ScrollMetrics position) {
    if (position is _CustomPagePosition) return position.page;
    return position.pixels / position.viewportDimension;
  }

  double _getPixels(ScrollMetrics position, double page) {
    if (position is _CustomPagePosition)
      return position.getPixelsFromCustomPage(page);
    return page * position.viewportDimension;
  }

  double _getTargetPixels(
      ScrollMetrics position, Tolerance tolerance, double velocity) {
    double page = _getCustomPage(position);
    if (velocity < -tolerance.velocity)
      page -= 0.5;
    else if (velocity > tolerance.velocity) page += 0.5;
    return _getPixels(position, page.roundToDouble());
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity) {
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent))
      return super.createBallisticSimulation(position, velocity);
    final Tolerance tolerance = this.tolerance;
    final double target = _getTargetPixels(position, tolerance, velocity);
    if (target != position.pixels)
      return ScrollSpringSimulation(spring, position.pixels, target, velocity,
          tolerance: tolerance);
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}

final CustomPageController _defaultCustomPageController =
    CustomPageController();
const CustomPageScrollPhysics _kCustomPagePhysics = CustomPageScrollPhysics();

class CustomPageView extends StatefulWidget {
  CustomPageView({
    Key key,
    this.scrollDirection = Axis.horizontal,
    this.reverse = false,
    CustomPageController controller,
    this.physics,
    this.pageSnapping = true,
    this.onCustomPageChanged,
    List<Widget> children = const <Widget>[],
    this.dragStartBehavior = DragStartBehavior.start,
    this.allowImplicitScrolling = false,
  })  : assert(allowImplicitScrolling != null),
        controller = controller ?? _defaultCustomPageController,
        childrenDelegate = SliverChildListDelegate(children),
        super(key: key);

  CustomPageView.builder({
    Key key,
    this.scrollDirection = Axis.horizontal,
    this.reverse = false,
    CustomPageController controller,
    this.physics,
    this.pageSnapping = true,
    this.onCustomPageChanged,
    @required IndexedWidgetBuilder itemBuilder,
    int itemCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.allowImplicitScrolling = false,
  })  : assert(allowImplicitScrolling != null),
        controller = controller ?? _defaultCustomPageController,
        childrenDelegate =
            SliverChildBuilderDelegate(itemBuilder, childCount: itemCount),
        super(key: key);

  CustomPageView.custom({
    Key key,
    this.scrollDirection = Axis.horizontal,
    this.reverse = false,
    CustomPageController controller,
    this.physics,
    this.pageSnapping = true,
    this.onCustomPageChanged,
    @required this.childrenDelegate,
    this.dragStartBehavior = DragStartBehavior.start,
    this.allowImplicitScrolling = false,
  })  : assert(childrenDelegate != null),
        assert(allowImplicitScrolling != null),
        controller = controller ?? _defaultCustomPageController,
        super(key: key);

  final bool allowImplicitScrolling;

  final Axis scrollDirection;

  final bool reverse;

  final CustomPageController controller;

  final ScrollPhysics physics;

  final bool pageSnapping;

  final ValueChanged<int> onCustomPageChanged;

  final SliverChildDelegate childrenDelegate;

  final DragStartBehavior dragStartBehavior;

  @override
  _CustomPageViewState createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  int _lastReportedCustomPage = 0;

  @override
  void initState() {
    super.initState();
    _lastReportedCustomPage = widget.controller.initialCustomPage;
  }

  AxisDirection _getDirection(BuildContext context) {
    switch (widget.scrollDirection) {
      case Axis.horizontal:
        assert(debugCheckHasDirectionality(context));
        final TextDirection textDirection = Directionality.of(context);
        final AxisDirection axisDirection =
            textDirectionToAxisDirection(textDirection);
        return widget.reverse
            ? flipAxisDirection(axisDirection)
            : axisDirection;
      case Axis.vertical:
        return widget.reverse ? AxisDirection.up : AxisDirection.down;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final AxisDirection axisDirection = _getDirection(context);
    final ScrollPhysics physics = _ForceImplicitScrollPhysics(
      allowImplicitScrolling: widget.allowImplicitScrolling,
    ).applyTo(widget.pageSnapping
        ? _kCustomPagePhysics.applyTo(widget.physics)
        : widget.physics);

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification.depth == 0 &&
            widget.onCustomPageChanged != null &&
            notification is ScrollUpdateNotification) {
          final CustomPageMetrics metrics =
              notification.metrics as CustomPageMetrics;
          final int currentCustomPage = metrics.page.round();
          if (currentCustomPage != _lastReportedCustomPage) {
            _lastReportedCustomPage = currentCustomPage;
            widget.onCustomPageChanged(currentCustomPage);
          }
        }
        return false;
      },
      child: Scrollable(
        dragStartBehavior: widget.dragStartBehavior,
        axisDirection: axisDirection,
        controller: widget.controller,
        physics: physics,
        viewportBuilder: (BuildContext context, ViewportOffset position) {
          return Viewport(
            cacheExtent: widget.allowImplicitScrolling ? 1.0 : 0.0,
            cacheExtentStyle: CacheExtentStyle.viewport,
            axisDirection: axisDirection,
            offset: position,
            slivers: <Widget>[
              SliverFillViewport(
                viewportFraction: widget.controller.viewportFraction,
                delegate: widget.childrenDelegate,
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description
        .add(EnumProperty<Axis>('scrollDirection', widget.scrollDirection));
    description.add(
        FlagProperty('reverse', value: widget.reverse, ifTrue: 'reversed'));
    description.add(DiagnosticsProperty<CustomPageController>(
        'controller', widget.controller,
        showName: false));
    description.add(DiagnosticsProperty<ScrollPhysics>(
        'physics', widget.physics,
        showName: false));
    description.add(FlagProperty('pageSnapping',
        value: widget.pageSnapping, ifFalse: 'snapping disabled'));
    description.add(FlagProperty('allowImplicitScrolling',
        value: widget.allowImplicitScrolling,
        ifTrue: 'allow implicit scrolling'));
  }
}
