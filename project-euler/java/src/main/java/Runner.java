import problems.p109.Problem109;

import java.util.Date;

public class Runner {

    public static void main(String[] args) {
        long start = new Date().getTime();
        System.out.println(Problem109.solve());
        long finish = new Date().getTime();
        System.out.println((finish - start) + " ms = " + ((finish - start) / 1000.0) + " s");
    }
}
