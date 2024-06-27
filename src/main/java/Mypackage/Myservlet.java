package Mypackage;

import jakarta.servlet.ServletException;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Date;
import java.util.Scanner;


public class Myservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Myservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings({ "deprecation", "unused" })
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		// API Setup
		String apiKey = "9b2ff188cb9b79b3b7e96cf1d1a1e870";
		
		// Get the city from the input form
		String city = request.getParameter("City");
		double latitude = Double.parseDouble(request.getParameter("Latitude"));
        double longitude = Double.parseDouble(request.getParameter("Longitude"));

        // Create the URL for the OpenWeather API request
        String apiURL = "https://api.openweathermap.org/data/2.5/weather?q=" + city + "&lat=" + latitude + "&lon=" + longitude + "&appid=" + apiKey;
		
		// API Integration
		URL url = new URL(apiURL);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        
        // Reading the data from network
        InputStream inputStream = connection.getInputStream();
        InputStreamReader reader = new InputStreamReader(inputStream);
       // System.out.println(reader);
        
        // storing in string
        StringBuilder responseContent = new StringBuilder();
        
        // For taking the input from the reader
        Scanner scanner = new Scanner(reader);
        
        while (scanner.hasNext()) {
            responseContent.append(scanner.nextLine());
        }
        System.out.println(responseContent);
        scanner.close();
        
        // Parse the JSON response to extract temperature, date, and humidity
        Gson g = new Gson();
        JsonObject jsonObject = g.fromJson(responseContent.toString(), JsonObject.class);
        System.out.println(jsonObject);
        
      //Date & Time
        long dateTimestamp = jsonObject.get("dt").getAsLong() * 1000;
        String date = new Date(dateTimestamp).toString();
        
        //Temperature
        double temperatureKelvin = jsonObject.getAsJsonObject("main").get("temp").getAsDouble();
        int temperatureCelsius = (int) (temperatureKelvin - 273.15);
       
        //Humidity
        int humidity = jsonObject.getAsJsonObject("main").get("humidity").getAsInt();
        
        //Wind Speed
        double windSpeed = jsonObject.getAsJsonObject("wind").get("speed").getAsDouble();
        
        //Weather Condition
        String weatherCondition = jsonObject.getAsJsonArray("weather").get(0).getAsJsonObject().get("main").getAsString();
        
        // Set the data as request attributes (for sending to the jsp page)
        request.setAttribute("date", date);
        request.setAttribute("city", city);
        request.setAttribute("temperature", temperatureCelsius);
        request.setAttribute("weatherCondition", weatherCondition); 
        request.setAttribute("humidity", humidity);    
        request.setAttribute("windSpeed", windSpeed);
        request.setAttribute("weatherData", responseContent.toString());
        
        connection.disconnect();
      // Forward the request to the weather.jsp page for rendering
      request.getRequestDispatcher("Index.jsp").forward(request, response);
	}
	 
	

}
