import { PostsService } from 'src/app/providers/posts.service';
import { Post } from 'src/app/model/post';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, ParamMap } from '@angular/router';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-post',
  templateUrl: './post.page.html',
  styleUrls: ['./post.page.scss'],
})
export class PostPage implements OnInit {

  subscription: Subscription;
  spinner: boolean = true;
  post: Post;

  constructor( private route: ActivatedRoute, private postsService: PostsService ) { }

  ngOnInit() {
    console.log('==============================> PostPage <======================================')
    
    this.route.paramMap
    .subscribe( (paramMap: ParamMap ) => {
      if ( paramMap.has('id') ) {
          this.subscription = this.postsService.getPostById(+paramMap.get('id'))
          .subscribe( 
            postData => { 
              this.post = postData;
              this.spinner = false
            },
            err => { 
              // console.log('post error ==>', err)
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
