fetch("api/cars.php", {
    headers: {
        "Authorization": localStorage.getItem("token")
    }
})
.then(res => res.json())
.then(data => console.log(data));
function loadCars() {

    fetch("http://localhost/api/cars") // رابط الـ API
        .then(response => response.json())
        .then(data => {
            const container = document.getElementById("dataContainer");
            container.innerHTML = "";

            data.forEach(car => {
                const card = `
                    <div class="card">
                        <img src="images/car.png" alt="Car">
                        <h3>${car.name}</h3>
                        <p>Model: ${car.model}</p>
                        <p>Price: $${car.price}</p>
                    </div>
                `;
                container.innerHTML += card;
            });
        })
        .catch(error => {
            console.error("Error:", error);
        });
}