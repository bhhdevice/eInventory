$('.models.show').ready(function() {
  var url = $('#website')[0].nextElementSibling.innerText
  if (url !== "") {
      $('#website')[0].nextElementSibling.innerHTML = '<a href="' + url + '" target="_blank">Click here</a>'
  }
});
