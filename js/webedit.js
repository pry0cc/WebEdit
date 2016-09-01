// save status, 1 = saved, 0 = not saved 2 = saving
let save_status = 1;
editor.getSession().on('change', function(e) {
  update_indicator(0);
});

$(document).ready(function() {
  $("#submit").click(function() {
    save();
  });

  var listener = new window.keypress.Listener();
  listener.simple_combo("control s", function() {
    console.log("File saved");
    save();
  });
});

function save() {
  update_indicator(2);
  var document_text = document.getElementById("new").innerHTML;
  $.post("/edit/" + key,
  {
    new: document_text
  },
  function(){
    // alert("SAVED AND DONE!");
    update_indicator(1);
  });
}

function update_indicator(state) {
  var indicator = document.getElementById("save_indicator");
  if (state == 1) {
    save_status = 1;
    indicator.className = "glyphicon glyphicon-ok";
  } else if (state == 0) {
    save_status = 0;
    indicator.className = "glyphicon glyphicon-pencil"
  } else if (state == 2) {
    save_status = 2;
    indicator.className = "glyphicon glyphicon-refresh"
  }
}
