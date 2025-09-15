import { CommonModule } from '@angular/common';
import { Component, inject } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { HousingService } from '../housing-service';
import { HousingLocationInterface } from '../housing-location-interface';
import { FormControl, FormGroup, ReactiveFormsModule } from '@angular/forms';

@Component({
  selector: 'app-details',
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './details.html',
  styleUrl: './details.css'
})
export class Details {

  route: ActivatedRoute = inject(ActivatedRoute);
  housingService = inject(HousingService);
  housingLocation: HousingLocationInterface | undefined;

  constructor(){
    const housinLocationId = Number(this.route.snapshot.params['id']);
    this.housingLocation = this.housingService.getHousingLocantionById(housinLocationId);
  }

  formAngular = new FormGroup({
    firstName: new FormControl(''),
    lastName: new FormControl(''),
    email: new FormControl(''),
  });

  onSubmit(){
    this.housingService.submitApplication(
      this.formAngular.value.firstName ?? '',
      this.formAngular.value.lastName ?? '',
      this.formAngular.value.email ?? '',
    )
  }

}