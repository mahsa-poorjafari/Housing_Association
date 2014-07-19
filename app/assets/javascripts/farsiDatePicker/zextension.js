// http://lisperator.net/uglifyjs/

//jd_to_hebrew(gregorian_to_jd(2013,3,11)) => [5773, 12, 29]
//jd_to_hebrew(gregorian_to_jd(2013,3,12)) => [5773, 1, 1]
window.HebrewDate = DateBuilder(function (d){
    var adjust = 0;
    if(d[1]<0){
        //adjust = 30;
        //d[1]++;
    }
    var gregorian = jd_to_gregorian(hebrew_to_jd(d[0], d[1] + 1, d[2])-adjust);
    gregorian[1]--;
    return gregorian;
}, function (d) {
    var hebrew = jd_to_hebrew(gregorian_to_jd(d[0], d[1] + 1, d[2]));
    hebrew[1]--;
    return hebrew;
});
$.datepicker.regional['he'] = {
    calendar: HebrewDate,
    calculateWeek: HebrewDate.calculateWeek,
    closeText: 'بستن',
    prevText: 'قبل',
    nextText: 'بعد',
    currentText: 'امروز',
    monthNames: ['نیسان', 'یار', 'سیوان', 'تموز', 'آو', 'اِلول', 'تیشری', 'حِشوان', 'کیسلِو', 'طِوِت', 'شِواط', 'اَدار 1', 'ادار 2'],
    monthNamesShort: ['نیسان', 'یار', 'سیوان', 'تموز', 'آو', 'اِلول', 'تیشری', 'حِشوان', 'کیسلِو', 'طِوِت', 'شِواط', 'اَدار 1', 'ادار 2'],
    dayNames: ['یکشنبه', 'دوشنبه', 'سه شنبه', 'چهارشنبه', 'پنجشنبه', 'جمعه', 'شنبه'],
    dayNamesShort: ['یک', 'دو', 'سه', 'چهار', 'پنج', 'جمعه', 'شنبه'],
    dayNamesMin: ['ی','د','س','چ','پ','ج','ش'],
    weekHeader: 'ه',
    dateFormat: 'yy/mm/dd',
    firstDay: 6,
    isRTL: true,
    showMonthAfterYear: false,
    yearSuffix: ''
};
$.datepicker.setDefaults($.datepicker.regional['he']);


window.HijriDate = DateBuilder(function (d){
    var gregorian = jd_to_gregorian(islamic_to_jd(d[0], d[1] + 1, d[2]));
    gregorian[1]--;
    return gregorian;
}, function (d) {
    var hijri = jd_to_islamic(gregorian_to_jd(d[0], d[1] + 1, d[2]));
    hijri[1]--;
    return hijri;
});

$.datepicker.regional['ar'] = {
    calendar: HijriDate,
    calculateWeek: HijriDate.calculateWeek,
    closeText: 'إغلاق',
    prevText: 'السابق',
    nextText: 'التالي',
    currentText: 'اليوم',
    monthNames: ['محرّم', 'صفر', 'ربيع الأول', 'ربيع الثاني', 'جمادى الأولى', 'جمادى الآخرة', 'رجب', 'شعبان', 'رمضان', 'شوال', 'ذو القعدة', 'ذو الحجة'],
    monthNamesShort: ['محرّم', 'صفر', 'ربيع الأول', 'ربيع الثاني', 'جمادى الأولى', 'جمادى الآخرة', 'رجب', 'شعبان', 'رمضان', 'شوال', 'ذو القعدة', 'ذو الحجة'],
    dayNames: ['الأحد', 'الاثنين', 'الثلاثاء', 'الأربعاء', 'الخميس', 'الجمعة', 'السبت'],
    dayNamesShort: ['أحد', 'اثنين', 'ثلاثاء', 'أربعاء', 'خميس', 'جمعة', 'سبت'],
    dayNamesMin: ['أ', 'ا', 'ث', 'أ', 'خ', 'ج', 'س'],
    weekHeader: 'س',
    dateFormat: 'dd/mm/yy',
    firstDay: 6,
    isRTL: true,
    showMonthAfterYear: false,
    yearSuffix: ''
};
$.datepicker.setDefaults($.datepicker.regional['ar']);

window.IndianDate = DateBuilder(function (d){
    var gregorian = jd_to_gregorian(indian_civil_to_jd(d[0], d[1] + 1, d[2]));
    gregorian[1]--;
    return gregorian;
}, function (d) {
    var indian = jd_to_indian_civil(gregorian_to_jd(d[0], d[1] + 1, d[2]));
    indian[1]--;
    return indian;
});
$.datepicker.regional['hi'] = {
    calendar: IndianDate,
    calculateWeek: IndianDate.calculateWeek,
    closeText: 'बंद',
    prevText: 'पिछला',
    nextText: 'अगला',
    currentText: 'आज',
    monthNames: ['जनवरी ','फरवरी','मार्च','अप्रेल','मई','जून',
    'जूलाई','अगस्त ','सितम्बर','अक्टूबर','नवम्बर','दिसम्बर'],
    monthNamesShort: ['जन', 'फर', 'मार्च', 'अप्रेल', 'मई', 'जून',
    'जूलाई', 'अग', 'सित', 'अक्ट', 'नव', 'दि'],
    dayNames: ['रविवार', 'सोमवार', 'मंगलवार', 'बुधवार', 'गुरुवार', 'शुक्रवार', 'शनिवार'],
    dayNamesShort: ['रवि', 'सोम', 'मंगल', 'बुध', 'गुरु', 'शुक्र', 'शनि'],
    dayNamesMin: ['रवि', 'सोम', 'मंगल', 'बुध', 'गुरु', 'शुक्र', 'शनि'],
    weekHeader: 'हफ्ता',
    dateFormat: 'dd/mm/yy',
    firstDay: 1,
    isRTL: false,
    showMonthAfterYear: false,
    yearSuffix: ''};
$.datepicker.setDefaults($.datepicker.regional['hi']);

window.JalaliDate = DateBuilder(function (d) {
    var adjust = 0;
    if(d[1]<0){
        adjust = leap_persian(d[0]-1)? 30: 29;
        d[1]++;
    }
    var gregorian = jd_to_gregorian(persian_to_jd(d[0], d[1] + 1, d[2])-adjust);
    gregorian[1]--;
    return gregorian;
}, function (d) {
    var jalali = jd_to_persian(gregorian_to_jd(d[0], d[1] + 1, d[2]));
    jalali[1]--;
    return jalali;
});
$.datepicker.regional['fa'] = {
    calendar: JalaliDate,
    calculateWeek: JalaliDate.calculateWeek,
    closeText: 'بستن',
    prevText: 'قبل',
    nextText: 'بعد',
    currentText: 'امروز',
    monthNames: ['فروردین','اردیبهشت','خرداد','تیر','مرداد','شهریور','مهر','آبان','آذر','دی','بهمن','اسفند'],
    monthNamesShort: ['فروردین','اردیبهشت','خرداد','تیر','مرداد','شهریور','مهر','آبان','آذر','دی','بهمن','اسفند'],
    dayNames: ['یکشنبه', 'دوشنبه', 'سه شنبه', 'چهارشنبه', 'پنجشنبه', 'جمعه', 'شنبه'],
    dayNamesShort: ['یک', 'دو', 'سه', 'چهار', 'پنج', 'جمعه', 'شنبه'],
    dayNamesMin: ['ی','د','س','چ','پ','ج','ش'],
    weekHeader: 'ه',
    dateFormat: 'yy/mm/dd',
    firstDay: 6,
    isRTL: true,
    showMonthAfterYear: false,
    yearSuffix: ''
};
$.datepicker.setDefaults($.datepicker.regional['fa']);
