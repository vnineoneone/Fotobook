
upload_photo();

function upload_photo() {
    var fileImg = document.getElementById("imgFoto");
    var fileInput = document.getElementById("upload_image");

    fileImg.addEventListener(
      "click",
      function (e) {
        $(fileInput).show().focus().click().hide();
        e.preventDefault();
      },
      false
    );
    // Bind to the change event of our file input
    fileInput.addEventListener("change", function () {
      var btn_upload = document.getElementById("btn_create");
      // Get a reference to the fileList
      var files = !!this.files ? this.files : [];
  
      // If no files were selected, or no FileReader support, return
      if (!files.length || !window.FileReader) return;
  
      // Only proceed if the selected file is an image
      if (/^image/.test(files[0].type)) {
        // Create a new instance of the FileReader
        var reader = new FileReader();
  
        // Read the local file as a DataURL
        reader.readAsDataURL(files[0]);
  
        // When loaded, set image data as background of page
        reader.onloadend = function () {
          btn_upload.style.display = "none";
          fileImg.style.display = "inline-block";
          fileImg.src = this.result;
        };
      }
    });
  }
