using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using LHPet.Models;

namespace LHPet.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        // Criando instâncias de clientes
        Cliente cliente1 = new Cliente(01, "Arthur A. Ferreira", "123.456.789-00", "arthur.antunes@sp.senai.br", "Madruga");
        Cliente cliente2 = new Cliente(02, "Maria C. Silva", "987.654.321-00", "maria.silva@sp.senai.br", "Bolinha");
        Cliente cliente3 = new Cliente(03, "João P. Santos", "456.789.123-00", "joao.santos@sp.senai.br", "Toto");
        Cliente cliente4 = new Cliente(04, "Ana L. Costa", "321.654.987-00", "ana.costa@sp.senai.br", "Floquinho");
        Cliente cliente5 = new Cliente(05, "Carlos M. Oliveira", "654.321.987-00", "carlos.oliveira@sp.senai.br", "Rex");

        // Criando uma lista de clientes
        List<Cliente> listaClientes = new List<Cliente>();
        listaClientes.Add(cliente1);
        listaClientes.Add(cliente2);
        listaClientes.Add(cliente3);
        listaClientes.Add(cliente4);
        listaClientes.Add(cliente5);

        // Passando a lista de clientes para a View usando ViewBag
        ViewBag.ListaClientes = listaClientes;

        // Criando instâncias de fornecedores
        Fornecedor fornecedor1 = new Fornecedor(01, "PetShop ABC", "12.345.678/0001-90", "contato@petshopabc.com.br");
        Fornecedor fornecedor2 = new Fornecedor(02, "Animal Care", "98.765.432/0001-90", "contato@animalcare.com.br");
        Fornecedor fornecedor3 = new Fornecedor(03, "Pets & Co.", "45.678.912/0001-90", "contato@petsandco.com.br");
        Fornecedor fornecedor4 = new Fornecedor(04, "Pet Lovers", "32.165.498/0001-90", "contato@petlovers.com.br");
        Fornecedor fornecedor5 = new Fornecedor(05, "Pet World", "65.432.198/0001-90", "contato@petworld.com.br");

        // Criando uma lista de fornecedores
        List<Fornecedor> listaFornecedores = new List<Fornecedor>();
        listaFornecedores.Add(fornecedor1);
        listaFornecedores.Add(fornecedor2);
        listaFornecedores.Add(fornecedor3);
        listaFornecedores.Add(fornecedor4);
        listaFornecedores.Add(fornecedor5);

        // Passando a lista de fornecedores para a View usando ViewBag
        ViewBag.ListaFornecedores = listaFornecedores;
        
        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
