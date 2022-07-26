alert(123)
// edit_photo();
// alert(123);

// function edit_photo() {
//     var fileImg = document.getElementById("imgFoto2");
//     var fileInput = document.getElementById("edit_image");
//     var btn_upload = $("#btn_edit");
//     $("#imgFoto2").click(function () {
//       btn_upload.css({
//         display: "inline-block",
//         display: "flex",
//         "justify-content": "center",
//         "align-items": "center",
//       });
//       fileImg.style.display = "none";
//     });
//     fileImg.addEventListener(
//       "click",
//       function (e) {
//         $(fileInput).show().focus().click().hide();
//         e.preventDefault();
//       },
//       false
//     );
//     // Bind to the change event of our file input
//     $("input[id='edit_image']").on("change", function () {
//       // Get a reference to the fileList
//       var files = !!this.files ? this.files : [];
  
//       // If no files were selected, or no FileReader support, return
//       if (!files.length || !window.FileReader) return;
  
//       // Only proceed if the selected file is an image
//       if (/^image/.test(files[0].type)) {
//         // Create a new instance of the FileReader
//         var reader = new FileReader();
  
//         // Read the local file as a DataURL
//         reader.readAsDataURL(files[0]);
  
//         // When loaded, set image data as background of page
//         reader.onloadend = function () {
//           btn_upload.css("display", "none");
//           fileImg.style.display = "inline-block";
//           fileImg.src = this.result;
//         };
//       }
//     });
//   }
             