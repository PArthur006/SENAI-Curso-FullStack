-- store procedure: histórico pagamentos dos pacientes
create procedure Historico_Pagamentos
as
begin
select pa.nome_paciente, pa.cpf, c.numero_consulta, c.data_consulta,  
		pe.data_exame, pe.valor_pagar, 
		e.codigo, e.especificacao from paciente as pa inner join consulta as c 
		on pa.cpf = c.fk_paciente_cpf inner join pedido_exame as pe 
		on c.numero_consulta = pe.fk_consulta_numero_consulta inner join exame as e 
		on pe.fk_exame_codigo = e.codigo 
		order by pa.nome_paciente, pe.data_exame;
end

execute Historico_Pagamentos;

-- drop procedure Historico_Pagamentos;

