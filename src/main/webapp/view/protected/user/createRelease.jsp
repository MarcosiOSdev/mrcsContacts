<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<br />
<br />
<br />

<sec:authorize access="isAuthenticated()">

	<div class="bs-example">
	
	
	<font color="red" size="15px"><c:out value="${error }" /></font> 
	<font color="red" size="15px"><c:out value="${success }" /></font> 
	

		<fieldset>
			<legend> Fazendo um lançamento na conta</legend>

			<sf:form class="form-horizontal" action="/financeiro/user/createRelease/create" 
				method="post">



				<div class="form-group">
					<label for="inputName" class="control-label col-xs-2">
						Nome do lançamento: </label>
					<div class="col-xs-10">
						<input type="text" class="form-control" id="inputName"
							placeholder="Nome da conta" name="name">
					</div>
				</div>
				<br />
				
				

				<div class="form-group">
					<label for="inputAccount" class="control-label col-xs-2">
						Selecione uma Conta: </label>
					<div class="col-xs-10">
						<select class="selectpicker btn-danger" 
							name="idAccount" id="inputAccount" >
							 <optgroup label="Contas">
								<option>Selecione uma opção</option>
								<c:forEach items="${accounts }" var="itens">
									<option value='<c:out value="${itens.id }" />'>
										 <c:out value="${itens.name} " />
									</option>
								</c:forEach>
							</optgroup>
						</select>
					</div>
				</div>
				<br />
				
				<div class="form-group">
					<label for="inputDescription" class="control-label col-xs-2">
						Motivo: </label>
					<div class="col-xs-10">
						<input type="text" class="form-control" id="inputDescription"
							placeholder="descrição" name="description">
					</div>
				</div>
				<br />
				
				
				<div class="form-group">
					<label for="inputDescription" class="control-label col-xs-2">
						Opção : &nbsp;&nbsp;&nbsp;</label>
					<div class="col-xs-10">
						
							<input type="radio" name="option" value="revenue">RECEITA
								&nbsp;&nbsp;&nbsp;
							<input type="radio" name="option" value="deposit">DESPESA
						
					</div>
				</div>
				<br />



				<div class="input-group">

					<label for="inputAmount" class="control-label col-xs-2">
						Valor: </label> 
						<input type="text" name="value" id="currency" />
				</div>
				<br />
				
				<div class="input-group">
					<label for="inputDate" class="control-label col-xs-2">
						Data do Lançamento: </label>
					<input type="text" id="calendario" name="date" />	 
				</div>


				<br /> <br /> <br />

				<div class="form-group">
					<div class="col-xs-offset-2 col-xs-10">
						<button type="submit" class="btn btn-primary">Criar</button>
					</div>
				</div>
			</sf:form>
		</fieldset>
	</div>
</sec:authorize>