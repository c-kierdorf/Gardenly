package web.index;

public class CheckPasswordStrength {

    private static char ch;
    private static boolean capitalFlag = false;
    private static boolean lowerCaseFlag = false;
    private static boolean numberFlag = false;
    private static boolean specialCharacterFlag = false;
    
    public static boolean checkString(String str) {
        for (int i = 0; i < str.length(); i++) {
            ch = str.charAt(i);
            if (Character.isDigit(ch)) {
                numberFlag = true;
            } else if (Character.isUpperCase(ch)) {
                capitalFlag = true;
            } else if (Character.isLowerCase(ch)) {
                lowerCaseFlag = true;
            } else if (!Character.isLetter(i)) {
                specialCharacterFlag = true;
            }
            if (numberFlag && capitalFlag && lowerCaseFlag && specialCharacterFlag) {
                return true;
            }
        }
        return false;
    }

}
