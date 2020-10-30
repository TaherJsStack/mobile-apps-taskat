import { Component, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';
import { Movie } from 'src/app/modeles/movie';
import { ActivatedRoute, ParamMap } from '@angular/router';
import { MoviesService } from 'src/app/api_service/movies.service';

@Component({
  selector: 'app-movie',
  templateUrl: './movie.page.html',
  styleUrls: ['./movie.page.scss'],
})
export class MoviePage implements OnInit {

  subscription: Subscription;
  movie;
  spinner: boolean = true;
  movieName: string;

  listId: number;
  listMovie: string;


  constructor( private route: ActivatedRoute, private moviesService: MoviesService) { }

  ngOnInit() {
    console.log('==============================> Movie Page <======================================')
    
    this.route.paramMap
    .subscribe( (paramMap: ParamMap ) => {
      this.movieName = paramMap.get('movie')

      if ( paramMap.has('id') ) {
        this.listId = +paramMap.get('listId');
        this.listMovie = paramMap.get('listName');
        this.subscription = this.moviesService.getMovie(121094) 
          .subscribe( 
            movieData => { 
              console.log("movieList =>", movieData)
              this.movie = movieData;
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
