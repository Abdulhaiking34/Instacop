import 'package:flutter_screenutil/flutter_screenutil.dart';

setScreenHeight({double size}) {
  return ScreenUtil().setHeight(size);
}

setScreenWidth({double size}) {
  return ScreenUtil().setWidth(size);
}

setScreenFontSize({double size}) {
  return ScreenUtil().setSp(size, allowFontScalingSelf: true);
}
