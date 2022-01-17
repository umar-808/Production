import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CreatJobFormComponent } from './creat-job-form.component';

describe('CreatJobFormComponent', () => {
  let component: CreatJobFormComponent;
  let fixture: ComponentFixture<CreatJobFormComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CreatJobFormComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CreatJobFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
