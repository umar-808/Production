import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LeavesRecordComponent } from './leaves-record.component';

describe('LeavesRecordComponent', () => {
  let component: LeavesRecordComponent;
  let fixture: ComponentFixture<LeavesRecordComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LeavesRecordComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(LeavesRecordComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
