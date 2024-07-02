package br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.util.activity;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.Activity;
import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.User;
import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.util.LocalDateTypeAdapter;

public final class ActivityReader {

	public static final String PATH = "/home/igorcardosoy/Documentos/Repositórios/3-Semestre/WEB1/Eclipse/IFitness/src/main/webapp/database/activities.json";

	private ActivityReader() {}

	public static List<Activity> read() {
		List<Activity> activities = null;
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateTypeAdapter()).create();

		try (var buffer = new BufferedReader(new FileReader(PATH))) {

			TypeToken<List<Activity>> type = new TypeToken<List<Activity>>() {};
			activities = gson.fromJson(buffer, type);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return activities;
	}
	
	public static List<Activity> readByUser(User user) {
		List<Activity> activities = read();
		List<Activity> userActivities = new ArrayList<Activity>();

		if (activities != null) {
			for (Activity activity : activities) {
				if (activity.getUser().getId() == (user.getId())) {
					userActivities.add(activity);
				}
			}
		}
		
		return userActivities;
	}

}
