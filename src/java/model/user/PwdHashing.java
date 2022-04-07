package model.user;

import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PwdHashing {

    private static final Charset UTF_8 = StandardCharsets.UTF_8;

    public static byte[] digest(byte[] input) {
        MessageDigest md;
        try {
            md = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalArgumentException(e);
        }
        byte[] result = md.digest(input);
        return result;
    }

    public static String bytesToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }

    public static String pwdHashed(String pwdUnhashed) {
        byte[] shaInBytes = new byte[10];
        if (pwdUnhashed != null) {
            shaInBytes = PwdHashing.digest(pwdUnhashed.getBytes(UTF_8));
        }
        return bytesToHex(shaInBytes);
    }
}
