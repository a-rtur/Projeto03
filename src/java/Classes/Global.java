package Classes;

public class Global {
    public static boolean isNumeric(String valor){
        boolean isNumeric = false;
        try {
            long n = Long.parseLong(valor);
            isNumeric = true;
        }
        catch (Exception ex) {
            isNumeric = false;
        }
        return isNumeric;
    }
}
