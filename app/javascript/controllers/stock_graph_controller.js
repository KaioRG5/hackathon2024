import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="stock-graph"
export default class extends Controller {
  static targets = ["canvas"]

  connect() {
    console.log("StockGraphController connected!");
    console.log(this.canvasTarget); // Check if this logs the canvas element

    const products = [
      { name: "Tomates", quantity: 50 },
      { name: "Alface", quantity: 30 },
      { name: "Peito de frango", quantity: 100 },
      { name: "Filé de salmão", quantity: 50 },
      { name: "Bacon", quantity: 40 },
    ];

    // Sort products by quantity
    products.sort((a, b) => a.quantity - b.quantity);

    const labels = products.map(product => product.name);
    const quantities = products.map(product => product.quantity);

    const colors = quantities.map(quantity => {
      if (quantity < 50) {
        return '#c80815'; // Darker Pastel Red
      } else if (quantity < 100) {
        return '#FFc30b'; // Darker Pastel Yellow
      } else {
        return '#1d2951'; // Darker Pastel blue
      }
    });

    const data = {
      labels: labels,
      datasets: [{
        label: 'Quantidade em estoque',
        data: quantities,
        backgroundColor: colors,
      }]
    };

    const config = {
      type: 'bar',
      data: data,
      options: {
        indexAxis: 'y',
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    };

    new Chart(this.canvasTarget, config);
  }
}
