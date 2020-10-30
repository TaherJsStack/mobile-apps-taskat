import { Component, OnInit } from '@angular/core';
import { Camera,CameraOptions,PictureSourceType } from '@ionic-native/camera/ngx';
import { FilePath } from '@ionic-native/file-path/ngx';
import { File, FileEntry } from '@ionic-native/file/ngx';
// import { WebView } from '@ionic-native/ionic-webview/ngx';
import { ToastController } from '@ionic/angular';

@Component({
  selector: 'app-photos',
  templateUrl: './photos.page.html',
  styleUrls: ['./photos.page.scss'],
})
export class PhotosPage implements OnInit {
  
  capturedSnapURL:string;
  photosList = [];

  cameraOptions: CameraOptions = {
    quality: 20,
    destinationType: this.camera.DestinationType.DATA_URL,
    encodingType: this.camera.EncodingType.JPEG,
    mediaType: this.camera.MediaType.PICTURE
  }

  constructor( 
    private camera: Camera, 
    private file: File, 
    private filePath: FilePath,
    public toastController: ToastController) { }
  
  ngOnInit() { }
  
  takeSnap() {
    this.camera.getPicture(this.cameraOptions).then((imageData) => {
      // this.camera.DestinationType.FILE_URI gives file URI saved in local
      // this.camera.DestinationType.DATA_URL gives base64 URI
      let base64Image = 'data:image/jpeg;base64,' + imageData;
      this.capturedSnapURL = base64Image;
      this.photosList.push(this.capturedSnapURL)

      this.presentToast('Your image was taken done. ')

    }, (err) => {
      console.log(err);
      // Handle error
    });

  }

  getImages() {
    this.camera.getPicture({
      sourceType: this.camera.PictureSourceType.SAVEDPHOTOALBUM,
      destinationType: this.camera.DestinationType.DATA_URL
      }).then((imageData) => {
     
      let base64Image = 'data:image/jpeg;base64,' + imageData;
      this.capturedSnapURL = base64Image;
      this.photosList.push(this.capturedSnapURL)
        this.filePath.resolveNativePath(this.capturedSnapURL).then(filePath => {
        const correctPath = filePath.substr(0, filePath.lastIndexOf('/') + 1);
        const currentName = imageData.substring(
          imageData.lastIndexOf('/') + 1,
          imageData.lastIndexOf('?'));
        });
      
        this.presentToast('uploading image has done')
      
      }, 
      (err) => {
        console.log(err);
      });
  }


  presentToast(message: string) {
    this.toastController.create({
      message: message,
      position: "top",
      duration: 2000
    }).then( toast => {
      toast.present();
    })
  }

 



// // ********************************************************************************************************************


// // async selectImage() {
// //   const actionSheet = await this.actionSheetController.create({
// //     header: 'Select Image source',
// //     buttons: [{
// //       text: 'Load from Library',
// //       handler: () => {
// //        this.takePicture(this.camera.PictureSourceType.PHOTOLIBRARY);
// //       }
// //    },
// //    {
// //     text: 'Use Camera',
// //     handler: () => {
// //       this.takePicture(this.camera.PictureSourceType.CAMERA);
// //      }
// //    },
// //    {
// //     text: 'Cancel',
// //     role: 'cancel'
// //    }]
// //  });
// //  await actionSheet.present();
// // }

// takePicture(sourceType: PictureSourceType) {
//   const options: CameraOptions = {
//     quality: 100,
//     sourceType: sourceType,
//     saveToPhotoAlbum: false,
//     correctOrientation: true
//   };
//   this.camera.getPicture(options).then(imagePath => {
//     if ( this.camera.PictureSourceType.PHOTOLIBRARY) {
//       this.filePath.resolveNativePath(imagePath).then(filePath => {
//       const correctPath = filePath.substr(0, filePath.lastIndexOf('/') + 1);
//       const currentName = imagePath.substring(
//         imagePath.lastIndexOf('/') + 1,
//         imagePath.lastIndexOf('?'));
//       this.copyFileToLocalDir(
//         correctPath,
//         currentName,
//         this.createFileName()
//       );
//     });
//    } else {
//     const currentName = imagePath.substr(imagePath.lastIndexOf('/') + 1);
//     const correctPath = imagePath.substr(0, imagePath.lastIndexOf('/') + 1);
//     this.copyFileToLocalDir(
//       correctPath,
//       currentName,
//       this.createFileName()
//     );
//    }
//   });
// }

// createFileName() {
//   const d = new Date(),
//   n = d.getTime(),
//   newFileName = n + '.jpg';
//   return newFileName;
// }

// copyFileToLocalDir(namePath, currentName, newFileName) {
// this.file.copyFile(namePath, currentName, this.file.dataDirectory, newFileName).then(
//   success => {
//     // this.updateStoredImages(newFileName);
//     // this.presentToast('Success while storing file.');
//   },
//   error => {
//     // this.presentToast('Error while storing file.');
//   });
// }

// // updateStoredImages(name) {
// //   this.storage.get(STORAGE_KEY).then(images => {
// //     let arr = [];
// //     if (images && images !== '' && images.length > 0) {
// //       arr = JSON.parse(images);
// //     } else {
// //       arr = [];
// //     }
// //     if (!arr) {
// //       const newImages = [name];
// //       this.storage.set('my_images', JSON.stringify(newImages));
// //     } else {
// //       arr.push(name);
// //       this.storage.set('my_images', JSON.stringify(arr));
// //     }
// //    const filePath = this.file.dataDirectory + name;
// //    const resPath = this.pathForImage(filePath);
// //    const newEntry = {
// //       name: name,
// //       path: resPath,
// //       filePath: filePath
// //    };
// //    this.images = [newEntry, ...this.images];
// //  });
// // }


// startUpload(imgEntry, position) {
//   this.file
//   .resolveLocalFilesystemUrl(imgEntry.filePath)
//   .then(entry => {
//     (<FileEntry>entry).file(file => this.readFile(file, imgEntry, position));
// })
//   .catch(err => {
//     // this.presentToast('Error while reading file.');
//   });
// }

// readFile(file: any, imgEntry, position) {
//   const reader = new FileReader();
//   reader.onload = () => {
//   const formData = new FormData();
//   const imgBlob = new Blob([reader.result], {
//     type: file.type
//   });
//   formData.append('file', imgBlob, file.name);
//   // this.uploadImageData(formData, imgEntry, position);
// };
// reader.readAsArrayBuffer(file);
// }

// // async uploadImageData(formData: FormData, imgEntry, position) {
// //   const loading = await this.loadingController.create({
// //     message: 'Uploading image...'
// //   });
// //   await loading.present();
// //   this.http.post(`<<YOUR API>>`, formData).pipe(finalize(() => {
// //     loading.dismiss();
// //   })
// // )
// //   .subscribe(res => {
// //     if (res['success']) {
// //       // this.presentToast('File upload complete.');
// //     } else {
// //       // this.presentToast('File upload failed.');
// //     }
// //   });
// // }
// // }

// // deleteImage(imgEntry, position) {
// //   this.images.splice(position, 1);
// //   this.storage.get('my_images').then(images => {
// //     const arr = JSON.parse(images);
// //     const filtered = arr.filter(name => name !== imgEntry.name);
// //     this.storage.set('my_images', JSON.stringify(filtered));
// //     const correctPath = imgEntry.filePath.substr(0,
// //       imgEntry.filePath.lastIndexOf('/') + 1);
// //     this.file.removeFile(correctPath, imgEntry.name).then(res => {
// //       this.presentToast('File removed.');
// //     });
// //   });
// // }

}
