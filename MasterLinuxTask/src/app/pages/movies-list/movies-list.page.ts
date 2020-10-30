import { MoviesService } from './../../api_service/movies.service';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { Subscription } from 'rxjs';
import { MoviesList } from './../../modeles/movies.list';


@Component({
  selector: 'app-movies-list',
  templateUrl: './movies-list.page.html',
  styleUrls: ['./movies-list.page.scss'],
})
export class MoviesListPage implements OnInit, OnDestroy {

  subscription:  Subscription;
  moviesL: MoviesList[] = [];

  constructor(private moviesService: MoviesService) {

  }

  ngOnInit() {

    this.moviesService.getAllMoviesList();
    this.subscription = this.moviesService.getAllMoviesListUpdatedListener()
    .subscribe((moviesD: MoviesList[])  => {
      console.log("movies 88888=>", moviesD)
      this.moviesL = moviesD;
    });

  }


  ngOnDestroy() {
    this.subscription.unsubscribe()
  }


}
