-- store procedure: exames solicitados em ordem de médico
create procedure Exames_Solicitados
as
begin
select m.nome_medico, m.especialidade, m.crm, c.numero_consulta, 
	p.numero_pedido, p.data_exame, e.codigo, e.especificacao
	from medico as m inner join consulta as c 
	on m.crm = c.fk_medico_crm inner join pedido_exame as p 
	on c.numero_consulta = p.fk_consulta_numero_consulta
	inner join exame as e on p.fk_exame_codigo = e.codigo 
	order by m.nome_medico, p.data_exame;
end

execute Exames_Solicitados;

-- drop procedure Exames_Solicitados;

