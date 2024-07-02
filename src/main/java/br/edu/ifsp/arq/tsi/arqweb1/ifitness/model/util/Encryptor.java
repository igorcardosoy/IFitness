package br.edu.ifsp.arq.tsi.arqweb1.ifitness.model.util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public final class Encryptor {

	private Encryptor() {}

	public static String encrypt(String password) {
		String encryptedPassword = null;

		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			byte messageDigest[] = md.digest(password.getBytes(StandardCharsets.UTF_8));
			StringBuilder sb = new StringBuilder();

			for (byte b : messageDigest) {
				sb.append(String.format("%02x", b));
			}

			encryptedPassword = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("Erro ao criptografar senha", e);
		}

		return encryptedPassword;
	}

}
