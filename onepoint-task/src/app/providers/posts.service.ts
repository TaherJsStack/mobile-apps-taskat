import { Post } from 'src/app/model/post';
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})

export class PostsService {

  constructor(private http: HttpClient) { }

  getPostsList() {
    return this.http.get<Post[]>('https://jsonplaceholder.typicode.com/posts')
  }

  getPostById(id: number){
    return this.http.get<Post>('https://jsonplaceholder.typicode.com/posts/'+id)  
  }



}
