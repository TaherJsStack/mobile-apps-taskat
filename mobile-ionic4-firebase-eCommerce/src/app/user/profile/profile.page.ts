

@Component({
  selector: 'app-profile',
  templateUrl: './profile.page.html',
  styleUrls: ['./profile.page.scss'],
})
export class ProfilePage implements OnInit {

  cart;
  user;
  userSub: Subscription;
  userData;

  constructor( private usersService: UsersService,
               private afAuth: AngularFireAuth,
               private cartService: CartService,
               private router: Router,
               private db: AngularFireDatabase ) {

                this.afAuth.authState.subscribe( res => {

                  if (res.uid) {
                    console.log(res.uid, ' => res.uid');
                    console.log(this.db.object(`users/${res.uid}`), ' => db object');
                    this.db.object(`users/${res.uid}`)
                      .subscribe(
                        userdata =>  {
                          if (!userdata) {
                            this.router.navigateByUrl('/signin');
                          } else {
                            this.userData = userdata; console.log( userdata, ' => user data' ); }
                          }
                       );
                  }
                });

               }


  ngOnInit() {
    this.cart = this.cartService.getCartItems();
  }

  onLogout() {
    console.log('Logout Done......');
    this.usersService.logout();
  }


}
