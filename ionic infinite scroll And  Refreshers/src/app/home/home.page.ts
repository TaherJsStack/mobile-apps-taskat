import { PostsService } from './../api/posts.service';
import { Component, OnInit } from '@angular/core';


@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage implements OnInit {

  url: string;
  postsData = [];
  page_number = 1;
  page_limit = 12;

  constructor( private postsService: PostsService ) {}

  ngOnInit(){
    this.loadData(false, '');
  }

  doRefresh(event) {
    this.loadData(false, '');
    event.target.complete();
  }

  loadData(isFirstLoad, event) {
    
    this.url = '?_page=' + this.page_number + '&_limit=' + this.page_limit;
    this.postsService.getPostsList(this.url)
      .subscribe((data: any) => {
        console.log('data =>', data )
        for (let i = 0; i < data.length; i++) {
          this.postsData.push(data[i]);
        }
        if (isFirstLoad)
          event.target.complete();
        this.page_number++;
      }, error => {
        console.log(error);
      })
  }

  doInfinite(event) {
    this.loadData(true, event);
  }


}
