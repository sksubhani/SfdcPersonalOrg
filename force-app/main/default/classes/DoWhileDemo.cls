public class DoWhileDemo {
    public static void doWhileDemoPostIncrement() {
        Integer count = 1;
        do {
            System.debug(count);
            count++;
        } while (count < 11);
    }
    
    public static void doWhileDemoPostIncrement1() {
        Integer count = 1;
        do {
            System.debug(count);
        } while (count++ < 11);
    }
    
    public static void doWhileDemoPreIncrement() {
        Integer count = 1;
        do {
            System.debug(count);
            ++count;
        } while (count < 11);
    }
    
    public static void doWhileDemoPreIncrement1() {
        Integer count = 1;
        do {
            System.debug(count);
        } while (++count < 11);
    }
}