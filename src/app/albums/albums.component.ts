import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import albums from '../../data/albums.json';

@Component({
  selector: 'app-albums',
  templateUrl: './albums.component.html',
  styleUrls: ['./albums.component.css']
})
export class AlbumsComponent {
  albums = albums;
  defaultImage ="https://via.placeholder.com/196.png?text=dress"

  constructor(private http: HttpClient) {}
}
