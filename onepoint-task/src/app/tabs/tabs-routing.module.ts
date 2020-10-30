import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { TabsPage } from './tabs.page';

const routes: Routes = [
  {
    path: 'tabs',
    component: TabsPage,
    children: [ 
  {
    path: 'posts-list',
    loadChildren: () => import('../pages/posts-list/posts-list.module').then( m => m.PostsListPageModule)
  },
  {
    path: 'take-photo',
    loadChildren: () => import('../pages/take-photo/take-photo.module').then( m => m.TakePhotoPageModule)
  },
  {
    path: 'photos',
    loadChildren: () => import('../pages/photos/photos.module').then( m => m.PhotosPageModule)
  },
  {
    path: 'post/:id',
    loadChildren: () => import('../pages/post/post.module').then( m => m.PostPageModule)
  },
      {
        path: '',
        redirectTo: '/tabs/posts-list',
        pathMatch: 'full'
      }
    ]
  },
  {
    path: '',
    redirectTo: '/tabs/posts-list',
    pathMatch: 'full'
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TabsPageRoutingModule {}
