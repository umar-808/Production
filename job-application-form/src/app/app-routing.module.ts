import { Component, NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ApplicationFormComponent } from './MyComponents/application-form/application-form.component';
import { JobDetailsComponent } from './MyComponents/job-details/job-details.component';
import { JobListingComponent } from './MyComponents/job-listing/job-listing.component';

const routes: Routes = [
  { path: '', redirectTo: '/jobs', pathMatch: 'full'},
  { path:'applicant', component: ApplicationFormComponent },
  { path: 'jobs', component: JobListingComponent, pathMatch: 'full'},
  { path: 'jobs/:id', component: JobDetailsComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }

export const routingComponents = [ ApplicationFormComponent, JobListingComponent ]
