import SwiftUI

struct User {
    var deposito: Double
    var saque: Double
    var saldo: Double
}

struct CustomViewController: View {
    @State private var user = User(deposito: 0, saque: 0, saldo: 0)
    @State private var escolha: Int = -1
    @State private var valor: String = ""
    @State private var mensagem: String = ""
    
    var body: some View{
        VStack{
            Text("Acesso ao banco")
                .font(.largeTitle)
                .padding()
            
            Text(mensagem)
                .padding()
            
            TextField("Digite o valor:", text: $valor)
                .padding()
                .keyboardType(.decimalPad)
            
            HStack{
                Button(action: {
                    escolha = 1
                    if let valorDouble = Double(valor), valorDouble > 0{
                        user.deposito = valorDouble
                        user.saldo += user.deposito
                        mensagem = "Valor depositado: \(user.deposito)"
                    } else {
                        mensagem = "Entrada inválida"
                    }
                    valor = ""
                }) {
                    Text("Depositar")
                }
                .padding()
                
                Button(action: {
                    escolha = 2
                    if let valorDouble = Double(valor), valorDouble >= 0, valorDouble <= user.saldo{
                        user.saque = valorDouble
                        user.saldo -= user.saque
                        mensagem = "Valor sacado: \(user.saque) \n Saldo atual: \(user.saldo)"
                    } else{
                        mensagem = "Entrada Inválida"
                    }
                    valor = ""
                }) {
                    Text("Sacar")
                }
                .padding()
                
                Button(action: {
                    escolha = 0
                    mensagem = "Operação finalizada"
                }) {
                    Text("Sair")
                }
                .padding()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        CustomViewController()
    }
}
