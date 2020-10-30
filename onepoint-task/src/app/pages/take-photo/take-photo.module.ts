import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { TakePhotoPageRoutingModule } from './take-photo-routing.module';

import { TakePhotoPage } from './take-photo.page';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    TakePhotoPageRoutingModule
  ],
  declarations: [TakePhotoPage]
})
export class TakePhotoPageModule {}
