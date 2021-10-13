$(document).ready(function() {

    let operForm = $("#operForm");

    $("button[data-oper='modify']").on("click", function(e) {

        operForm.attr("action", "/board/modify").submit();

    });

    $("button[data-oper='list']").on("click", function(e) {

        operForm.find("#bno").remove();
        operForm.attr("action","/board/list");
        operForm.submit();
    });

});