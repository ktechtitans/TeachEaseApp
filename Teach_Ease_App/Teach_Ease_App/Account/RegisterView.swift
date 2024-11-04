//
//  RegisterView.swift
//  Teach_Ease_App
//
//  Created by Kanchan Kaur on 2024-10-29.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct RegisterView: View {
    @State private var userRegistration = UserRegistration(email: "", password: "", confirmPassword: "")
    @State private var alertMessage: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("TeachEase")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 30)

                Text("Create new account")
                    .font(.title3)
                    .padding(.bottom, 50)
                
                TextField("Enter your email", text: $userRegistration.email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                
                SecureField("Enter your password", text: $userRegistration.password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                
                SecureField("Confirm password", text: $userRegistration.confirmPassword)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                
                Button(action: handleSignUp) {
                    Text("Sign up")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.top)
                
                Spacer()
                
                HStack {
                    Text("Have an account?")
                    NavigationLink(destination: LoginView()) {
                        Text("Log in")
                            .foregroundColor(.blue)
                    }
                }
                .padding()
            }
            .padding()
            .navigationBarBackButtonHidden(true) // Hide back button
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Registration Status"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func handleSignUp() {
        if !userRegistration.isValidEmail() {
            alertMessage = "Please enter a valid email address."
            showAlert = true
            return
        }
        
        if !userRegistration.isPasswordValid() {
            alertMessage = "Passwords must be at least 6 characters long."
            showAlert = true
            return
        }
        
        if userRegistration.password != userRegistration.confirmPassword {
            alertMessage = "Passwords do not match."
            showAlert = true
            return
        }
        
        Auth.auth().createUser(withEmail: userRegistration.email, password: userRegistration.password) { _, error in
            if let error = error {
                alertMessage = "Error during sign up: \(error.localizedDescription)"
                showAlert = true
            } else {
                alertMessage = "Account created successfully!"
                showAlert = true
            }
        }
    }
}

#Preview {
    RegisterView()
}
