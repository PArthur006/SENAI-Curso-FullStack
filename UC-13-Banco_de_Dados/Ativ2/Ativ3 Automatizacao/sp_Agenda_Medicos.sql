-- store procedure: agenda médicos
create procedure Agenda_Medicos
as
begin
	select m.nome_medico, m.especialidade, m.crm, c.numero_consulta, c.data_consulta, 
		c.horario_consulta, p.nome_paciente, p.cpf,  
		p.nome_plano, p.tipo_plano 	from medico as m inner join consulta as c 
		on m.crm = c.fk_medico_crm inner join paciente as p on c.fk_paciente_cpf = p.cpf 
		order by m.nome_medico, c.data_consulta;
end



execute Agenda_Medicos;

-- drop procedure Agenda_Medicos;

