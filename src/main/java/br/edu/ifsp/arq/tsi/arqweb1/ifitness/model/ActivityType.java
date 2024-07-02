package br.edu.ifsp.arq.tsi.arqweb1.ifitness.model;

import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.util.activity.ActivityTypeNotFoundException;

public enum ActivityType {
	
	RUNNING("Corrida"),
    WALKING("Caminhada"),
    CYCLING("Ciclismo"),
    SWIMMING("Natação");
	
	private String description;
	
	ActivityType(String string) {
		this.description = string;
	}
	
	public String getDescription() {
		return description;
	}
	
	public static ActivityType fromString(String description) throws ActivityTypeNotFoundException{
		for (ActivityType activityType : ActivityType.values()) {
			if (activityType.description.equalsIgnoreCase(description)) {
				return activityType;
			}
		}
		
		throw new ActivityTypeNotFoundException("Activity type not found");
	}

}
