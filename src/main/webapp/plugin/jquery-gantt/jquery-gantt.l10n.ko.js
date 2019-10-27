(function(factory) {
	if (typeof define === 'function' && define.amd) {
		// AMD. Register as anonymous module.
		define('jquery-gantt.l10n.ru', [ 'jquery' ], factory);
	} else if (typeof exports === 'object') {
		// Node / CommonJS
		factory(require('jquery'));
	} else {
		// Browser globals.
		factory(jQuery);
	}
})(function($) {
	'use strict';
	$.fn.gantt.l10n['ko'] = {
		monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
		monthNamesShort : [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
				"Aug", "Sep", "Oct", "Nov", "Dec" ],
		dayNames : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
		dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
		dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ]
	};
});
