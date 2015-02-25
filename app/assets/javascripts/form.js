$(function(){
  var opinion_obj = {};
  var i = 0;
  while($("td.post_plan:eq(" + i + ")").attr("id") !== undefined){
    $("td.post_plan:eq(" + i + ")").addClass("muri");
    console.log($("td.post_plan:eq(" + i + ")").attr("id"));
    opinion_obj[$("td.post_plan:eq(" + i + ")").attr("id")] = "muri";
    i++;
  }
  $("#opinion_opinion").val(JSON.stringify(opinion_obj));
  console.log($("#opinion_opinion").val());

  $("td.post_plan").click(function(){
    $(this).addClass("ikeru").removeClass("muri");
    opinion_obj[$(this).attr("id")] = "ikeru";
    $("#opinion_opinion").val(JSON.stringify(opinion_obj));
    console.log($("#opinion_opinion").val());
  });
});
