import { AuthService } from './../../api_service/auth.service';
import { Component, OnInit } from '@angular/core';
import { Storage } from '@ionic/storage';
import { Router } from '@angular/router';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.page.html',
  styleUrls: ['./profile.page.scss'],
})
export class ProfilePage implements OnInit {

  constructor(private storage: Storage, private router: Router, private authService: AuthService ) { }


  ngOnInit() {
    this.storage.get('token').then((val) => {
      if (val == null) {
        this.router.navigateByUrl('/user/login');
      }
    });
  }


  logout() {
    this.authService.logout()
    this.authService.isAuthLgin
    .subscribe(
      isAuth => {
        // console.log('logout =>', isAuth)
        if (!isAuth) {
          this.router.navigateByUrl('/user/login');          
        }
      }
    )
  }

}
