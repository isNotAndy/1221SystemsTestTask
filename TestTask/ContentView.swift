//
//  ContentView.swift
//  TestTask
//
//  Created by Андрей Барсуков on 30.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedOption: Int? = nil
    
    var body: some View {
        ScrollView {
            CustomNavbarView()
            
            ZStack {
                Image("Lipa")
                    .resizable()
                    .frame(width: 300, height: 250)
                Text("Цена по карте")
                    .padding(5)
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .padding(.trailing, 270)
                    .padding(.bottom, 250)
                    .font(.caption)
                
            }
            
            ReviewView()
            
            Text("Добавка \"Липа\" к чаю 200г")
                .font(.largeTitle)
                .bold()
                .padding(.trailing, 75)
            
            HStack {
                Image("Spain")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(5)
                    .clipShape(Circle())
                
                Text("Испания, Риоха")
                    .font(.callout)
                
                Spacer()
                
            }
            
            DescriptionView()
            
            CharacteristicView()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0 ..< 5) { item in
                        SectionView()
                    }
                }
            }
            
            Button {} label: {
                Text("Оставить отзыв")
                    .foregroundColor(Color.green)
            }
            .frame(width: 350, height: 30)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.green, lineWidth: 2))
            .cornerRadius(50)

            
        }
        .padding(.top, -15)
        
        VStack {
            Picker(selection: $selectedOption, label: Text("Выберите опцию")) {
                Text("Шт").tag(0)
                Text("Кг").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .cornerRadius(50)
            
            CartView()
            
            CustomView()
            
        }
    }
}

#Preview {
    ContentView()
}

struct SectionView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Александр В.")
                .font(.headline)
                .bold()
            Text("7 мая 2021")
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(Color.orange)
                Image(systemName: "star.fill")
                    .foregroundColor(Color.orange)
                Image(systemName: "star.fill")
                    .foregroundColor(Color.orange)
                Image(systemName: "star.fill")
                    .foregroundColor(Color.orange)
                Image(systemName: "star")
            }
            Text("Хорошая добавка, мне очень понравилась! Хочу, чтобы все добавки были такими!")
        }
        .frame(width: 245, height: 245)
        .padding(.leading, 10)
        .background(Color.white)
        .shadow(color: .gray, radius: 10, x: 10, y: 10)
        .cornerRadius(50)
    }
}

struct CharacteristicView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Основные характеристики")
                    .bold()
                    .padding(.top, 10)
                    .padding(.leading, 5)
                Spacer()
            }
            HStack {
                Text("Производство")
                    .font(.callout)
                    .padding(.leading, 10)
                Spacer()
                Text("...............")
                    .foregroundColor(Color.gray)
                Spacer()
                Text("Россия, Краснодарский край")
                    .font(.callout)
                    .padding(.trailing, 10)
            }
            .padding(.top, 5)
            HStack {
                Text("Энергетическая ценность, ккал/100гр")
                    .font(.callout)
                    .padding(.leading, 10)
                Spacer()
                Text("..................")
                    .foregroundColor(Color.gray)
                Spacer()
                Text("25 ккал, 105 кДж")
                    .font(.callout)
                    .padding(.trailing, 10)
            }
            .padding(.top, 5)
            HStack {
                Text("Жиры/100г")
                    .font(.callout)
                    .padding(.leading, 10)
                Spacer()
                Text("..........................................")
                    .foregroundColor(Color.gray)
                Spacer()
                Text("0,1 г")
                    .font(.callout)
                    .padding(.trailing, 10)
            }
            .padding(.top, 5)
            HStack {
                Text("Белки/100г")
                    .font(.callout)
                    .padding(.leading, 10)
                Spacer()
                Text("..........................................")
                    .foregroundColor(Color.gray)
                Spacer()
                Text("1,3 г")
                    .font(.callout)
                    .padding(.trailing, 10)
            }
            .padding(.top, 5)
            HStack {
                Text("Углеводы/100г")
                    .font(.callout)
                    .padding(.leading, 10)
                Spacer()
                Text("...........................................")
                    .foregroundColor(Color.gray)
                Spacer()
                Text("3,3 г")
                    .font(.callout)
                    .padding(.trailing, 10)
            }
            .padding(.top, 5)
            
            HStack {
                Button {} label: {
                    Text("Все характеристики")
                        .bold()
                        .foregroundColor(Color.green)
                }
                .padding(.leading, 10)
                .padding(.top, 10)
                .font(.title3)
                Spacer()
            }
            HStack {
                Text("Отзывы")
                    .bold()
                    .padding(.leading, 10)
                    .font(.title3)
                Spacer()
                Button {} label: {
                    Text("Все 152")
                        .bold()
                        .foregroundColor(Color.green)
                }
                .padding(.trailing, 10)
            }
            .padding(.top, 10)
        }
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack {
            Text("Описание")
                .font(.title3)
                .bold()
                .padding(.trailing, 290)
                .padding(.top, 10)
            Text("Кто-то там липового цвета обладают противовоспалительным действием, способствуют укреплению стенки сосудов")
                .font(.callout)
                .padding(.trailing, 55)
        }
    }
}

struct CustomView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        HStack {
            Button(action: {
                self.selectedTab = 0
            }) {
                VStack {
                    Image(systemName: "triangle")
                        .foregroundColor(selectedTab == 0 ? .green : .black)
                    Text("Главная")
                        .font(.caption)
                        .foregroundColor(selectedTab == 0 ? .green : .black)
                }
            }
            
            Spacer()
            
            Button(action: {
                self.selectedTab = 1
            }) {
                VStack {
                    Image(systemName: "app")
                        .foregroundColor(selectedTab == 1 ? .green : .black)
                    Text("Каталог")
                        .font(.caption)
                        .foregroundColor(selectedTab == 1 ? .green : .black)
                }
            }
            
            Spacer()
            
            Button(action: {
                self.selectedTab = 2
            }) {
                VStack {
                    Image(systemName: "cart")
                        .foregroundColor(selectedTab == 2 ? .green : .black)
                    Text("Корзина")
                        .font(.caption)
                        .foregroundColor(selectedTab == 2 ? .green : .black)
                }
            }
            
            Spacer()
            
            Button(action: {
                self.selectedTab = 3
            }) {
                VStack {
                    Image(systemName: "person")
                        .foregroundColor(selectedTab == 3 ? .green : .black)
                    Text("Профиль")
                        .font(.caption)
                        .foregroundColor(selectedTab == 3 ? .green : .black)
                }
            }
        }
        .padding(.bottom, -5)
        .padding(.leading, 10)
        .padding(.trailing, 10)
        .background(Color.white)
    }
}

struct CartView: View {
    var body: some View {
        HStack {
            Text("55.9")
                .font(.title)
                .bold()
            Text("р/кг")
            Spacer()
            
            HStack {
                Button {} label: {
                    Text("-")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color.white)
                }
                .padding(.leading, 15)
                Spacer()
                VStack {
                    Text("1 шт")
                        .font(.caption)
                        .bold()
                        .foregroundColor(Color.white)
                    Text("120,0p")
                        .font(.caption)
                        .foregroundColor(Color.white)
                }
                Spacer()
                Button {} label: {
                    Text("+")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color.white)
                }
                .padding(.trailing, 15)
            }
            .frame(width: 150, height: 40)
            .background(Color.green)
            .cornerRadius(50)
            
        }
        .padding(5)
    }
}

struct ReviewView: View {
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundColor(Color.green)
            
            
            Text("4.1")
                .foregroundColor(Color.black)
                .font(.callout)
            
            Button {} label: {
                Text("| 19 отзывов")
                
            }
            .foregroundColor(Color.gray)
            
            Spacer()
            
            Text("- 5%")
                .padding(5)
                .background(Color.red)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .font(.caption)
            
        }
        .padding(5)
    }
}

struct CustomNavbarView: View {
    var body: some View {
        HStack {
            Button {} label: {
                Image(systemName: "chevron.left")
                
            }
            .padding()
            .foregroundColor(Color.green)
            
            Spacer()
            
            Button {} label: {
                Image(systemName: "doc.plaintext")
                
            }
            .padding(.trailing, 10)
            .foregroundColor(Color.green)
            
            Button {} label: {
                Image(systemName: "square.and.arrow.up")
                
            }
            .padding(.trailing, 10)
            .foregroundColor(Color.green)
            
            Button {} label: {
                Image(systemName: "heart")
                
            }
            .padding(.trailing, 10)
            .foregroundColor(Color.green)
            
        }
    }
}
