import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Subject } from 'rxjs';

import { environment } from '../../environments/environment';
import { MoviesList } from './../modeles/movies.list';
import { MovieList } from '../modeles/movie.list';
import { Movie } from '../modeles/movie';

const API_KEY = environment.API_KEY;
const BACKEND_API = environment.API_URL;

@Injectable({
  providedIn: 'root'
})
export class MoviesService {

  moviesListUpdated = new Subject();
  moviesLitUpdated  = new Subject();

  private moviesList: MoviesList[] = [];
  private movieList:  MovieList[]  = [];
  private movie: Movie;

  constructor(private http: HttpClient) { }

  getAllMoviesList() {
    return this.http.get<{genres: MoviesList[]}>( BACKEND_API  + 'genre/movie/list?api_key='+API_KEY+'&language=en-US')
    .subscribe( ( moviesData) => {
      this.moviesList = moviesData.genres;
      this.moviesListUpdated.next(this.moviesList);
    })
  }

  getAllMoviesListUpdatedListener() {
    return this.moviesListUpdated.asObservable();
  }


  getAllMovieList(mlistId: number) {
    return this.http.get<{id:number, page: number, results: MovieList[]}>( BACKEND_API +"movie/"+mlistId+"/lists?api_key="+API_KEY+"&language=en-US&page=1")
    .subscribe( ( moviesData) => {
      this.movieList = moviesData.results;
      this.moviesLitUpdated.next(this.movieList);
    })
  }

  getAllMovieListUpdatedListener() {
    return this.moviesLitUpdated.asObservable();
  }

  getMovie(movieId: number) {
    console.log("movieId =>", movieId)
    return this.http.get( BACKEND_API +"movie/"+movieId+"?api_key="+API_KEY+"&language=en-US");
  }





}
