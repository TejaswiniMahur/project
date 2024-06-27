package Mypackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
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
		
		// Create the URL for the OpenWeather API request
		String apiURL= "https://api.openweathermap.org/data/2.5/weather?q=" + city +"&appid="+ apiKey;
		
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
        JsonObject jsonObject = gson.fromJson(responseContent.toString(), JsonObject.class);
	}
	
	

}
