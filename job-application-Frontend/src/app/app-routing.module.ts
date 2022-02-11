import { Component, NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from './auth.guard';
import { ApplicationFormComponent } from './MyComponents/application-form/application-form.component';
import { ApplyLeaveComponent } from './MyComponents/apply-leave/apply-leave.component';
import { CreateJobFormComponent } from './MyComponents/create-job-form/create-job-form.component';
import { JobDetailsComponent } from './MyComponents/job-details/job-details.component';
import { JobListingComponent } from './MyComponents/job-listing/job-listing.component';
import { LeaveRequestsComponent } from './MyComponents/leave-requests/leave-requests.component';
import { LeavesRecordComponent } from './MyComponents/leaves-record/leaves-record.component';
import { LoginFormComponent } from './MyComponents/login-form/login-form.component';
import { ManagersComponent } from './MyComponents/managers/managers.component';
import { PasswordResetComponent } from './MyComponents/password-reset/password-reset.component';
import { UsersComponent } from './MyComponents/users/users.component';

const routes: Routes = [
  { path: '', redirectTo: '/login ', pathMatch: 'full'},
  { path:'applicant', component: ApplicationFormComponent },
  { path: 'jobs', component: JobListingComponent},
  { path: 'jobs/:id', component: JobDetailsComponent },
  { path: 'create-new-job', component: CreateJobFormComponent, canActivate: [AuthGuard]},
  { path: 'login', component:LoginFormComponent},
  {path: 'reset-password', component: PasswordResetComponent},
  {path: 'apply-leave', component: ApplyLeaveComponent, canActivate: [AuthGuard]},
  {path: 'leaves-record', component: LeavesRecordComponent, canActivate: [AuthGuard]},
  {path: 'users', component: UsersComponent, canActivate: [AuthGuard]},
  {path: 'managers', component: ManagersComponent, canActivate: [AuthGuard]},
  {path: 'leave-requests', component: LeaveRequestsComponent, canActivate: [AuthGuard]}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
