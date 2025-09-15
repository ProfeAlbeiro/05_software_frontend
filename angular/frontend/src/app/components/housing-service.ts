import { Injectable } from '@angular/core';
import { HousingLocationInterface } from './housing-location-interface';

@Injectable({
providedIn: 'root'
})
export class HousingService {

  constructor() { }  

  url = 'http://localhost:3000/locations';

  async getAllHousingLocations(): Promise<HousingLocationInterface[]> {
    const data = await fetch(this.url);
    return (await data.json());
  }

  async getHousingLocationById(id:number): Promise<HousingLocationInterface | undefined> {
    const data = await fetch(`${this.url}/${id}`);
    return (await data.json()) ?? {};
  }

  submitApplication(firstName:string, lastName:string, email:string){
    console.log(`FirstName: ${firstName} - LastName: ${lastName} - Email: ${email}`)
  }

}