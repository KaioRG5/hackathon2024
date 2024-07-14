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
      { name: "Ovos", quantity: 200 },
      { name: "Leite", quantity: 150 },
      { name: "Cheddar", quantity: 60 },
      { name: "Parmesão", quantity: 40 },
      { name: "Manteiga", quantity: 70 },
      { name: "Azeite de Oliva", quantity: 100 },
      { name: "Alho", quantity: 30 },
      { name: "Cebola", quantity: 70 },
      { name: "Pimentão", quantity: 50 },
      { name: "Cogumelos", quantity: 60 },
      { name: "Cenouras", quantity: 80 },
      { name: "Batatas", quantity: 90 },
      { name: "Espinafre", quantity: 40 },
      { name: "Filé mignon", quantity: 100 },
      { name: "Macarrão", quantity: 200 },
      { name: "Arroz", quantity: 250 },
      { name: "Sal", quantity: 300 },
      { name: "Black Pepper", quantity: 100 },
      { name: "Paprika", quantity: 70 },
      { name: "Manjericão", quantity: 30 },
      { name: "Orégano", quantity: 40 },
    ];

    // Sort products by quantity
    products.sort((a, b) => a.quantity - b.quantity);

    const labels = products.map(product => product.name);
    const quantities = products.map(product => product.quantity);

    const colors = quantities.map(quantity => {
      if (quantity < 50) {
        return '#FF9999'; // Darker Pastel Red
      } else if (quantity < 100) {
        return '#FFFF99'; // Darker Pastel Yellow
      } else {
        return '#99FF99'; // Darker Pastel Green
      }
    });

    const data = {
      labels: labels,
      datasets: [{
        label: 'Stock Quantity',
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
