upload_album();

function upload_album() {
  
  var fileInput = $("#upload_image_album");
  // Bind to the change event of our file input
  $("input[id='upload_image_album']").on("change", function () {
    var list_photos = $(".list-photos");
    // Get a reference to the fileList
    var files = !!this.files ? this.files : [];

    // If no files were selected, or no FileReader support, return
    if (!files.length || !window.FileReader) return;
    for (let i = 0; i < files.length; i++) {
      if (/^image/.test(files[i].type)) {
        // Create a new instance of the FileReader
        var reader = new FileReader();

        // Read the local file as a DataURL
        reader.readAsDataURL(files[i]);

        // When loaded, set image data as background of page
        reader.onloadend = function () {
          list_photos.append(`    
          <div class="col-3 d-flex justify-content-center">
            <div class="form_image_edit">
              <image src=${this.result} class="list_image">
              <i class="fa-solid fa-x" id="close-icon"></i>
            </div>
          </div>`);
        };
      }
    }

    // Only proceed if the selected file is an image
  });
}