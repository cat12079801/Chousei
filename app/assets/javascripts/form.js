$(function(){
  // ロード時に予定を入れるオブジェクトを用意したり(初期値は"むり")
  var opinion_obj = {};
  var i = 0;
  while($("td.post_plan:eq(" + i + ")").attr("id") !== undefined){
    $("td.post_plan:eq(" + i + ")").addClass("muri");
    opinion_obj[$("td.post_plan:eq(" + i + ")").attr("id")] = "muri";
    i++;
  }
  // jsonで扱っているオブジェクトを文字列に変換してフォームに入れる
  $("#opinion_opinion").val(JSON.stringify(opinion_obj));
  $("#muri.selectable").addClass("selected");

  // "行ける", "未定", "むり"の選択切り替え
  $(".selectable").click(function(){
    $(".selectable").removeClass("selected");
    $(this).addClass("selected");
  });

  // 選択されたところをその色に変化させてフォームに入れなおし"
  $("td.post_plan").click(function(){
    switch($(".selected").attr("id")){
      case "ikeru":
        $(this).addClass("ikeru").removeClass("mitei").removeClass("muri");
        opinion_obj[$(this).attr("id")] = "ikeru";
        break;
      case "mitei":
        $(this).removeClass("ikeru").addClass("mitei").removeClass("muri");
        opinion_obj[$(this).attr("id")] = "mitei";
        break;
      case "muri":
        $(this).removeClass("ikeru").removeClass("mitei").addClass("muri");
        opinion_obj[$(this).attr("id")] = "muri";
        break;
    }
    $("#opinion_opinion").val(JSON.stringify(opinion_obj));
  });
});
