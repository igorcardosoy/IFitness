package br.edu.ifsp.arq.tsi.arqweb1.ifitness.model;

public enum Gender {
	MALE("Masculino"),
	FEMALE("Feminino"),
	OTHER("Outro"),
	NOT_INFORMED("Prefiro não informar");
	
	private String description;
	
	Gender(String string) {
		this.description = string;
	}

	public String getDescription() {
		return description;
	}
}
