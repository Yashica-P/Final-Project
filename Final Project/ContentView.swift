import SwiftUI

struct Question {
    let text: String
    let answers: [String]
    var selectedAnswer: String?
}

struct QuizView: View {
    @State private var currentQuestionIndex = 0
    @State private var questions: [Question] = [
        Question(text: "What is your skin type?", answers: ["Oily", "Dry", "Combination", "Balanced"]),
        Question(text: "How much makeup do you wear daily?", answers: ["None", "A little", "A Decent Amount", "Full Face"]),
        Question(text: "What are your main skin goals?", answers: ["Reduce Acne", "Hydrate", "Even Tone", "Minimize Pores", "Anti-age", "Minimize Redness"]),
        Question(text: "How often is your skin sensitive?", answers: ["Never", "Rarely", "Sometimes", "All the Time"]),
        Question(text: "What is your fragrance preference?", answers: ["Fragrance-free", "Lightly Fragranced"]),
        Question(text: "Do you have any specific skin concerns?", answers: ["Acne", "Dark Spots", "Redness", "Wrinkles", "None"])
    ]
    
    var body: some View {
        ZStack {
            // Background image
            Image("BlueBack")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                VStack(alignment: .center, spacing: 20) {
                    Text(questions[currentQuestionIndex].text)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 70/255, green: 70/255, blue: 100/255))
                        .opacity(0.8)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    VStack(spacing: 12) {
                        ForEach(questions[currentQuestionIndex].answers, id: \.self) { answer in
                            Button(action: {
                                selectAnswer(answer)
                            }) {
                                Text(answer)
                                    .font(.body)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color(red: 173/255, green: 216/255, blue: 250/255))
                                    .cornerRadius(12)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 15)
                .padding(.horizontal, 400) // Adjust horizontal padding to show background on sides
                .frame(maxHeight: .infinity, alignment: .center)
                .padding(.vertical, 20) // Adjust vertical padding to make the white box longer

                Spacer()
                
                if currentQuestionIndex < questions.count - 1 {
                    Button(action: {
                        nextQuestion()
                    }) {
                        Text("Next")
                            .font(.headline)
                            .padding()
                            .background(Color(red: 144/255, green: 218/255, blue: 184/255))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            
                            .shadow(radius: 10)
                    }
                    .padding(.top, 30)
                } else {
                    Button(action: {
                        // Handle quiz completion
                    }) {
                        Text("Finish")
                            .font(.headline)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .shadow(radius: 10)
                    }
                    .padding(.top, 30)
                }
            }
            .padding()
        }
    }
    
    func selectAnswer(_ answer: String) {
        questions[currentQuestionIndex].selectedAnswer = answer
    }
    
    func nextQuestion() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        }
    }
}

struct ContentView: View {
    var body: some View {
        QuizView()
    }
}

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

#Preview {
    ContentView()
}
