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
        Question(text: "What are your main skin goals? Choose up to 3.", answers: ["Soothe", "Repair", "Reduce Breakouts", "Hydrate", "Brighten", "Even Tone", "Minimize Pores", "Anti-age", "Tighten", "Minimize Redness"]),
        Question(text: "What kind of breakouts do you get?", answers: ["Surface-level blemishes (blackheads)", "Surface-level blemishes (whiteheads)", "Acne scars (brown/black spots)", "Beneath the surface raised blemishes (red in color)", "Beneath the surface, clusters of red bumpy pimples", "Surface level blemishes, appear as red bumps with a visible white head", "Beneath the surface, large hard red bumps, sensitive", "Beneath the surface, large red or white lumps, sensitive"]),
        Question(text: "How often is your skin sensitive?", answers: ["Never", "Rarely", "Sometimes", "All the Time"]),
        Question(text: "What is your fragrance preference?", answers: ["Fragrance-free", "Lightly Fragranced"]),
        Question(text: "Do you have any specific skin concerns?", answers: ["Acne", "Dark Spots", "Redness", "Wrinkles", "None"])
    ]
    
    var body: some View {
        VStack {
            Text(questions[currentQuestionIndex].text)
                .font(.headline)
                .padding()

            ForEach(questions[currentQuestionIndex].answers, id: \.self) { answer in
                Button(action: {
                    selectAnswer(answer)
                }) {
                    Text(answer)
                        .padding()
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10)
                }
                .padding(.vertical, 5)
            }

            if currentQuestionIndex < questions.count - 1 {
                Button(action: {
                    nextQuestion()
                }) {
                    Text("Next")
                        .padding()
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            } else {
                Button(action: {
                    // Handle quiz completion
                }) {
                    Text("Finish")
                        .padding()
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            }
        }
        .padding()
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

// This should be used to preview the SwiftUI views, not the data model.
#Preview {
    ContentView()
}
