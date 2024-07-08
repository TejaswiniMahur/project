<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.company.dao.UserDao" %> <!-- Import the Java class -->
<%@ page import="com.company.dao.UserDaoImpl" %> <!-- Import the Java class -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weather App</title>
     <link rel="stylesheet" href="style.css" />
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>

<style>
    * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Ubuntu", sans-serif;
}

body {
  display: flex;
  height: 100vh;
  align-items: center;
  justify-content: center;
  background: linear-gradient(to right,  #2b40ff,#07121a);
}

.mainContainer {
  width: 25rem;
  height: auto;
  border-radius: 1rem;
  background: #fff;
  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(0,0,0,0.22);
}

.weatherDetails {
  padding: 1rem;
}

.weatherIcon {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

.weatherIcon img {
  max-width: 100%;
  width: 8rem;
}

.weatherDetails .temp {
  font-size: 2rem;
  text-align: center;
}

.cityDetails {
  color: #323232;
  font-size: 2.5rem;
  text-align: center;
  margin-bottom: 0.5rem;
}

.cityDetails .date {
  font-size: 1.5rem;
  text-align: center;
  margin-bottom: 0.5rem;
}

.windDetails {
  display: flex;
  justify-content: space-around;
  margin-top: 1rem;
  margin-bottom: 1.5rem;
}

.windDetails .humidityBox,
.windDetails .windSpeed {
  display: flex;
  align-items: center;
}

.windDetails .humidityBox img,
.windDetails .windSpeed img {
  max-height: 3rem;
  margin-right: 0.5rem;
}

.windDetails .humidityBox .humidity,
.windDetails .windSpeed .wind {
  display: flex;
  flex-direction: column;
  align-items: center;
  color: #323232;
}

.center {
  display: flex;
  justify-content: center;
  align-items: center;
  border: 3px solid green;
}

.saveBtn {
  background: red;
  height: 30px;
  width: 50px;
}

.image-logo {
  height: auto;
  width: auto;
  filter: drop-shadow(20px 10px 10px black);
}
</style>

<body>

    <div class="mainContainer">
        <div class="weatherDetails">
            <div class="weatherIcon">
                <img src="" alt="Weather Icon" id="weather-icon">
                <h2 class="temp" id="temperature">${temperature} °C</h2>
                <input type="hidden" id="wc" value="${weatherCondition}" />
            </div>
            
            <div class="cityDetails">
                <div class="desc"><strong>${city}</strong></div>
                <div class="date">${date}</div>
            </div>
            
            <div class="windDetails">
                <div class="humidityBox">
                    <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhgr7XehXJkOPXbZr8xL42sZEFYlS-1fQcvUMsS2HrrV8pcj3GDFaYmYmeb3vXfMrjGXpViEDVfvLcqI7pJ03pKb_9ldQm-Cj9SlGW2Op8rxArgIhlD6oSLGQQKH9IqH1urPpQ4EAMCs3KOwbzLu57FDKv01PioBJBdR6pqlaxZTJr3HwxOUlFhC9EFyw/s320/thermometer.png" alt="Humidity">
                    <div class="humidity">
                        <span>Humidity</span>
                        <h2 id="humidity">${humidity}</h2>
                    </div>
                </div>
               
                <div class="windSpeed">
                    <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiyaIguDPkbBMnUDQkGp3wLRj_kvd_GIQ4RHQar7a32mUGtwg3wHLIe0ejKqryX8dnJu-gqU6CBnDo47O7BlzCMCwRbB7u0Pj0CbtGwtyhd8Y8cgEMaSuZKrw5-62etXwo7UoY509umLmndsRmEqqO0FKocqTqjzHvJFC2AEEYjUax9tc1JMWxIWAQR4g/s320/wind.png" alt="Wind Speed">
                    <div class="wind">
                        <span>Wind Speed</span>
                        <h2 id="windspeed">${windSpeed} km/h</h2>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container">
            <div class="center">
                <button class="saveBtn" onClick="saveToDB()">Save</button>
            </div>
        </div>
    </div>

    <script>
        var weatherIcon = document.getElementById("weather-icon");
        var val = document.getElementById("wc").value.trim().toLowerCase(); // Ensure lowercase comparison
        
        switch (val) {
            case 'clouds':
                weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiwFTkt5z_dxU6w1UnS1PxiZV3HDiPGsAW5Lrsp09MnlCmkQre9GzO8MnGytaaY1eZoqBN6SMJ4U578_uDtiuXswovr1T3o-Kt5KK0mlN_zC0RDodJFaKHQ3Uk-HIZ3vuMvAKNJi8DDFwWA7F6BOxz78Oh-UePwJTuc3PG0ZIZypPE1xlMPl5z46joaEw/s320/Clouds.png";
                break;
            case 'clear':
                weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj7pmzNCftryAfpa1YBSzVeYtjgxDQnw09Ug0HVV47J8GEtHPYTH9hJgZ2M1k0YgE0pcZ1qekr4C14zyPCiVuQAfXLClK8Ww3hYB6v77yElP7Lo5BnUKo4n-w6yB17FAbw51WST6YKS0GMwyA4fYNxOZxEyNL6HhUfFRgVhOW0GyRdBRriMHFQ-qfh4cA/s320/sun.png";
                break;
            case 'rain':
                weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgDW_NdwvxV796rkFf43qmUDiTQePn5dg7PDfn1SijfpjtB0AWJMBcifU6LWyW7iOtjZhfqIJnKEGQ1PwbbXS7NoKMSAmvy7i2ljWXMYLue3EBIBBR2qTFbs6QCe5eoFr2CU9WzCVJ8u0J3z3eAo3Ajv1LXamZASFtbj9sA_gD-Kp3hfgAk17Xh17RoLQ/s320/rainy.png";
                break;
            case 'mist':
                weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgVpL23l0t1U_ibWi01TFcHMF6J_t-9Ada5PavGlwG4M_mKIcx0pV1md9SN9ip1d84NaVowml5Do16XO3nsuttnM2-Ov05d-wCjEYjdzaOYfKvijw8k6Hfj9pOiPyEZTp2W20EPbTeONTgJE2Rdxs4KZUfg6f2PmbMF1094NcqJ7DwSFUQwYiRmVCNvuA/s320/mist.png";
                break;
            case 'snow':
                weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj-P3iT_uQK95qFY4h7QGdEtbRc1aVQo9BZy0ZWyPBvCNrP-4wnRStw0xYj9e4xa4ZlYISeNZqVJ33UP4YukR4jBennDD_obIN4QxYNZHdzG_z6_MNL2U08wMXwdFhtfvitW5LGiHgrwMJFC8QJFqbSO3woGSBqOdagGxaEQ20_S31Gc-GYL4vYzPzaPw/s320/snow.png";
                break;
            case 'haze':
                weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjld66Ia5g_hpBn3Impi3zzOBHqWkjQInGLxTb2uXksuCsrkQU8HjlVyLobEJEGg8fRSIxeFzldGEHUmWcaiZBwAcRy4dGDpFX1BjTSB56qmBjW5tEW3RSC9_mCuLU_a8RuXchxGY7Oc8HLLl-IfaDW19Z0ZJJfNae9tECXRIyEu7rmJ3da08z8cI-phw/s320/haze.png";
                break;
            default:
                // Default to clear weather icon
                weatherIcon.src = "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj7pmzNCftryAfpa1YBSzVeYtjgxDQnw09Ug0HVV47J8GEtHPYTH9hJgZ2M1k0YgE0pcZ1qekr4C14zyPCiVuQAfXLClK8Ww3hYB6v77yElP7Lo5BnUKo4n-w6yB17FAbw51WST6YKS0GMwyA4fYNxOZxEyNL6HhUfFRgVhOW0GyRdBRriMHFQ-qfh4cA/s320/sun.png";
                break;
        }
        
        async function saveToDB() {
            const windspeed = document.getElementById("windspeed").textContent;
            const temperature = document.getElementById("temperature").textContent;
            const humidity = document.getElementById("humidity").textContent;
            
            // Retrieving username from cookies
            let username = document.cookie.split(";")[0].split("=")[1];
            
            
            // Redirect with parameters
            window.location.href = `saveCard?temperature=${temperature}&humidity=${humidity}&windspeed=${windspeed}&username=${username}`;
        }
    </script>
</body>

</html>
