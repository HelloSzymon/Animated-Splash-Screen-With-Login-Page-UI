//
//  ContentView.swift
//  Animated Splash Screen With Login Page UI
//
//  Created by Szymon Wnuk on 17/01/2024.
//

import SwiftUI
import Lottie

struct ContentView: View {
    var body: some View {
        SplashScreen(phNo: .constant("1234"))
    }
}

#Preview {
    ContentView()
}


struct SplashScreen: View {
    @State var show = false
    @Binding var phNo: String
    var body: some View{
        VStack{
            ZStack{
                Color("bg")
                    .ignoresSafeArea()
                VStack{
                    AnimatedView(show: $show)
                        .frame(height: UIScreen.main.bounds.height / 2)
                        .scaleEffect(0.9)
                    VStack{
                        HStack{
                            VStack(alignment: .leading, spacing: 10, content: {
                                Text("Login")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.black)
                                
                                Text("Enter your phone numer")
                                    .foregroundStyle(.gray)
                                
                            }
                                   
                            )
                            //
                            Spacer(minLength: 15)
                        }
                        
                        VStack{
                            HStack(spacing: 15){
                                Text("+1")
                                    .foregroundStyle(.black)
                                Rectangle()
                                    .fill(Color("bg"))
                                    .frame(width: 1, height: 18)
                                
                                TextField("", text: $phNo)
                            }
                            Divider()
                                .background(Color("bg"))
                            
                        }
                        .padding(.vertical)
                        Button{
                        }label: {
                            Text("Verify your number")
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .padding(.vertical, 10)
                                .frame(width: UIScreen.main.bounds.width - 60)
                                .background(Color("bg"))
                                .clipShape(.capsule)
                        }
                        HStack{
                            Rectangle()
                                .fill(Color.black.opacity(0.3))
                                .frame(height: 1)
                            Text("OR")
                                .fontWeight(.bold)
                                .foregroundStyle(Color.black.opacity(0.3))
                            Rectangle()
                                .fill(Color.black.opacity(0.3))
                                .frame(height: 1)
                        }
                        .padding(.vertical)
                        
                        HStack(spacing: 15) {
                            Button{
                            }label: {
                                HStack(spacing: 10){
                                    
                                    Image("fb")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25)
                                    Text("Facebook")
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                }
                                    .padding(.vertical, 10)
                                    .frame(width: ( UIScreen.main.bounds.width - 80) / 2)
                                    .background(Color("fb"))
                                    .clipShape(.capsule)
                            }
                            
                            Button{
                            }label: {
                                HStack(spacing: 10){
                                    
                                    Image("google")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 25, height: 25)
                                    Text("Google")
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                }
                                    .padding(.vertical, 10)
                                    .frame(width: ( UIScreen.main.bounds.width - 80) / 2)
                                    .background(Color("google"))
                                    .clipShape(.capsule)
                            }
                        }
                        
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(70)
                    .frame(height: show ? nil : 0)
                    .opacity(show ? 1 : 0)
                    }
                    
                
                
            }}
    }
}

struct AnimatedView: UIViewRepresentable{
    
    @Binding var show: Bool
    
    func updateUIView(_ uiView: Lottie.LottieAnimationView, context: Context) {
        
    }
    
    func makeUIView(context: Context) -> LottieAnimationView {
        
        
        let view = LottieAnimationView(name: "splash", bundle: .main )
        view.play { (status) in
            if status {
                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)) {
                    show.toggle()
                }
            }
         
        }
        view.contentMode = .scaleAspectFit
        return view

    }
    func updateUIView(_ uiView: AnimatedView, context: Context) {
        
    }
}
