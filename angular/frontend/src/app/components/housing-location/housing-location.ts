import { Component, Input } from '@angular/core';
import { HousingLocationInterface } from '../housing-location-interface';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-housing-location',
  imports: [RouterModule, CommonModule],
  templateUrl: './housing-location.html',
  styleUrl: './housing-location.css'
})
export class HousingLocation {
  @Input() housingLocation!: HousingLocationInterface;
}