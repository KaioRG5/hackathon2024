import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="stock-graph"
export default class extends Controller {
  static targets = ["canvas"]

  connect() {
    console.log("StockGraphController connected!");
    console.log(this.canvasTarget); // Check if this logs the canvas element

    const products = [
      { name: "Tomatoes", quantity: 50 },
      { name: "Lettuce", quantity: 30 },
      { name: "Chicken Breast", quantity: 100 },
      { name: "Salmon Fillet", quantity: 50 },
      { name: "Bacon", quantity: 40 },
      { name: "Eggs", quantity: 200 },
      { name: "Milk", quantity: 150 },
      { name: "Cheddar Cheese", quantity: 60 },
      { name: "Parmesan Cheese", quantity: 40 },
      { name: "Butter", quantity: 70 },
      { name: "Olive Oil", quantity: 100 },
      { name: "Garlic", quantity: 30 },
      { name: "Onions", quantity: 70 },
      { name: "Bell Peppers", quantity: 50 },
      { name: "Mushrooms", quantity: 60 },
      { name: "Carrots", quantity: 80 },
      { name: "Potatoes", quantity: 90 },
      { name: "Spinach", quantity: 40 },
      { name: "Beef Steak", quantity: 100 },
      { name: "Pasta", quantity: 200 },
      { name: "Rice", quantity: 250 },
      { name: "Salt", quantity: 300 },
      { name: "Black Pepper", quantity: 100 },
      { name: "Paprika", quantity: 70 },
      { name: "Basil", quantity: 30 },
      { name: "Oregano", quantity: 40 },
    ];

    // Sort products by quantity
    products.sort((a, b) => a.quantity - b.quantity);

    const labels = products.map(product => product.name);
    const quantities = products.map(product => product.quantity);

    const colors = quantities.map(quantity => {
      if (quantity < 50) {
        return 'red';
      } else if (quantity < 100) {
        return 'yellow';
      } else {
        return 'green';
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
