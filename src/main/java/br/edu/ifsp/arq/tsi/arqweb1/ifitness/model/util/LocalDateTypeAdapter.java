package br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.util;

import java.lang.reflect.Type;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

public class LocalDateTypeAdapter implements JsonSerializer<LocalDate>, JsonDeserializer<LocalDate>{
	
	private static final DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	@Override
	public JsonElement serialize(LocalDate date, Type type, JsonSerializationContext context){
		return new JsonPrimitive(date.format(dateFormatter));
	}

	@Override
	public LocalDate deserialize(JsonElement json, Type type, JsonDeserializationContext context)
			throws JsonParseException {
		return LocalDate.parse(json.getAsString(), dateFormatter);
	}
}
