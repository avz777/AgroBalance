//
//  ContentView.swift
//  AgroBalance
//
//  Created by Andrey Zhuravlev on 26/4/25.
//

import SwiftUI

//Read data from crop.csv

extension Bundle {
    ///Crop
    func readCrop(filename: String) -> [String] {
        
        guard let url = self.url(forResource: filename, withExtension: "csv") else {
            fatalError("Failed to find $filename).csv in bundle.")
          
        }
        var crops: [String] = []
        do {
            let data = try Data(contentsOf: url)
           
            let csvString = String(data: data, encoding: .utf8)!
            let lines = csvString.split(separator: "\r\n")
            for line in lines {
                let columns = line.split(separator: ",")
                crops.append(String(columns[1]))
            }
            
            return(crops)
            
        } catch {
            fatalError("Failed to load or parse $filename).csv: $error)")
        }
       
    }
    ///dN
    
    func readN(filename: String) -> [Double] {
        
        guard let url = self.url(forResource: filename, withExtension: "csv") else {
            fatalError("Failed to find $filename).csv in bundle.")
          
        }
        var dN: [Double] = []
        do {
            let data = try Data(contentsOf: url)
           
            let csvString = String(data: data, encoding: .utf8)!
            let lines = csvString.split(separator: "\r\n")
            for line in lines {
                let columns = line.split(separator: ",")
                dN.append(Double(columns[2])!)
            }
            
            return(dN)
            
        } catch {
            fatalError("Failed to load or parse $filename).csv: $error)")
        }
       
    }
    
   //dP
    func readP(filename: String) -> [Double] {
        
        guard let url = self.url(forResource: filename, withExtension: "csv") else {
            fatalError("Failed to find $filename).csv in bundle.")
          
        }
        var dP: [Double] = []
        do {
            let data = try Data(contentsOf: url)
           
            let csvString = String(data: data, encoding: .utf8)!
            let lines = csvString.split(separator: "\r\n")
            for line in lines {
                let columns = line.split(separator: ",")
                dP.append(Double(columns[3])!)
            }
            
            return(dP)
            
        } catch {
            fatalError("Failed to load or parse $filename).csv: $error)")
        }
       
    }
    
    //dK
    func readK(filename: String) -> [Double] {
        
        guard let url = self.url(forResource: filename, withExtension: "csv") else {
            fatalError("Failed to find $filename).csv in bundle.")
          
        }
        var dK: [Double] = []
        do {
            let data = try Data(contentsOf: url)
           
            let csvString = String(data: data, encoding: .utf8)!
            let lines = csvString.split(separator: "\r\n")
            for line in lines {
                let columns = line.split(separator: ",")
                dK.append(Double(columns[4])!)
            }
            
            return(dK)
            
        } catch {
            fatalError("Failed to load or parse $filename).csv: $error)")
        }
       
    }
    
    ///pH
    func readpH(filename: String) -> [Double] {
        
        guard let url = self.url(forResource: filename, withExtension: "csv") else {
            fatalError("Failed to find $filename).csv in bundle.")
          
        }
        var pHopt: [Double] = []
        do {
            let data = try Data(contentsOf: url)
           
            let csvString = String(data: data, encoding: .utf8)!
            let lines = csvString.split(separator: "\r\n")
            for line in lines {
                let columns = line.split(separator: ",")
               pHopt.append(Double(columns[5])!)
            }
            
            return(pHopt)
            
        } catch {
            fatalError("Failed to load or parse $filename).csv: $error)")
        }
       
    }
    
    
}


struct ContentView: View {
    @State var textH: String = "0.0"
    @State var textN: String = "0.0"
    @State var textP: String = "0.0"
    @State var textK: String = "0.0"
    
    @State var d: String = ""
    @State var H: Double = 10.0
    @State var pH: Double = 7.0
    @State var N: Double = 0.0
    @State var P: Double = 0.0
    @State var K: Double = 0.0
    @State var N1: Double = 12.0
    @State var P1: Double = 10.0
    @State var K1: Double = 14.0
    @State var N2: Double = 60.0
    @State var P2: Double = 40.0
    @State var K2: Double = 70.0
    
    @State var USN: Double = 0.0
    @State var USP: Double = 0.0
    @State var USK: Double = 0.0
    
    @State var MN: Double = 0.0
    @State var MP: Double = 0.0
    @State var MK: Double = 0.0
    
    @State var NP: Double = 0.0
    @State var PP: Double = 0.0
    @State var KP: Double = 0.0
    @State var VN: Double = 0.0
    @State var VP: Double = 0.0
    @State var VK: Double = 0.0
    @State var WN: Double = 0.0
    @State var WP: Double = 0.0
    @State var WK: Double = 0.0
    @State var VWN: Double = 0.0
    @State var VWP: Double = 0.0
    @State var VWK: Double = 0.0
    @State var needN: Double = 0.0
    @State var needP: Double = 0.0
    @State var needK: Double = 0.0
    @State var C: Int = 0
    @State private var isEditing = false
    @State private var isEditing1 = false
    @State private var selectedIndex: Int? = 0
    @State private var SoilIndex: Int? = 0
    
    
    //    Crops - read fron csv; Items - crop type
    let Items = Bundle.main.readCrop(filename: "Crops")
    let dN = Bundle.main.readN(filename: "Crops")
    let dP = Bundle.main.readP(filename: "Crops")
    let dK = Bundle.main.readK(filename: "Crops")
    let pHopt = Bundle.main.readpH(filename: "Crops")
    
    let Soil = ["Дерново-подзолистые почвы: тяжелосуглинистые и глинистые", "Дерново-подзолистые почвы: легко- и среднесуглинистые", "Дерново-подзолистые почвы: супесчаные", "Дерново-подзолистые почвы: песчаные", "Торфяно-болотные"]
    
    
    var body: some View {
  //      Color(red: 0.0, green: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, blue: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
        ScrollView(.vertical) {
            ScrollView(.horizontal) {
                HStack {
                    VStack {
                        
                        Text("AgroBalance")
                        
                        List {
                            ForEach(Items.indices, id: \.self) { index in
                                Button(action: {
                                    self.selectedIndex = index
                                }) {
                                    Text(Items[index])
                                    
                                }
                                .padding(.leading)
                                
                            }
                            
                        }
                        
                        if let selectedIndex = selectedIndex {
                            
                            Text(Items[selectedIndex])
                                .multilineTextAlignment(.leading)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.black)
                                .cornerRadius(8)
                        } else {
                            Text("Выберите культуру из списка")
                                .padding()
                        }
                        
                        
                        Slider(value: $H, in: 0...90,
                               onEditingChanged: { editing in
                            isEditing = editing
                        })
                        
                        Text("Урожайность (т/га) " + String(Int(H)))
                        ///Soil
                        List {
                            ForEach(Soil.indices, id: \.self) { index in
                                Button(action: {
                                    self.SoilIndex = index
                                }) {
                                    Text(Soil[index])
                                    
                                }
                            }
                        }
                        
                        if let SoilIndex = SoilIndex {
                            Text(Soil[SoilIndex])
                                .multilineTextAlignment(.leading)
                                .padding()
                                .background(Color.yellow)
                                .foregroundColor(.black)
                                .cornerRadius(8)
                        } else {
                            Text("Выберите почву из списка")
                                .padding()
                        }
                        
                        ///Content of N P K
                        
                        
                        Text("Содержание азота в пахотном слое (мг/кг)")
                        TextField("N ", text: $textN)
                            .onSubmit {
                                N=Double((textN))!
                                NP=3.0*N
                            }
                        Text(String(N))
                        
                        Text("Содержание фосфора в пахотном слое (мг/кг)")
                        TextField("P ", text: $textP)
                            .onSubmit {
                                P=Double((textP))!
                                PP=3.0*P
                            }
                        Text(String(P))
                        
                        Text("Содержание калия в пахотном слое (мг/кг)")
                        TextField("K ", text: $textK)
                            .onSubmit {
                                K=Double((textK))!
                                KP=3.0*K
                            }
                        Text(String(K))
                        
                        //// pH
                        
                        Slider(value: $pH, in: 3...9,
                               onEditingChanged: { editing in
                            isEditing1 = editing
                        })
                        
                        Text("pH " + String(round(value: pH, toDecimalPlaces: 2)))
                        
                        //CALCULATION
                        
                        Button("ВЫЧИСЛИТЬ", systemImage: "arrow.up") {
                            
                            // Caculate
                            VN=H*dN[selectedIndex!]
                            VP=H*dP[selectedIndex!]
                            VK=H*dK[selectedIndex!]
                            
                            USN=N1*NP/100.0
                            USP=P1*PP/100.0
                            USK=K1*KP/100.0
                            WN = 21.0
                            WP = 2.0
                            WK = 14.0
                            
                            if SoilIndex == 0 {
                                WN = 11.0
                                WP = 1.0
                                WK = 11.0
                            }
                            if SoilIndex == 1 {
                                WN = 15.0
                                WP = 2.0
                                WK = 13.0
                            }
                            if SoilIndex == 2 {
                                WN = 26.0
                                WP = 3.0
                                WK = 13.0
                            }
                            if SoilIndex == 3 {
                                WN = 28.0
                                WP = 4.0
                                WK = 20.0
                            }
                            if SoilIndex == 4 {
                                WN = 24.0
                                WP = 2.0
                                WK = 15.0
                            }
                            
                            VWN = (VN+WN)
                            VWP = (VP+WP)
                            VWK = (VK+WK)
                            
                            MN = VWN - USN
                            MP = VWP - USP
                            MK = VWK - USK
                            
                            MN=MN*100.0/N2
                            MP=MP*100.0/P2
                            MK=MK*100.0/K2
                            
                        }
                    }
                    .padding()
                    //       .background(
                    //           Image("1.jpeg")
                    //              .resizable()
                    //               .scaledToFill()
                    //              .edgesIgnoringSafeArea(.all)
                    
                    
                    VStack {
                        Text("Вычисленные значения")
                            .padding()
                            .bold()
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                        
                        Text("Оптимальная pH")
                        Text(String(pHopt[selectedIndex!]))
                        
                        Text("Содержание азота в пахотном слое (кг/га)")
                        
                        Text(String(NP))
                            .padding()
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                        
                        Text("Содержание фосфора в пахотном слое (кг/га)")
                        
                        Text(String(PP))
                            .padding()
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                        
                        Text("Содержание калия в пахотном слое (кг/га)")
                        
                        Text(String(KP))
                            .padding()
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                        
                        Text("Будет использовано растениями из почвы (кг/га)")
                            .bold()
                        Text("N")
                        Text(String(USN))
                            .padding()
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                        
                        Text("P")
                        Text(String(USP))
                            .padding()
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                        
                        Text("K")
                        Text(String(USK))
                            .padding()
                            .background(Color.yellow)
                            .foregroundColor(.black)
                            .cornerRadius(8)
                        
                        
                        
              
                   


                        Text("Необходимо внести (кг/га)")
                            .bold()
                        HStack{
                            
                            Text("N")
                            Text(String(Int(MN)))
                                .padding()
                                .background(Color.mint)
                                .foregroundColor(.black)
                                .cornerRadius(8)
                            
                            Text("P")
                            Text(String(Int(MP)))
                                .padding()
                                .background(Color.mint)
                                .foregroundColor(.black)
                                .cornerRadius(8)
                            
                            Text("K")
                            Text(String(Int(MK)))
                                .padding()
                                .background(Color.mint)
                                .foregroundColor(.black)
                                .cornerRadius(8)
                        }
                            if pH<pHopt[selectedIndex!] {
                                Text("Доломитовая мука")
                                
                                if pH<4.5 {
                                    Text("5-6 т/га")
                                        .padding()
                                        .background(Color.mint)
                                        .foregroundColor(.black)
                                        .cornerRadius(8)
                                }
                                if (pH >= 4.5 && pH < 5.2) {
                                    Text("4.5-6 т/га")
                                        .padding()
                                        .background(Color.mint)
                                        .foregroundColor(.black)
                                        .cornerRadius(8)
                                }
                                
                                if (pH >= 5.2 && pH < 6.6) {
                                    Text("3.5-4.5 т/га")
                                        .padding()
                                        .background(Color.mint)
                                        .foregroundColor(.black)
                                        .cornerRadius(8)
                                }
                            }
                    
                    }
                    
                    
                }
                

                
            }
            
        }
    }
}

#Preview {
    ContentView()

}
