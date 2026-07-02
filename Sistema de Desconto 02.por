programa
{
    funcao inicio()
    {
        real desconto
        real totalRecebido
        real valorFinal
        real valores[6]

        cadeia nomes[6]

        inteiro i
        inteiro clientesComDesconto

        totalRecebido = 0
        clientesComDesconto = 0

        escreva("Informe o valor do desconto do dia: R$ ")
        leia(desconto)

        para (i = 0; i < 6; i++)
        {
            escreva("\nDigite o nome do cliente ", i + 1, ": ")
            leia(nomes[i])

            escreva("Digite o valor gasto por ", nomes[i], ": R$ ")
            leia(valores[i])
        }

        escreva("\n--- RESULTADO DAS COMPRAS ---\n")

        para (i = 0; i < 6; i++)
        {
            se (valores[i] >= 100)
            {
                valorFinal = valores[i] - desconto
                clientesComDesconto = clientesComDesconto + 1
            }
            senao
            {
                valorFinal = valores[i]
            }

            totalRecebido = totalRecebido + valorFinal

            escreva("Cliente: ", nomes[i])
            escreva(" | Valor a pagar: R$ ", valorFinal, "\n")
        }

        escreva("\nTotal recebido pela loja: R$ ", totalRecebido)
        escreva("\nClientes que receberam desconto: ", clientesComDesconto)
    }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 726; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */