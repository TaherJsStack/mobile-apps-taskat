import { Component, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { ActivatedRoute, ParamMap } from '@angular/router';

import { MoviesService } from './../../api_service/movies.service';
import { MovieList } from './../../modeles/movie.list';

@Component({
  selector: 'app-movie-list',
  templateUrl: './movie-list.page.html',
  styleUrls: ['./movie-list.page.scss'],
})
export class MovieListPage implements OnInit {

  subscription: Subscription;
  movieList: MovieList[];
  movieName: string;

  listId: number;
  listName: string;

  constructor( private route: ActivatedRoute, private moviesService: MoviesService) { }

  ngOnInit() {
    console.log('==============================> MovieListPage <======================================')
    
    this.route.paramMap
    .subscribe( (paramMap: ParamMap ) => {
      this.movieName = paramMap.get('movie')

      if ( paramMap.has('id') ) {
        this.listId   = +paramMap.get('id');
        this.listName = paramMap.get('movie');

        this.moviesService.getAllMovieList(+paramMap.get('id'));
        this.subscription = this.moviesService.getAllMovieListUpdatedListener()
          .subscribe( 
            (movieListL: MovieList[]) => { 
              this.movieList = movieListL;
            },
            err => { 
              console.log('post error ==>', err)
            }
          )
        } else {
          console.log('no param map')
        }
      });
  }


  ngOnDestroy() {
    this.subscription.unsubscribe()
  }

}
