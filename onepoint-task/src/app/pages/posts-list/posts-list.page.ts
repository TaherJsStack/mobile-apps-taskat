import { Component, OnInit } from '@angular/core';
import { PostsService } from 'src/app/providers/posts.service';
import { Post } from 'src/app/model/post';

@Component({
  selector: 'app-posts-list',
  templateUrl: './posts-list.page.html',
  styleUrls: ['./posts-list.page.scss'],
})
export class PostsListPage implements OnInit {


  posts: Post[] = [];
  spinner: boolean = true;


  constructor( private postsService: PostsService) { }

  ngOnInit() {
    console.log('======================> PostsListPage <=====================')

    this.postsService.getPostsList()
    .subscribe( 
      postsData => {
        // console.log('postsData => ', postsData)
        this.posts = postsData;
        this.spinner = false
      },
      error => {
        // console.log('error => ', error)
      });
  }


}
