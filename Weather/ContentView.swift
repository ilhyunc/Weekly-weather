//
//  ContentView.swift
//  Weather
//
//  Created by Joe on 2024-06-25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: isNight)
            VStack{
                CityTextView(cityName: "Toronto, ON")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 29)
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.rain.fill", temperature: 28)
                    WeatherDayView(dayOfWeek: "WED", imageName: "wind", temperature: 26)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.max.fill", temperature: 32)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sun.max.fill", temperature: 34)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.fill", temperature: 31)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .white, backgroundColor: .mint)
                }
                
                Spacer()
            }
        }
//        .onAppear {
//            let button = WeatherButton(title: "Change Day Time", textColor: .white, backgroundColor: .mint)
//            
//            print(type(of: button.body))
//        }
    }
}
    
struct ContentView_Previews: PreviewProvider{
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                //.foregroundStyle(.mint, .orange, .green)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View{
    var imageName: String
    var temperature: Int
    
    var body: some View{
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
