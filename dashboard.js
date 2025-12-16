// رابط API الصحيح للسيارات
const API_URL = "http://localhost:8000/car/all";

// عند تحميل الصفحة
document.addEventListener("DOMContentLoaded", () => {
    const loadBtn = document.getElementById("loadBtn");

    loadBtn.addEventListener("click", fetchCars);
});

// دالة جلب السيارات
async function fetchCars() {
    const loader = document.getElementById("loader");
    const cardsContainer = document.getElementById("cardsContainer");

    cardsContainer.innerHTML = "";
    loader.style.display = "block";

    const token = localStorage.getItem("token") || "";

    try {
        const response = await fetch(API_URL, {
            method: "GET",
            headers: {
                "Accept": "application/json",
                "Token": token
            }
        });

        const cars = await response.json();

        loader.style.display = "none";
        renderCars(cardsContainer, cars);

    } catch (error) {
        console.error(error);
        loader.style.display = "none";
        cardsContainer.innerHTML =
            "<p style='text-align:center; color:red;'>Error loading cars.</p>";
    }
}


// دالة عرض السيارات كبطاقات مع صورة و لون ديناميكي
function renderCars(container, cars) {
    container.innerHTML = "";

    if (!Array.isArray(cars) || cars.length === 0) {
        container.innerHTML = "<p style='text-align:center;'>No cars found.</p>";
        return;
    }

    cars.forEach(car => {
        const card = document.createElement("div");

        // تحديد لون الإطار حسب لون السيارة
        let borderColor = "#ccc";
        const colorLower = (car.color || "").toLowerCase();

        if (colorLower.includes("white")) borderColor = "#d9d9d9";
        else if (colorLower.includes("black")) borderColor = "#000000";
        else if (colorLower.includes("red")) borderColor = "#ff4d4d";
        else if (colorLower.includes("blue")) borderColor = "#4d79ff";
        else if (colorLower.includes("silver")) borderColor = "#bfbfbf";
        else if (colorLower.includes("gray")) borderColor = "#808080";
        else if (colorLower.includes("yellow")) borderColor = "#ffd633";

        card.className = "card";
        card.style.border = `3px solid ${borderColor}`;

        // صورة السيارة (placeholder)
        const imgSrc = car.image_url && car.image_url.trim() !== ""
            ? car.image_url
            : "https://via.placeholder.com/300x180?text=Car+Image";

        // محتوى البطاقة
        card.innerHTML = `
            <img src="${imgSrc}" class="card-img" alt="Car Image">

            <h3 class="card-title">${car.brand} ${car.model}</h3>

            <p class="card-info"><strong>Year:</strong> ${car.year}</p>
            <p class="card-info"><strong>Color:</strong> ${car.color}</p>
            <p class="card-info"><strong>ID:</strong> ${car.id}</p>
        `;

        container.appendChild(card);
    });
}
