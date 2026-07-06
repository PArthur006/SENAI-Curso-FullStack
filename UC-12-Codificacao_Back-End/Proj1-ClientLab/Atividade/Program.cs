using System;
namespace Atividade
{
    class Program
    {
        static void Main(string[] args)
        {
            while(true)
            {
                float val_pag;
                Console.WriteLine("Informar Nome: ");
                string var_nome = Console.ReadLine();

                Console.WriteLine("Informar Endereço: ");
                string var_endereco = Console.ReadLine();

                Console.WriteLine("Pessoa Física (F) ou Jurídica (J)? ");
                string var_tipo = Console.ReadLine().ToUpper();

                if(var_tipo == "F")
                {
                    // --- Pessoa Física ---
                    Pessoa_Fisica pf = new Pessoa_Fisica();
                    pf.nome = var_nome;
                    pf.endereco = var_endereco;
                   
                    Console.WriteLine("Informar CPF: ");
                    pf.cpf = Console.ReadLine();

                    Console.WriteLine("Informar RG: ");
                    pf.rg = Console.ReadLine();

                    Console.WriteLine("Informar Valor de Compra: ");
                    val_pag = float.Parse(Console.ReadLine());
                    pf.Pagar_Imposto(val_pag);
                    
                    Console.WriteLine("-----------  Pessoa Física  -----------");
                    Console.WriteLine("Nome ..........: " + pf.nome);
                    Console.WriteLine("Endereço ......: " + pf.endereco);
                    Console.WriteLine("CPF ...........: " + pf.cpf);
                    Console.WriteLine("RG ............: " + pf.rg);
                    Console.WriteLine("Valor Compra ..: " + pf.valor.ToString("C"));
                    Console.WriteLine("Valor Imposto .: " + pf.valor_imposto.ToString("C"));
                    Console.WriteLine("Valor Total ...: " + pf.total.ToString("C"));

                    break;
                }

                else if(var_tipo == "J")
                {
                    // --- Pessoa Jurídica ---
                    Pessoa_Juridica pj = new Pessoa_Juridica();
                    pj.nome = var_nome;
                    pj.endereco = var_endereco;

                    Console.WriteLine("Informar CNPJ: ");
                    pj.cnpj = Console.ReadLine();

                    Console.WriteLine("Informar IE: ");
                    pj.ie = Console.ReadLine();

                    Console.WriteLine("Informar Valor de Compra: ");
                    val_pag = float.Parse(Console.ReadLine());
                    pj.Pagar_Imposto(val_pag);

                    Console.WriteLine("-----------  Pessoa Jurídica  -----------");
                    Console.WriteLine("Nome ..........: " + pj.nome);
                    Console.WriteLine("Endereço ......: " + pj.endereco);
                    Console.WriteLine("CNPJ ..........: " + pj.cnpj);
                    Console.WriteLine("IE ............: " + pj.ie);
                    Console.WriteLine("Valor Compra ..: " + pj.valor.ToString("C"));
                    Console.WriteLine("Valor Imposto .: " + pj.valor_imposto.ToString("C"));
                    Console.WriteLine("Valor Total ...: " + pj.total.ToString("C"));

                    break;
                }
                else
                {
                    Console.WriteLine("Tipo de Pessoa Inválido!");
                }
            }
        }
    }
}