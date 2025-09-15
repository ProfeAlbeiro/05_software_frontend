import { Routes } from '@angular/router';
import { Home } from './components/home/home';
import { Details } from './components/details/details';

export const routes: Routes = [
    {path:'', component:Home, title: 'Home Page'},
    {path:'details/:id', component:Details, title: 'Home Details'},
];