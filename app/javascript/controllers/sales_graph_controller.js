import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tela"
export default class extends Controller {
  static targets = ["chart"]

  connect() {
    const ctx = document.getElementById('myChart');

    new Chart(ctx, {
      type: 'scatter',
      data: {
          labels: ['Janeiro','Fevereiro','Março','Abril'],
          datasets: [{
            type: 'bar',
            label: 'Número de vendas',
            data: [100, 300, 200, 400],
            borderColor: 'rgb(0, 128, 0)',
            backgroundColor: 'rgba(0, 128, 0, 0.2)'
          }, {
            type: 'line',
            label: 'Valor médio por refeição',
            data: [35, 50, 40, 35],
            fill: false,
            borderColor: 'rgb(54, 162, 235)'
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
