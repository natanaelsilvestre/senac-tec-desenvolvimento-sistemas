programa
{
    funcao inicio()
    {
        cadeia nome
        cadeia vegetariano
        cadeia dieta
        cadeia prato
        cadeia pagamento

        escreva("Digite o nome do cliente: ")
        leia(nome)

        escreva("O cliente é vegetariano? (sim ou não): ")
        leia(vegetariano)

        escreva("O cliente está em dieta? (sim ou não): ")
        leia(dieta)

        se (vegetariano == "sim" e dieta == "sim")
        {
            prato = "Saladas"
        }
        senao se (vegetariano == "não" e dieta == "sim")
        {
            prato = "Frango grelhado"
        }
        senao se (vegetariano == "sim" e dieta == "não")
        {
            prato = "Macarrão"
        }
        senao
        {
            prato = "Feijoada"
        }

        escreva("\nCliente: ", nome)
        escreva("\nSugestão de prato: ", prato)

        escreva("\n\nForma de pagamento (dinheiro ou cartão): ")
        leia(pagamento)

        se (pagamento == "dinheiro")
        {
            escreva("O cliente tem 15% de desconto")
        }
    }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 762; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */