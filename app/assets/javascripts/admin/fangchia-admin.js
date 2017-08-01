(function(){

function Editor(input, preview) {
  this.update = function() {
    preview.innerHTML = markdown.toHTML(input.value);
  };

  input.editor = this;

  input.addEventListener('keyup', function() {
    input.editor.update();
  });

  this.update();
}

window.addEventListener('load', function() {
  var input = document.getElementById('show_description');
  var preview = document.getElementById('description-preview');
  new Editor(input, preview);
});


})();
