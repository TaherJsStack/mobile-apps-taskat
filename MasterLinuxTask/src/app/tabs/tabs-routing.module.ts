
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { TabsPage } from './tabs.page';

const routes: Routes = [
  {
    path: 'tabs',
    component: TabsPage,
    children: [
      {
        path: '',
        loadChildren: () => import('../pages/movies-list/movies-list.module').then(m => m.MoviesListPageModule)
      },
      {
        path: 'moviesList',
        loadChildren: () => import('../pages/movies-list/movies-list.module').then(m => m.MoviesListPageModule)
      },
      {
        path: 'movieList/:id/:movie',
        loadChildren: () => import('../pages/movie-list/movie-list.module').then(m => m.MovieListPageModule)
      },
      {
        path: 'movie/:id/:movie/:listId/:listName',
        loadChildren: () => import('../pages/movie/movie.module').then(m => m.MoviePageModule)
      },
      {
        path: 'profile',
        loadChildren: () => import('../user/profile/profile.module').then(m => m.ProfilePageModule)
      },
      {
        path: '',
        redirectTo: '/tabs/moviesList',
        pathMatch: 'full'
      }
    ]
  },
  {
    path: '',
    redirectTo: '/tabs/moviesList',
    pathMatch: 'full'
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TabsPageRoutingModule {}
