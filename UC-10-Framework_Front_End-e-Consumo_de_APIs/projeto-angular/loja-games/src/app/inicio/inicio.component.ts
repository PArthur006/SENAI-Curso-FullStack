import { Component, HostListener } from '@angular/core';

@Component({
  selector: 'app-inicio',
  templateUrl: './inicio.component.html',
  styleUrls: ['./inicio.component.css'],
})
export class InicioComponent {
  gridCols: number = 3;

  @HostListener('window:resize', ['$event'])
  onResize(event: any) {
    this.setGridCols(window.innerWidth);
  }

  ngOnInit() {
    this.setGridCols(window.innerWidth);
  }

  setGridCols(width: number) {
    if (width <= 768) {
      this.gridCols = 1;
    } else if (width <= 1024) {
      this.gridCols = 2;
    } else {
      this.gridCols = 3;
    }
  }

  getGridCols(): number {
    return this.gridCols;
  }
}
