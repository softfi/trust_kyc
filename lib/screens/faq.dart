import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_bar.dart';
import '../utils/images.dart';
// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';

class FAQs extends StatefulWidget {
  FAQs({Key? key}) : super(key: key);

  @override
  State<FAQs> createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> with SingleTickerProviderStateMixin{
Rx<Icon> tileIcon=Icon(Icons.add).obs;

  List data = [
    [
      "Why should one invest in fixed income securities?",
      "While many investments provide some form of income, fixed income securities tend to offer fixed and the most reliable cash streams; these are rated by credit rating agencies, allowing investors to choose bonds from financially stable issuers. A diversified bond portfolio can provide decent yield with a lower level of volatility than equities or any other asset classes. Fixed income securities at maturity provide investors with the principal amount they had invested in addition to the interest they have received."
    ],
    [
      "What is a bond?",
      "Stability of principal : One advantage of investing in fixed income securities is peace of mind that comes from capital preservation. Investors benefit by investing in fixed income securities as they preserve and increase their invested capital. Generates a steady and regular income stream : Fixed income securities provide investors with a steady stream of income, For example, by investing Rs. 1,00,000/- in bond with 12% annual coupon rate, the investor has the assurance to get Rs. 12,000 directly in the bank account on yearly basis till the maturity of the bond. High priority claims to assets : Fixed income investors get benefit from their position in the capital structure of an entity (issuer) issuing both equity and debt investments. Investors in bonds of a corporation have a higher priority over common and preferred stockholders of the same entity (issuer). Nullify market volatility : The price of debt securities displays a very lower average volatility as compared to the price of equity or mutual funds and ensures the greater safety of the investment. Zero credit risk : Investors can neutralize the default risk on their investments by investing in government securities, which are normally referred to as risk-free investments due to the sovereign guarantee on these instruments. Efficient portfolio diversification : Fixed income securities enable efficient portfolio diversification and thus assist in portfolio risk mitigation."
    ],
    [
      "What is a maturity date?",
      "A bond is a fixed income instrument that represents a loan made by an investor (bond holder) to a borrower (bond issuer). Governments, corporates, banks, and municipalities issue bonds when they need capital. Bonds traditionally pay a fixed interest rate (coupon) to the debtholders along with the principal amount at maturity."
    ],
    [
      "What is a coupon rate?",
      "A bond pays interest periodically and repays the principal at a stated time, known as maturity."
          "What is the difference between yield to maturity (YTM) and current yield (CY)?",
      "Coupon rate is the periodic rate of interest paid by bond issuers to their purchasers. The coupon rate is calculated on the bond’s face value (or par value), not on the issue price or market value. For example, if you have a 10-year- Rs 2,000 bond with a coupon rate of 10%, you will get Rs 200 every year for 10 years, no matter what happens to the bond price in the market."
    ],
    [
      "What is the taxation aspect of bonds?",
      "Yield to maturity (YTM) is the total return anticipated on a bond if the bond is held until it matures. In other words, it is the internal rate of return (IRR) of an investment in a bond if the investor holds the bond until maturity. Current yield helps investors drill down on bonds that generate the greatest returns on investment each year, which is equal to an investment's annual income (coupon) divided by the current price of the bond."
    ],
    [
      "What is the difference between coupon rate and yield?",
      "The interest on bonds, except tax-free bonds, is taxable at the slab rates applicable to you. Any profit on sale/redemption will become taxable as long-term if the same is held for more than 36 months on the date of such sale/redemption whereas profits made on the sale of bonds shall be taxed as short-term, in case they have been held for 36 months or less, however in the case of the bonds which are listed on any stock exchange in India, the qualifying period is 12 months instead of 36 months."
    ],
    [
      "What is a call/put option?",
      "A coupon is the fixed interest rate paid to the bond holders, whereas a bond's yield refers to the expected earnings generated and realized on a fixed-income investment over a particular period of time, expressed as a percentage of interest rate."
    ],
    [
      "What do perpetual bonds mean?",
      "A bond option is a contract that gives an investor or issuer the right to buy or sell a bond by a particular date for a predetermined price. The call option allows the issuer the right to buy back the bond at a predetermined price at a certain time (call date) in the future, whereas a put option allows the holder right to demand early redemption at a predetermined price at a certain time (put date) in the future. The bond option can be used to protect an existing bond portfolio against adverse interest rate movements or to make a profit on favorable, short-term movements in prices."
    ],
    [
      "What type of fixed income instruments are available for investment?",
      "A perpetual bond is a bond with no fixed maturity date. While perpetual bonds can be understood to be debt obligations, the obligation here isn’t compulsory, this is owed to the fact that the debt isn’t required to be repaid by the issuer till they continue to make interest or coupon payments that are owed to those that hold perpetual bonds. Typically, these bonds are issued with call date and are callable at the predefined call date. The yield of a perpetual bond is therefore calculated up to the earliest call date."
    ]
  ];
late AnimationController _controller;


@override
  void initState() {
  _controller = AnimationController(duration:  Duration(milliseconds: 200), vsync: this);
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppToolbar.appBar(
          "FAQS",
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          IconButton(
            icon: Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: const Icon(Icons.person,
                    size: 20, color: Color(0xff00C6D8))),
            onPressed: () {},
          )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: const Image(
                image: AssetImage(
                  ConstantImage.faq,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "FAQs",
                style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                style: GoogleFonts.sourceSansPro(
                  textStyle: TextStyle(
                      color: Color(0xff22263D),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            list(),
            /* SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 170,
              color: Color(0xffFF0023),
              child: Text(
                  "*Get Full Content On Https://Trustsecurities.In/Faq.Php",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
            ),*/
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget list() {
    return ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12),
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  spreadRadius: 3,
                  blurRadius: 11,
                  offset: const Offset(0, 1),
                ),
              ], color: Colors.white),
              child: Theme(

                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: CustomExpansionTile(
                  onExpansionChanged: (a){
// tileIcon.value=Icon(Icons.minimize);
                  },
                  leading: fn(),
                  childrenPadding: EdgeInsets.symmetric(vertical: 0),
                  title: Text('${data[index][0]}',
                      style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      )),
                  controlAffinity: ListTileControlAffinity.leading,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: ListTile(
                          title: Text('${data[index][1]}',
                              style: GoogleFonts.sourceSansPro(
                                textStyle: const TextStyle(
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                ),
                              ))),
                    ),
                  ],
                ),
              ),
              /* ListTile(
                minLeadingWidth: 30,
                contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                dense: true,
                visualDensity:
                    const VisualDensity(vertical: -2, horizontal: -4),
                leading: const Icon(
                  Icons.add,
                  size: 20,
                  color: Color(0xffFF405A),
                ),
                title: Text(
                  "${data[index]}",
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),*/
            ),
          );
        });
  }



  fn() {
    // var controlIcon=AnimationController(duration: Duration(milliseconds: 200), vsync: this);
   return RotationTransition(
      turns:_controller,
      child:const Icon(Icons.add),
    );
  }
}




































const Duration _kExpand = Duration(milliseconds: 200);

/// A single-line [ListTile] with an expansion arrow icon that expands or collapses
/// the tile to reveal or hide the [children].
///
/// This widget is typically used with [ListView] to create an
/// "expand / collapse" list entry. When used with scrolling widgets like
/// [ListView], a unique [PageStorageKey] must be specified to enable the
/// [ExpansionTile] to save and restore its expanded state when it is scrolled
/// in and out of view.
///
/// This class overrides the [ListTileThemeData.iconColor] and [ListTileThemeData.textColor]
/// theme properties for its [ListTile]. These colors animate between values when
/// the tile is expanded and collapsed: between [iconColor], [collapsedIconColor] and
/// between [textColor] and [collapsedTextColor].
///
/// The expansion arrow icon is shown on the right by default in left-to-right languages
/// (i.e. the trailing edge). This can be changed using [controlAffinity]. This maps
/// to the [leading] and [trailing] properties of [ExpansionTile].
///
/// {@tool dartpad}
/// This example demonstrates different configurations of ExpansionTile.
///
/// ** See code in examples/api/lib/material/expansion_tile/expansion_tile.0.dart **
/// {@end-tool}
///
/// See also:
///
///  * [ListTile], useful for creating expansion tile [children] when the
///    expansion tile represents a sublist.
///  * The "Expand and collapse" section of
///    <https://material.io/components/lists#types>
class CustomExpansionTile extends StatefulWidget {
  /// Creates a single-line [ListTile] with an expansion arrow icon that expands or collapses
  /// the tile to reveal or hide the [children]. The [initiallyExpanded] property must
  /// be non-null.
  const CustomExpansionTile({
    Key? key,
    this.leading,
    required this.title,
    this.subtitle,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing,
    this.initiallyExpanded = false,
    this.maintainState = false,
    this.tilePadding,
    this.expandedCrossAxisAlignment,
    this.expandedAlignment,
    this.childrenPadding,
    this.backgroundColor,
    this.collapsedBackgroundColor,
    this.textColor,
    this.collapsedTextColor,
    this.iconColor,
    this.collapsedIconColor,
    this.controlAffinity,
  }) : assert(initiallyExpanded != null),
        assert(maintainState != null),
        assert(
        expandedCrossAxisAlignment != CrossAxisAlignment.baseline,
        'CrossAxisAlignment.baseline is not supported since the expanded children '
            'are aligned in a column, not a row. Try to use another constant.',
        ),
        super(key: key);

  /// A widget to display before the title.
  ///
  /// Typically a [CircleAvatar] widget.
  ///
  /// Note that depending on the value of [controlAffinity], the [leading] widget
  /// may replace the rotating expansion arrow icon.
  final Widget? leading;

  /// The primary content of the list item.
  ///
  /// Typically a [Text] widget.
  final Widget title;

  /// Additional content displayed below the title.
  ///
  /// Typically a [Text] widget.
  final Widget? subtitle;

  /// Called when the tile expands or collapses.
  ///
  /// When the tile starts expanding, this function is called with the value
  /// true. When the tile starts collapsing, this function is called with
  /// the value false.
  final ValueChanged<bool>? onExpansionChanged;

  /// The widgets that are displayed when the tile expands.
  ///
  /// Typically [ListTile] widgets.
  final List<Widget> children;

  /// The color to display behind the sublist when expanded.
  ///
  /// If this property is null then [ExpansionTileThemeData.backgroundColor] is used. If that
  /// is also null then Colors.transparent is used.
  ///
  /// See also:
  ///
  /// * [ExpansionTileTheme.of], which returns the nearest [ExpansionTileTheme]'s
  ///   [ExpansionTileThemeData].
  final Color? backgroundColor;

  /// When not null, defines the background color of tile when the sublist is collapsed.
  ///
  /// If this property is null then [ExpansionTileThemeData.collapsedBackgroundColor] is used.
  /// If that is also null then Colors.transparent is used.
  ///
  /// See also:
  ///
  /// * [ExpansionTileTheme.of], which returns the nearest [ExpansionTileTheme]'s
  ///   [ExpansionTileThemeData].
  final Color? collapsedBackgroundColor;

  /// A widget to display after the title.
  ///
  /// Note that depending on the value of [controlAffinity], the [trailing] widget
  /// may replace the rotating expansion arrow icon.
  final Widget? trailing;

  /// Specifies if the list tile is initially expanded (true) or collapsed (false, the default).
  final bool initiallyExpanded;

  /// Specifies whether the state of the children is maintained when the tile expands and collapses.
  ///
  /// When true, the children are kept in the tree while the tile is collapsed.
  /// When false (default), the children are removed from the tree when the tile is
  /// collapsed and recreated upon expansion.
  final bool maintainState;

  /// Specifies padding for the [ListTile].
  ///
  /// Analogous to [ListTile.contentPadding], this property defines the insets for
  /// the [leading], [title], [subtitle] and [trailing] widgets. It does not inset
  /// the expanded [children] widgets.
  ///
  /// If this property is null then [ExpansionTileThemeData.tilePadding] is used. If that
  /// is also null then the tile's padding is `EdgeInsets.symmetric(horizontal: 16.0)`.
  ///
  /// See also:
  ///
  /// * [ExpansionTileTheme.of], which returns the nearest [ExpansionTileTheme]'s
  ///   [ExpansionTileThemeData].
  final EdgeInsetsGeometry? tilePadding;

  /// Specifies the alignment of [children], which are arranged in a column when
  /// the tile is expanded.
  ///
  /// The internals of the expanded tile make use of a [Column] widget for
  /// [children], and [Align] widget to align the column. The `expandedAlignment`
  /// parameter is passed directly into the [Align].
  ///
  /// Modifying this property controls the alignment of the column within the
  /// expanded tile, not the alignment of [children] widgets within the column.
  /// To align each child within [children], see [expandedCrossAxisAlignment].
  ///
  /// The width of the column is the width of the widest child widget in [children].
  ///
  /// If this property is null then [ExpansionTileThemeData.expandedAlignment]is used. If that
  /// is also null then the value of `expandedAlignment` is [Alignment.center].
  ///
  /// See also:
  ///
  /// * [ExpansionTileTheme.of], which returns the nearest [ExpansionTileTheme]'s
  ///   [ExpansionTileThemeData].
  final Alignment? expandedAlignment;

  /// Specifies the alignment of each child within [children] when the tile is expanded.
  ///
  /// The internals of the expanded tile make use of a [Column] widget for
  /// [children], and the `crossAxisAlignment` parameter is passed directly into the [Column].
  ///
  /// Modifying this property controls the cross axis alignment of each child
  /// within its [Column]. Note that the width of the [Column] that houses
  /// [children] will be the same as the widest child widget in [children]. It is
  /// not necessarily the width of [Column] is equal to the width of expanded tile.
  ///
  /// To align the [Column] along the expanded tile, use the [expandedAlignment] property
  /// instead.
  ///
  /// When the value is null, the value of `expandedCrossAxisAlignment` is [CrossAxisAlignment.center].
  final CrossAxisAlignment? expandedCrossAxisAlignment;

  /// Specifies padding for [children].
  ///
  /// If this property is null then [ExpansionTileThemeData.childrenPadding] is used. If that
  /// is also null then the value of `childrenPadding` is [EdgeInsets.zero].
  ///
  /// See also:
  ///
  /// * [ExpansionTileTheme.of], which returns the nearest [ExpansionTileTheme]'s
  ///   [ExpansionTileThemeData].
  final EdgeInsetsGeometry? childrenPadding;

  /// The icon color of tile's expansion arrow icon when the sublist is expanded.
  ///
  /// Used to override to the [ListTileThemeData.iconColor].
  ///
  /// If this property is null then [ExpansionTileThemeData.iconColor] is used. If that
  /// is also null then the value of [ListTileThemeData.iconColor] is used.
  ///
  /// See also:
  ///
  /// * [ExpansionTileTheme.of], which returns the nearest [ExpansionTileTheme]'s
  ///   [ExpansionTileThemeData].
  final Color? iconColor;

  /// The icon color of tile's expansion arrow icon when the sublist is collapsed.
  ///
  /// Used to override to the [ListTileThemeData.iconColor].
  final Color? collapsedIconColor;


  /// The color of the tile's titles when the sublist is expanded.
  ///
  /// Used to override to the [ListTileThemeData.textColor].
  ///
  /// If this property is null then [ExpansionTileThemeData.textColor] is used. If that
  /// is also null then the value of [ListTileThemeData.textColor] is used.
  ///
  /// See also:
  ///
  /// * [ExpansionTileTheme.of], which returns the nearest [ExpansionTileTheme]'s
  ///   [ExpansionTileThemeData].
  final Color? textColor;

  /// The color of the tile's titles when the sublist is collapsed.
  ///
  /// Used to override to the [ListTileThemeData.textColor].
  ///
  /// If this property is null then [ExpansionTileThemeData.collapsedTextColor] is used. If that
  /// is also null then the value of [ListTileThemeData.textColor] is used.
  ///
  /// See also:
  ///
  /// * [ExpansionTileTheme.of], which returns the nearest [ExpansionTileTheme]'s
  ///   [ExpansionTileThemeData].
  final Color? collapsedTextColor;

  /// Typically used to force the expansion arrow icon to the tile's leading or trailing edge.
  ///
  /// By default, the value of `controlAffinity` is [ListTileControlAffinity.platform],
  /// which means that the expansion arrow icon will appear on the tile's trailing edge.
  final ListTileControlAffinity? controlAffinity;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween = CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween = Tween<double>(begin: 0.0, end: 0.5);

  final ColorTween _borderColorTween = ColorTween();
  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();
  final ColorTween _backgroundColorTween = ColorTween();

  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;
  late Animation<Color?> _borderColor;
  late Animation<Color?> _headerColor;
  late Animation<Color?> _iconColor;
  late Animation<Color?> _backgroundColor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _borderColor = _controller.drive(_borderColorTween.chain(_easeOutTween));
    _headerColor = _controller.drive(_headerColorTween.chain(_easeInTween));
    _iconColor = _controller.drive(_iconColorTween.chain(_easeInTween));
    _backgroundColor = _controller.drive(_backgroundColorTween.chain(_easeOutTween));

    _isExpanded = PageStorage.of(context)?.readState(context) as bool? ?? widget.initiallyExpanded;
    if (_isExpanded)
      _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted)
            return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    widget.onExpansionChanged?.call(_isExpanded);
  }

  // Platform or null affinity defaults to trailing.
  ListTileControlAffinity _effectiveAffinity(ListTileControlAffinity? affinity) {
    switch (affinity ?? ListTileControlAffinity.trailing) {
      case ListTileControlAffinity.leading:
        return ListTileControlAffinity.leading;
      case ListTileControlAffinity.trailing:
      case ListTileControlAffinity.platform:
        return ListTileControlAffinity.trailing;
    }
  }

  Widget? _buildIcon(BuildContext context ,bool isExp) {
    return RotationTransition(
      turns: _iconTurns,
      child:  (isExp)?Icon(Icons.minimize):Icon(Icons.add),
    );
  }

  Widget? _buildLeadingIcon(BuildContext context , bool isExp) {
    if (_effectiveAffinity(widget.controlAffinity) != ListTileControlAffinity.leading)
      return null;
    return _buildIcon(context , isExp);
  }

  Widget? _buildTrailingIcon(BuildContext context) {
    if (_effectiveAffinity(widget.controlAffinity) != ListTileControlAffinity.trailing)
      return null;
    return _buildIcon(context,_isExpanded);
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    final ExpansionTileThemeData expansionTileTheme = ExpansionTileTheme.of(context);
    final Color borderSideColor = _borderColor.value ?? Colors.transparent;

    return Container(
      decoration: BoxDecoration(
        color: _backgroundColor.value ?? expansionTileTheme.backgroundColor ?? Colors.transparent,
        border: Border(
          top: BorderSide(color: borderSideColor),
          bottom: BorderSide(color: borderSideColor),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTileTheme.merge(
            iconColor: _iconColor.value ?? expansionTileTheme.iconColor,
            textColor: _headerColor.value,
            child: ListTile(
              onTap: _handleTap,
              contentPadding: widget.tilePadding ?? expansionTileTheme.tilePadding,
              leading: (_isExpanded)?Icon(Icons.minimize):Icon(Icons.add),
              // leading: widget.leading ?? _buildLeadingIcon(context,_isExpanded),
              title: widget.title,
              subtitle: widget.subtitle,
              trailing: widget.trailing ?? _buildTrailingIcon(context),
            ),
          ),
          ClipRect(
            child: Align(
              alignment: widget.expandedAlignment
                  ?? expansionTileTheme.expandedAlignment
                  ?? Alignment.center,
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    final ExpansionTileThemeData expansionTileTheme = ExpansionTileTheme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    _borderColorTween.end = theme.dividerColor;
    _headerColorTween
      ..begin = widget.collapsedTextColor
          ?? expansionTileTheme.collapsedTextColor
          ?? theme.textTheme.subtitle1!.color
      ..end = widget.textColor ?? expansionTileTheme.textColor ?? colorScheme.primary;
    _iconColorTween
      ..begin = widget.collapsedIconColor
          ?? expansionTileTheme.collapsedIconColor
          ?? theme.unselectedWidgetColor
      ..end = widget.iconColor ?? expansionTileTheme.iconColor ?? colorScheme.primary;
    _backgroundColorTween
      ..begin = widget.collapsedBackgroundColor ?? expansionTileTheme.collapsedBackgroundColor
      ..end = widget.backgroundColor ?? expansionTileTheme.backgroundColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final ExpansionTileThemeData expansionTileTheme = ExpansionTileTheme.of(context);
    final bool closed = !_isExpanded && _controller.isDismissed;
    final bool shouldRemoveChildren = closed && !widget.maintainState;

    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: Padding(
          padding: widget.childrenPadding ?? expansionTileTheme.childrenPadding ?? EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: widget.expandedCrossAxisAlignment ?? CrossAxisAlignment.center,
            children: widget.children,
          ),
        ),
      ),
    );

    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: shouldRemoveChildren ? null : result,
    );
  }
}
