-- store procedure: resumo pagamentos por paciente
create procedure Resumo_Pagamentos @nome_pac varchar(40)
as
begin
select pa.nome_paciente, sum(pe.valor_pagar) as total_pagar
		from paciente as pa inner join consulta as c 
		on pa.cpf = c.fk_paciente_cpf inner join pedido_exame as pe 
		on c.numero_consulta = pe.fk_consulta_numero_consulta 
		where pa.nome_paciente = @nome_pac
		group by pa.nome_paciente;
end

execute Resumo_Pagamentos 'Leonardo Ribeiro';

-- drop procedure Resumo_Pagamentos;
