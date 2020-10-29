import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class PostsService {


  constructor(private http: HttpClient) { }

  getPostsList(params) {
    return this.http.get('https://jsonplaceholder.typicode.com/photos'+ params)
  }


}
