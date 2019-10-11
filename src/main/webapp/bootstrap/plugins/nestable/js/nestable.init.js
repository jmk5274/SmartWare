var script = document.createElement('script');
script.src = 'https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js';
script.type = 'text/javascript';
document.getElementsByTagName('head')[0].appendChild(script);


$(document).ready(function() {
    "use strict";
    var e = function(e) {
        var t = e.length ? e : $(e.target),
            a = t.data("output");
        window.JSON ? a.val(window.JSON.stringify(t.nestable("serialize"))) : a.val("JSON browser support required for this demo.")
    };
    $("#nestable").nestable({
        group: 1
    }).on("change", e), $("#nestable2").nestable({
        group: 1
    }).on("change", e), e($("#nestable").data("output", $("#nestable-output"))), e($("#nestable2").data("output", $("#nestable2-output"))), $("#nestable-menu").on("click", function(e) {
        var t = $(e.target).data("action");
        "expand-all" === t && $(".dd").nestable("expandAll"), "collapse-all" === t && $(".dd").nestable("collapseAll")
    }), $("#nestable3").nestable()
});