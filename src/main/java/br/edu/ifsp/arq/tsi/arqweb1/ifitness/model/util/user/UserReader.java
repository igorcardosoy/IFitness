package br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.util.user;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.User;
import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.util.Encryptor;
import br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.util.LocalDateTypeAdapter;

public final class UserReader {

	public static final String PATH = "/home/igorcardosoy/Documentos/Repositórios/3-Semestre/WEB1/Eclipse/IFitness/src/main/webapp/database/users.json";

	private UserReader() {
	}

	public static List<User> read() {
		List<User> users = null;
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateTypeAdapter()).create();

		try (var buffer = new BufferedReader(new FileReader(PATH))) {

			TypeToken<List<User>> type = new TypeToken<List<User>>() {};
			users = gson.fromJson(buffer, type);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return new ArrayList<User>(users);
	}

	public static User findUserByEmail(String encryptedEmail) throws UserNotFoundException {

		List<User> users = read();

		if (users != null) {
			for (User user : users) {
				if (Encryptor.encrypt(user.getEmail()).equals(encryptedEmail)) {
					return user;
				}
			}
		}

		throw new UserNotFoundException("User not found");
	}

}
