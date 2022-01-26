import { Component, NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from './auth.guard';
import { ApplicationFormComponent } from './MyComponents/application-form/application-form.component';
import { CreateJobFormComponent } from './MyComponents/create-job-form/create-job-form.component';
import { JobDetailsComponent } from './MyComponents/job-details/job-details.component';
import { JobListingComponent } from './MyComponents/job-listing/job-listing.component';
import { LoginFormComponent } from './MyComponents/login-form/login-form.component';

const routes: Routes = [
  { path: '', redirectTo: '/jobs', pathMatch: 'full'},
  { path:'applicant', component: ApplicationFormComponent },
  { path: 'jobs', component: JobListingComponent},
  { path: 'jobs/:id', component: JobDetailsComponent },
  { path: 'create-new-job', component: CreateJobFormComponent, canActivate: [AuthGuard]},
  { path: 'login', component:LoginFormComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
