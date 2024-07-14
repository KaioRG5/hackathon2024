import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tela"
export default class extends Controller {
  static targets = ["chart"]

  connect() {
    const ctx = document.getElementById('myChart');

    new Chart(ctx, {
      type: 'scatter',
      data: {
          labels: ['Janeiro','Fevereiro','Março','Abril', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro'],
          datasets: [{
            type: 'line',
            label: 'Valor médio por refeição',
            data: [35, 50, 40, 35, 45, 65, 75, 85,75,65,55],
            fill: false,
            borderColor: '#FFc30b'
          },

            {
            type: 'bar',
            label: 'Número de vendas',
            data: [100, 300, 200, 400, 350, 375, 250, 300, 400, 500, 450],
            borderColor: 'rgb(0, 128, 0)',
            backgroundColor: '#1d2951'
          }]
        },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  }
}
