import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';

declare var google: any;

@Component({
  selector: 'app-about',
  templateUrl: './about.page.html',
  styleUrls: ['./about.page.scss'],
})
export class AboutPage implements OnInit {

  map;
  @ViewChild('map') mapRef: ElementRef;
  segmentValue = 'map';

  constructor() {}

  ngOnInit() {}

  segmentChanged(event: CustomEvent) {
    console.log(event.detail.value);
    this.segmentValue = event.detail.value;
    console.log(this.segmentValue, ' => event.detail.value');
  }

  ionViewDidLoad() {
    console.log(this.mapRef.nativeElement, ' => mapRef native Element');
    console.log(this.showMap(), ' => showMap()');
    this.showMap();
  }

  showMap() {
    const location = new google.maps.latLng(51.507351, -0.127758);
    const options = {
        center: location,
        zoom: 8
      };
    this.map = new google.maps.Map(this.mapRef.nativeElement, options);
  }



}
