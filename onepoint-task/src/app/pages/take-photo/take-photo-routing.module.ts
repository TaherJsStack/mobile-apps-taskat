import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { TakePhotoPage } from './take-photo.page';

const routes: Routes = [
  {
    path: '',
    component: TakePhotoPage
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class TakePhotoPageRoutingModule {}
