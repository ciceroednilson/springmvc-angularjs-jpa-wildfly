package br.com.ciceroednilson.model;

import org.springframework.stereotype.Component;

@Component
public class ResultadoModel {

	private int codigo;
	private String mensagem;
	
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getMensagem() {
		return mensagem;
	}
	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}
	
	
}
