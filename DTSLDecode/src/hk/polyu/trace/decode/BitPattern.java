package hk.polyu.trace.decode;

public class BitPattern {

	public static int mask(final String pattern) {
        int mask = 0;
        char[] arrayOfChar = pattern.toCharArray();
        for (int length = arrayOfChar.length, i = 0; i < length; ++i) {
            switch (arrayOfChar[i]) {
                case '0':
                case '1': {
                    mask = (mask << 1) + 1;
                    break;
                }
                case '\t':
                case ' ': {
                    break;
                }
                default: {
                    mask = (mask << 1) + 0;
                    break;
                }
            }
        }
        return mask;
    }
    
    public static boolean matches(int input, String pattern) {
        return (input & mask(pattern)) == value(pattern);
    }
    
    public static int value(String pattern) {
        int value = 0;
        char[] arrayOfChar = pattern.toCharArray();
        for (int length = arrayOfChar.length, i = 0; i < length; ++i) {
            switch (arrayOfChar[i]) {
                case '1': {
                    value = (value << 1) + 1;
                    break;
                }
                case '\t':
                case ' ': {
                    break;
                }
                default: {
                    value = (value << 1) + 0;
                    break;
                }
            }
        }
        return value;
    }
	
}
