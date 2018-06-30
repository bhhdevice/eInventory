function updateCategory() {
  var $selected_model = selectedModel();
  $.ajax({
      url : '/equipment/category',
      type : 'GET',
      data: {
        modelID: $selected_model.val()
      },
      dataType:'json',
      success : function(data) {
        $("#equipment_category").html(data['name']);
      },
      error : function(request,error)
      {
        console.log("Unable to perform request");
      }
  });
}

function selectedModel() {
  return $('#equipment_model_id option:selected');
}

function updateModelSelections() {
  var $selected_model = selectedModel();
  if ($('#equipment_brand_id').val() != "") {
    $.ajax({
        url : '/equipment/models',
        type : 'GET',
        data: {
          brandID: $('#equipment_brand_id').val()
        },
        dataType:'json',
        success : function(data) {
          if (data.length > 0) {
            $("#equipment_model_id").html('<option value="" disabled selected>Select Model:</option>');

            $(data).each(function() {
              if ($selected_model.length > 0 && $selected_model[0].text === this.name) {
                $("#equipment_model_id").append("<option value=" + this.id + " selected >" + this.name + "</option>");
              }else{
                $("#equipment_model_id").append("<option value=" + this.id + ">" + this.name + "</option>");
              }

            });
          }else {
            $("#equipment_model_id").html('<option value="" disabled selected>No Models Available</option>');
          }
        },
        error : function(request,error)
        {
          console.log("Unable to perform request");
        }
    });
    $('#equipment_model_id').prop('disabled', false);
  }else {
    clearModelSelection();
  }
};

function updateSelections() {
  updateModelSelections();
};

function clearSelections() {
  clearModelSelection();
};

function clearModelSelection() {
  $('#equipment_model_id').empty();
  $('#equipment_model_id').prop('disabled', true);
};

function clearCategory() {
  $("#equipment_category").html('');
};

$('.equipment.new, .equipment.edit, .equipment.update, .equipment.create').ready(function() {
  updateSelections();
  $('#equipment_brand_id').change(function() {
    clearCategory();
    updateSelections();
  });

  $('#equipment_model_id').change(function() {
    updateCategory();
  });
});
