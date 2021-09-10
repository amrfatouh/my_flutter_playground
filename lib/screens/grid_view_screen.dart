import 'package:flutter/material.dart';

class GridViewScreen extends StatefulWidget {
  GridViewScreen({Key? key}) : super(key: key);

  @override
  _GridViewScreenState createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  double _spacing = 25;
  void setSpacing(double newRating) => setState(() => _spacing = newRating);
  int _columns = 2;
  void setColumns(double newRating) =>
      setState(() => _columns = newRating.toInt());
  double _padding = 20;
  void setPadding(double newRating) => setState(() => _padding = newRating);
  double _childAspectRatio = 1;
  void setChildAspectRatio(double newRating) =>
      setState(() => _childAspectRatio = newRating);
  int _childrenCount = 8;
  void setChildrenCount(double newRating) =>
      setState(() => _childrenCount = newRating.toInt());
  double _gridViewWidth = 300;
  void setGridViewWidth(double newRating) =>
      setState(() => _gridViewWidth = newRating);
  double _maxColumnsWidth = 150;
  void setMaxColumnsWidth(double newRating) =>
      setState(() => _maxColumnsWidth = newRating);
  bool _isCountConstructor = true;
  void setIsCountConstructor(bool newValue) =>
      setState(() => _isCountConstructor = newValue);

  bool _isModalOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isCountConstructor ? "GridView.count" : "GridView.extent",
          style: TextStyle(
            fontFamily: 'RobotoMono',
          ),
        ),
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _isModalOpen
                      ? null
                      : () {
                          setState(() => _isModalOpen = true);
                          var bottomSheetController =
                              Scaffold.of(context).showBottomSheet(
                            (context) {
                              return MyBottomSheet(
                                isCountConstructor: _isCountConstructor,
                                spacing: _spacing,
                                columns: _columns,
                                padding: _padding,
                                childAspectRatio: _childAspectRatio,
                                gridViewWidth: _gridViewWidth,
                                childrenCount: _childrenCount,
                                maxColumnsWidth: _maxColumnsWidth,
                                setIsCountConstructor: setIsCountConstructor,
                                setSpacing: setSpacing,
                                setColumns: setColumns,
                                setPadding: setPadding,
                                setChildAspectRatio: setChildAspectRatio,
                                setChildrenCount: setChildrenCount,
                                setGridViewWidth: setGridViewWidth,
                                setMaxColumnsWidth: setMaxColumnsWidth,
                              );
                            },
                          );
                          bottomSheetController.closed.then(
                            (_) => setState(() => _isModalOpen = false),
                          );
                        },
                  icon: Icon(Icons.settings),
                ),
                if (_isCountConstructor)
                  Container(
                    width: _gridViewWidth,
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: _columns,
                      crossAxisSpacing: _spacing,
                      mainAxisSpacing: _spacing,
                      padding: EdgeInsets.all(_padding),
                      childAspectRatio: _childAspectRatio,
                      children: List.generate(_childrenCount, (index) {
                        return Container(
                          alignment: Alignment.center,
                          color: Colors.red.shade900,
                          child: FittedBox(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontSize: 100,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                if (!_isCountConstructor)
                  Container(
                    width: _gridViewWidth,
                    child: GridView.extent(
                      shrinkWrap: true,
                      maxCrossAxisExtent: _maxColumnsWidth,
                      padding: EdgeInsets.all(_padding),
                      childAspectRatio: _childAspectRatio,
                      mainAxisSpacing: _spacing,
                      crossAxisSpacing: _spacing,
                      children: List.generate(
                        _childrenCount,
                        (index) => Container(
                          color: Colors.blue.shade800,
                          alignment: Alignment.center,
                          child: FittedBox(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontSize: 100,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MySlider extends StatelessWidget {
  const MySlider({
    Key? key,
    required this.value,
    required this.setValue,
    required this.min,
    required this.max,
    required this.label,
    this.divisions,
  }) : super(key: key);

  final value;
  final min;
  final max;
  final divisions;
  final String label;
  final Function(double) setValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text('$label: ${value.toStringAsFixed(2)}'),
            ),
          ),
          Expanded(
            child: Slider(
              value: value,
              max: max,
              min: min,
              divisions: divisions,
              onChanged: setValue,
            ),
          ),
        ],
      ),
    );
  }
}

class MyBottomSheet extends StatefulWidget {
  MyBottomSheet({
    Key? key,
    required this.isCountConstructor,
    required this.spacing,
    required this.columns,
    required this.padding,
    required this.childAspectRatio,
    required this.childrenCount,
    required this.gridViewWidth,
    required this.maxColumnsWidth,
    required this.setIsCountConstructor,
    required this.setSpacing,
    required this.setColumns,
    required this.setPadding,
    required this.setChildAspectRatio,
    required this.setChildrenCount,
    required this.setGridViewWidth,
    required this.setMaxColumnsWidth,
  }) : super(key: key);

  final bool isCountConstructor;
  final double spacing;
  final int columns;
  final double padding;
  final double childAspectRatio;
  final int childrenCount;
  final double gridViewWidth;
  final double maxColumnsWidth;
  final Function(bool) setIsCountConstructor;
  final Function(double) setSpacing;
  final Function(double) setColumns;
  final Function(double) setPadding;
  final Function(double) setChildAspectRatio;
  final Function(double) setChildrenCount;
  final Function(double) setGridViewWidth;
  final Function(double) setMaxColumnsWidth;

  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  _MyBottomSheetState();

  bool isCountConstructor = true;
  double spacing = 25;
  int columns = 2;
  double padding = 20;
  double childAspectRatio = 1;
  int childrenCount = 8;
  double gridViewWidth = 300;
  double maxColumnsWidth = 150;

  @override
  void initState() {
    super.initState();
    isCountConstructor = widget.isCountConstructor;
    spacing = widget.spacing;
    columns = widget.columns;
    padding = widget.padding;
    childAspectRatio = widget.childAspectRatio;
    childrenCount = widget.childrenCount;
    gridViewWidth = widget.gridViewWidth;
    maxColumnsWidth = widget.maxColumnsWidth;
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                border: Border.all(
                  color: Colors.amber.shade400,
                  width: 2,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'GridView.',
                              style: TextStyle(
                                fontFamily: 'RobotoMono',
                                color: Colors.blue,
                              ),
                              children: [
                                TextSpan(
                                  text: 'extent',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ]),
                        ),
                        Switch(
                          value: isCountConstructor,
                          onChanged: (value) => setState(() {
                            isCountConstructor = value;
                            widget.setIsCountConstructor(value);
                          }),
                          activeColor: Colors.blue,
                          inactiveThumbColor: Colors.blue,
                          activeTrackColor: Colors.grey,
                          inactiveTrackColor: Colors.grey,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'GridView.',
                              style: TextStyle(
                                fontFamily: 'RobotoMono',
                                color: Colors.blue,
                              ),
                              children: [
                                TextSpan(
                                  text: 'count',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ]),
                        ),
                      ],
                    ),
                    if (isCountConstructor)
                      MySlider(
                        value: columns,
                        setValue: (double newRating) {
                          setState(() {
                            columns = newRating.toInt();
                            widget.setColumns(newRating);
                          });
                        },
                        min: 1,
                        max: 5,
                        divisions: 4,
                        label: 'columns',
                      ),
                    if (!isCountConstructor)
                      MySlider(
                        value: maxColumnsWidth,
                        setValue: (double newRating) {
                          setState(() {
                            maxColumnsWidth = newRating;
                            widget.setMaxColumnsWidth(newRating);
                          });
                        },
                        min: 20,
                        max: 300,
                        label: 'max column width',
                      ),
                    MySlider(
                      value: spacing,
                      setValue: (double newRating) {
                        setState(() {
                          spacing = newRating;
                          widget.setSpacing(newRating);
                        });
                      },
                      min: 0,
                      max: 100,
                      label: 'spacing',
                    ),
                    MySlider(
                      value: padding,
                      setValue: (double newRating) {
                        setState(() {
                          padding = newRating;
                          widget.setPadding(newRating);
                        });
                      },
                      min: 0,
                      max: 100,
                      label: 'padding',
                    ),
                    MySlider(
                      value: childAspectRatio,
                      setValue: (double newRating) {
                        setState(() {
                          childAspectRatio = newRating;
                          widget.setChildAspectRatio(newRating);
                        });
                      },
                      min: 0.1,
                      max: 10,
                      label: 'child aspect ratio',
                    ),
                    MySlider(
                      value: childrenCount,
                      setValue: (double newRating) {
                        setState(() {
                          childrenCount = newRating.toInt();
                          widget.setChildrenCount(newRating);
                        });
                      },
                      min: 1,
                      max: 40,
                      label: 'children count',
                    ),
                    MySlider(
                      value: gridViewWidth,
                      setValue: (double newRating) {
                        setState(() {
                          gridViewWidth = newRating;
                          widget.setGridViewWidth(newRating);
                        });
                      },
                      min: 20,
                      max: MediaQuery.of(context).size.width,
                      label: 'grid view width',
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.close),
              ),
            )
          ],
        ),
      ),
    );
  }
}
