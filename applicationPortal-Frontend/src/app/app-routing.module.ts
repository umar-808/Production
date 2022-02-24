import { Component, NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from './../app/Guards/auth.guard';
import { AdminGuard } from './Guards/admin.guard';
import { ApplicantsComponent } from './MyComponents/applicants/applicants.component';
import { ApplicationFormComponent } from './MyComponents/application-form/application-form.component';
import { ApplyLeaveComponent } from './MyComponents/apply-leave/apply-leave.component';
import { ChangePasswordComponent } from './MyComponents/change-password/change-password.component';
import { CreateJobFormComponent } from './MyComponents/create-job-form/create-job-form.component';
import { JobDetailsComponent } from './MyComponents/job-details/job-details.component';
import { JobListingComponent } from './MyComponents/job-listing/job-listing.component';
import { LeaveRequestsComponent } from './MyComponents/leave-requests/leave-requests.component';
import { LeavesRecordComponent } from './MyComponents/leaves-record/leaves-record.component';
import { LoginFormComponent } from './MyComponents/login-form/login-form.component';
import { ManagersComponent } from './MyComponents/managers/managers.component';
import { PasswordResetComponent } from './MyComponents/password-reset/password-reset.component';
import { RegisterUserComponent } from './MyComponents/register-user/register-user.component';
import { UsersComponent } from './MyComponents/users/users.component';

const routes: Routes = [
  { path: '', redirectTo: '/login', pathMatch: 'full'},
  { path:'applicantion-form', component: ApplicationFormComponent},
  { path: 'jobs', component: JobListingComponent},
  { path: 'jobs/:id', component: JobDetailsComponent },
  { path: 'create-new-job', component: CreateJobFormComponent, canActivate: [AdminGuard]},
  { path: 'login', component:LoginFormComponent},
  {path: 'reset-password', component: PasswordResetComponent},
  {path: 'apply-leave', component: ApplyLeaveComponent},
  {path: 'leaves-record', component: LeavesRecordComponent},
  {path: 'users', component: UsersComponent, canActivate: [AdminGuard]},
  {path: 'managers', component: ManagersComponent, canActivate: [AdminGuard]},
  {path: 'leave-requests', component: LeaveRequestsComponent},
  {path: 'register', component: RegisterUserComponent, canActivate: [AdminGuard]},
  {path: 'change-password', component: ChangePasswordComponent},
  {path: 'applicants', component: ApplicantsComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
