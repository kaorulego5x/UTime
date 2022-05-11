import 'package:flutter/material.dart';
import 'package:utime/const/utime_colors.dart';
import 'package:utime/view/widgets/dropdown_modal_overlay.dart';
import 'package:utime/model/lecture_dialog_list.dart';

class DropdownBuilder {
  BuildContext context;
  DropdownBuilder(this.context) : super();

  //ドロップダウンのリスト
  var selectedIndex = 1;
  List<ItemModel> _subjectTypeList = [];
  List<ItemModel> _openTermList = [];
  List<ItemModel> _creditsNumberList = [];
  LectureDialogList lectureDialogList = LectureDialogList();
  //ラジオボタンのモデル
  //List<RadioModel> _radioData = [];
  //ドロップダウンの色
  Color dropdownColor = UtimeColors.darkGray; //初期値

  //var _groupValue = ItemModel(text: '基礎科目', index: 1, selected: true);

  getSubjectTypeList() {
    _subjectTypeList = lectureDialogList.getSubjectTypeList();
    return _subjectTypeList;
  }

  getOpenTermList() {
    _openTermList = lectureDialogList.getOpenTermList();
    return _openTermList;
  }

  getCreditsNumberList() {
    _creditsNumberList = lectureDialogList.getCreditsNumberList();
    return _creditsNumberList;
  }

  getDropdownColor(Color color) {
    UtimeColors utimeColors = UtimeColors();
    dropdownColor = utimeColors.getDropDownColor(color);
    return dropdownColor;
  }

  /*
   * 科目選択ドロップダウンを表示
   */
  void showSubjectTypeDropdownList(
      double width, Color dialogColor, RenderBox box) {
    List listItems = getSubjectTypeList();
    showDropdownList(480, width, dialogColor, listItems, box);
  }

  /*
   * 開講区分ドロップダウンを表示
   */
  void showOpenTermDropdownList(
      double width, Color dialogColor, RenderBox box) {
    List listItems = getOpenTermList();
    showDropdownList(224, width, dialogColor, listItems, box);
  }

  /*
   * 単位数ドロップダウンを表示
   */
  void showCreditsNumberDropdownList(
      double width, Color dialogColor, RenderBox box) {
    List listItems = getCreditsNumberList();
    showDropdownList(76, width, dialogColor, listItems, box);
  }

  /*
   * 表示
   */
  void showDropdownList(double height, double width, Color dialogColor,
      List listItems, RenderBox box) {
    Color dropdownColor = getDropdownColor(dialogColor);
    final Offset offset = box.localToGlobal(Offset.zero);
    final Size size = box.size;
    Navigator.push(
      context,
      DropdownModalOverlay(Container(
        width: width,
        height: height,
        padding: const EdgeInsets.only(top: 4, bottom: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: dropdownColor),
        child: ListView.builder(
          itemCount: listItems.length,
          itemExtent: 36,
          itemBuilder: (context, index) {
            //背景
            return Container(
                margin:
                    const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: listItems[index].selected
                      ? dialogColor //選択されていないときの背景色
                      : dropdownColor, //選択されているときの背景色
                  borderRadius: BorderRadius.circular(12),
                ),
                //要素
                child: GestureDetector(
                  //onTap: setState(() {
                  //  selectedIndex = index;
                  //}),
                  child: Text(
                    listItems[index].text,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: UtimeColors.white),
                    textAlign: TextAlign.center,
                  ),
                )

                /*ListTile(
                selected: selectedIndex == index ? true : false,
                selectedColor: UtimeColors.white,
                textColor: UtimeColors.white,
                selectedTileColor: dialogColor,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                title: Text(
                  listItems[index].text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),*/
                );

            /*Positioned(
              right: (offset.dx + size.width) / 2,
              top: (offset.dy + size.height) / 2,
              child: Column(
                children: <Widget>[
                  makeRadioTiles(dialogColor, listItems),
                  SizedBox(
                    height: 500,
                    width: 500,
                    child: CustomRadio(_radioData),
                  )
                ],
              ),
            );*/
          },
        ),
      )),
    );
  }

/*
  Widget makeRadioTiles(Color dialogColor, List listItems) {
    List<Container> list = [];
    Color dropdownColor = getDropdownColor(dialogColor);

    for (int i = 0; i < listItems.length; i++) {
      list.add(Container(
        margin: const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
        decoration: BoxDecoration(
          color: listItems[i].selected
              ? dialogColor //選択されていないときの背景色
              : dropdownColor, //選択されているときの背景色
          borderRadius: BorderRadius.circular(12),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: dropdownColor, //選択していないときのラジオボタンの色
          ),
          child: RadioListTile<ItemModel>(
            value: listItems[i],
            groupValue: _groupValue,
            selected: listItems[i].selected,
            onChanged: (val) {
              setState(() {
                for (int i = 0; i < listItems.length; i++) {
                  listItems[i].selected = false;
                }
                _groupValue = val!;
                listItems[i].selected = true;
              });
            },
            activeColor: dialogColor, //選択したときのラジオボタンの色
            controlAffinity: ListTileControlAffinity.trailing,
            title: Text(
              ' ${listItems[i].text}',
              style: TextStyle(
                  color: listItems[i].selected
                      ? UtimeColors.white //選択されていないときの文字色
                      : UtimeColors.white, //選択されているときの文字色
                  fontWeight: listItems[i].selected
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
          ),
        ),
      ));
    }

    Column column = Column(
      children: list,
    );
    return column;
  }
*/

/*
   * 非表示
   */
  void hideCustomDialog() {
    Navigator.of(context).pop();
  }

  void setState(Null Function() param0) {}
}

/*
// ignore: must_be_immutable
class CustomRadio extends StatefulWidget {
  List<RadioModel> sampleData = [];

  CustomRadio(this.sampleData, {Key? key}) : super(key: key);

  @override
  createState() {
    return CustomRadioState(sampleData);
  }
}

class CustomRadioState extends State<CustomRadio> {
  List<RadioModel> sampleData = [];

  CustomRadioState(this.sampleData);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sampleData.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          //highlightColor: Colors.red,
          splashColor: Colors.blueAccent,
          onTap: () {
            setState(() {
              sampleData.forEach((element) => element.isSelected = false);
              sampleData[index].isSelected = true;
            });
          },
          child: RadioItem(sampleData[index]),
        );
      },
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 50.0,
            width: 50.0,
            child: Center(
              child: Icon(
                _item.icon,
                color:
                    _item.isSelected ? _item.selectedColor : _item.defaultColor,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              _item.text,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight:
                    _item.isSelected ? FontWeight.bold : FontWeight.normal,
                color:
                    _item.isSelected ? _item.selectedColor : _item.defaultColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final IconData icon;
  final String text;
  final Color selectedColor;
  final Color defaultColor;

  RadioModel(this.isSelected, this.icon, this.text, this.selectedColor,
      this.defaultColor);

     
}*/
