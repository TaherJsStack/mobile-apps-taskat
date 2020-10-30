import { UsersService } from './../../services/users.service';
import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { AuthService } from '../../services/auth.service';
import { AngularFireAuth } from '../../../../node_modules/angularfire2/auth';
import * as firebase from 'firebase';
import { AlertController } from '@ionic/angular';
import { NgForm } from '../../../../node_modules/@angular/forms';
import { AngularFireDatabase } from '../../../../node_modules/angularfire2/database';


@Component({
  selector: 'app-signin',
  templateUrl: './signin.page.html',
  styleUrls: ['./signin.page.scss'],
})
export class SigninPage implements OnInit {


  // user: Observable<firebase.User>;

  user;


  constructor(
    private authService: AuthService,
    private router:      Router,
    private userService: UsersService,
    private afAuth:      AngularFireAuth,
    private alertCtler:  AlertController,
    private db:          AngularFireDatabase,
   ) {}

  ngOnInit() {
  }

  onSignin( user: NgForm ) {
    console.log( user.value.email, user.value.password );
  
  }

  onGoogleSignin() {

    this.afAuth.auth.signInWithPopup( new firebase.auth.GoogleAuthProvider() )
    // this.afAuth.auth.signInWithRedirect( new firebase.auth.GoogleAuthProvider() )
 .............................................................

    // this.userService.googleLogin();
  }

  onFacebookSignin() {}

  onTwitterSignin() {}

  onSignup() {
    this.router.navigateByUrl('/signup');
  }

  onSkip() {
    this.router.navigateByUrl('/tabs/tabs/home');
  }

  onForgetPassword() {

    this.alertCtler.create({
      header: 'Phone',
      animated: true,
      subHeader: 'Forget Password',
      inputs: [
        {
          name: 'phone',
          type: 'number',
          min: 0,
          max: 11,
          placeholder: 'Your Phone Number!'
        }],
        buttons: [
          {
            text: 'Send Mess....',
            role: 'Send Mess....',
            cssClass: 'secondary',
            handler: () => {
              console.log('Confirm Cancel');
            }
          }
    ]}).then( forgetAlertEl =>
      forgetAlertEl.present()
    );

  }


}
