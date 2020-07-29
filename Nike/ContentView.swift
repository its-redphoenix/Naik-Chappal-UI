

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        MainView()
           
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
          
        
    }
}
 


struct VerticalMenu : View {
    
    @State var index = 0
    
    var body: some View{
        
        HStack(spacing: 0){
            
            Button {
                
                index = 0
                
            } label: {
             
                VStack(spacing: 5){
                    
                    Text("Men")
                        .fontWeight(index == 0 ? .bold : .none)
                        .foregroundColor(index == 0 ? .black : .gray)
                    
                    Circle()
                        .fill(Color.black)
                        .frame(width: 8, height: 8)
                        .opacity(index == 0 ? 1 : 0)
                }
            }
            .padding(.leading)
            
            Spacer(minLength: 0)
            
            Button {
                
                index = 1
                
            } label: {
             
                VStack(spacing: 5){
                    
                    Text("Women")
                        .fontWeight(index == 1 ? .bold : .none)
                        .foregroundColor(index == 1 ? .black : .gray)
                    
                    Circle()
                        .fill(Color.black)
                        .frame(width: 8, height: 8)
                        .opacity(index == 1 ? 1 : 0)
                }
            }
            
            Spacer(minLength: 0)
            
            Button {
                
                index = 2
                
            } label: {
             
                VStack(spacing: 5){
                    
                    Text("Kids")
                        .fontWeight(index == 2 ? .bold : .none)
                        .foregroundColor(index == 2 ? .black : .gray)
                    
                    Circle()
                        .fill(Color.black)
                        .frame(width: 8, height: 8)
                        .opacity(index == 2 ? 1 : 0)
                }
            }
            
            Spacer(minLength: 0)
            
            Button {
                
                index = 3
                
            } label: {
             
                VStack(spacing: 5){
                    
                    Text("Custom")
                        .fontWeight(index == 3 ? .bold : .none)
                        .foregroundColor(index == 3 ? .black : .gray)
                    
                    Circle()
                        .fill(Color.black)
                        .frame(width: 8, height: 8)
                        .opacity(index == 3 ? 1 : 0)
                }
            }
            .padding(.trailing)

        }
        .padding(.vertical,30)
        // fixed width for view rotation...
        .frame(width: 400)
        .background(Color.black.opacity(0.1))
        .cornerRadius(15)
        // rotating view...
        .rotationEffect(.init(degrees: -90))
    }
}

struct TopMenu : View {

    var menu : Int
    @Binding var index : Int
    
    var body: some View{
    
        VStack(spacing: 8){
            
            Text(topMenu[menu])
                .font(.system(size: 22))
                .fontWeight(index == menu ? .bold : .none)
                .foregroundColor(index == menu ? .black : .gray)
            
            Circle()
                .fill(Color.blue)
                .frame(width: 10, height: 10)
                .opacity(index == menu ? 1 : 0)
        }
        .onTapGesture {
            
            withAnimation{
                
                index = menu
            }
        }
    }
}

var topMenu = ["दादर","बांद्रा","अंधेरी","चर्चगेट","गोरेगाँव"]

struct MainView : View {
    
    @State var topIndex = 0
    @State var index = 0
    @State var show = false
    @State var selectedIndex = 0
    @Namespace var name
   
    
    var body: some View{
        
        ZStack{
            
            VStack(spacing: 0){
                
                
                
                ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : .init(), showsIndicators: false) {
                    
                    VStack{
                        
                        HStack{
                            
                            Image("sandals")
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                            
                            Text("iChappals")
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Button(action: {}) {
                                
                                
                                Image(systemName: "lineweight")
                                    .font(.system(size: 21.0))
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack(spacing: 30){
                                
                                ForEach(0..<topMenu.count){menu in
                                    
                                    TopMenu(menu: menu, index: $topIndex)
                                }
                            }
                            .padding(.horizontal)
                        }
                        .padding(.top,10)
                        
                        // Vertical Menu...
                        
                        HStack{
                            
                            VerticalMenu()
                                // moving view to left...
                                .padding(.leading,-245)
                                .zIndex(1)
                            // moving view in stack for click event...
                            
                            // Scroll view....
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack(spacing: 15){
                                    
                                    ForEach(1...6,id: \.self){i in
                                        
                                        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                                            
                                            // background Nike Logo...
                                            
                                            Image("logo")
                                                .resizable()
                                                .renderingMode(.template)
                                                .frame(height: 110)
                                                .foregroundColor(Color.black.opacity(0.01))
                                                .padding(.top,55)
                                                .padding(.horizontal)
                                            
                                            VStack(alignment: .leading){
                                                
                                                Text("₹199")
                                                    .font(.system(size: 22))
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.white)
                                                
                                                Spacer(minLength: 0)
                                                
                                                Image("p\(i)")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                // rotaing image....
                                                    .rotationEffect(.init(degrees: 12))
                                                    .matchedGeometryEffect(id: "p\(i)", in: name)
                                                
                                                Spacer(minLength: 0)
                                                
                                                Text("Men's Chappal")
                                                    .foregroundColor(Color.white.opacity(0.6))
                                                
                                                Text("Taka-Tak Chappal")
                                                    .font(.system(size: 22))
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.white)
                                            }
                                        }
                                        .padding(.horizontal)
                                        .padding(.vertical)
                                        // fixed Frame...
                                        .frame(width: UIScreen.main.bounds.width - 150, height: 360)
                                        .background(Color("Color\(i)"))
                                        .cornerRadius(15)
                                        
                                        .shadow(color: Color.blue.opacity(0.3), radius: 18.0, x: 6.0, y: 9.0)                                 // opening hero animation...
                                        .onTapGesture {
                                            
                                            withAnimation(.spring()){
                                                
                                                selectedIndex = i
                                                show.toggle()
                                            }
                                        }
                                    }
                                }
                                .padding(.leading,20)
                                .padding(.trailing)
                            }
                            .padding(.leading,-165)
                        }
                        // fixed height...
                        .padding(.top,30)
                        .frame(height: 400)
                        // when view is rotated width is converted to height,...
                        
                        HStack{
                            
                            Text("Trending")
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "gift.circle.fill")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                                        }
                        .padding(.top,25)
                        .padding(.horizontal)
                        
                        // Menu...
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack(spacing: 20){
                                
                                ForEach(2...6,id: \.self){i in
                                    
                                    Image("p\(i)")
                                        .resizable()
                                        .frame(width: 55, height: 35)
                                        .rotationEffect(.init(degrees: 102))
                                        .padding(.vertical,25)
                                        .padding(.horizontal)
                                        .background(Color("Color\(i)"))
                                        .cornerRadius(45)
                                        
                                }
                            }
                            .padding(.horizontal)
                        }
                        .padding(.top,20)
                        
                        Spacer(minLength: 0)
                        
                        
                    }
                    // since all edges are ignored....
                    .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .padding(.bottom)
                }
                
                // tab View...
                
                HStack(spacing: 0){
                
                    Button {
                        
                        // animating..
                        
                        withAnimation{
                            
                            index = 0
                        }
                        
                    } label: {
                            
                        HStack(spacing: 8){
                            
                            Image(systemName: "house.fill")
                                .foregroundColor(index == 0 ? .white : Color.black.opacity(0.35))
                                .padding(10)
                                .background(index == 0 ? Color.blue : Color.clear)
                                .cornerRadius(8)
                            
                            Text(index == 0 ? "Home" : "")
                                .foregroundColor(.black)
                        }
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button {
                        
                        // animating..
                        
                        withAnimation{
                            
                            index = 1
                        }
                        
                    } label: {
                            
                        HStack(spacing: 8){
                            
                            Image(systemName: "suit.heart")
                                .foregroundColor(index == 1 ? .white : Color.black.opacity(0.35))
                                .padding(10)
                                .background(index == 1 ? Color.red : Color.clear)
                                .cornerRadius(8)
                            
                            Text(index == 1 ? "Loved" : "")
                                .foregroundColor(.black)
                        }
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button {
                        
                        // animating..
                        
                        withAnimation{
                            
                            index = 2
                        }
                        
                    } label: {
                            
                        HStack(spacing: 8){
                            
                            Image(systemName: "person.fill")
                                .foregroundColor(index == 2 ? .white : Color.black.opacity(0.35))
                                .padding(10)
                                .background(index == 2 ? Color.green : Color.clear)
                                .cornerRadius(8)
                            
                            Text(index == 2 ? "Account" : "")
                                .foregroundColor(.black)
                        }
                    }

                }
                .padding(.top)
                .padding(.horizontal,25)
                .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .background(Color.white.opacity(0.3))
                
                // since all edges are ignored...
                
            }
            
            // Hero View....
            
            if show{
                
                VStack{
                    
                    VStack{
                        
                        HStack{
                            
                            Button(action: {}) {
                                
                                Image(systemName: "suit.heart")
                                    .font(.system(size: 22))
                                    .foregroundColor(.white)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                
                                // closing hero view...
                                
                                withAnimation(.spring()){
                                    
                                    show.toggle()
                                }
                                
                            }) {
                                
                                Image(systemName: "xmark")
                                    .font(.system(size: 22))
                                    .foregroundColor(.white)
                            }
                        }
                        
                        Image("p\(selectedIndex)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 250)
                            .matchedGeometryEffect(id: "p\(selectedIndex)", in: name)
                            .rotationEffect(.init(degrees: 12))
                            .padding(.horizontal)
                    }
                    .padding()
                    .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(Color("Color\(selectedIndex)"))
                    
                    ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : .init(), showsIndicators: false) {
                        
                        HStack{
                            
                            VStack(alignment: .leading, spacing: 10) {
                                
                                Text("Men's Footwear")
                                    .foregroundColor(.gray)
                                
                                Text("Taka-Tak Chappal")
                                    .font(.system(size: 22))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                            
                            Spacer()
                            
                            Text("₹199")
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                        .padding()
                        
                        Text("These chappals are so comfortable that you will never miss a train again while wearing them. They come with a soft and flexible PU sole which makes them perfect to be worn all-day in the train.")
                            .foregroundColor(.black)
                            .padding(.top,20)
                            .padding(.horizontal)
                        
                        HStack{
                            
                            VStack(alignment: .leading, spacing: 12) {
                                
                                Text("Colors")
                                    .font(.title)
                                
                                HStack(spacing: 15){
                                    
                                    ForEach(1...6,id: \.self){i in
                                        
                                        if i != selectedIndex{
                                            
                                            Button(action: {}) {
                                                
                                                Circle()
                                                    .fill(Color("Color\(i)"))
                                                    .frame(width: 22, height: 22)
                                                    
                                            }
                                        }
                                    }
                                }
                            }
                            
                            Spacer(minLength: 0)
                        }
                        .padding(.horizontal)
                        .padding(.top,25)
                        
                        Spacer(minLength: 0)
                        
                        // Button...
                        
                        Button(action: {}) {
                            
                            HStack {
                                Text("Buy Now")
                                   
                                
                                Image(systemName: "faceid")
                                    
                                
                                
                            }
                           
                            .padding(.vertical)
                            
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 15)
                            .background(Color.black)
                            .clipShape(Capsule())
                           // .shadow(color: .gray, radius: 15, x: -9, y: -9)
                            
                            
                        }
                        .padding(.bottom,40)
                        .padding(.top)
                    }
                    
                }
                .background(Color.white)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.all))
    }
}
