package problems.p109;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Problem109 {

    private static List<Field> doubles = Field.doubles();
    private static List<Field> all = Field.all();

    public static int solve() {
        int numberOfCheckouts = 0;

        for (int checkoutScore = 99; checkoutScore > 1; checkoutScore--) {
            numberOfCheckouts += numberOfCheckouts(checkoutScore);
        }

        return numberOfCheckouts;
    }

    protected static int numberOfCheckouts(int score) {
        return unique(darts(score, 1)).size() +
            unique(darts(score, 2)).size() +
            unique(darts(score, 3)).size();
    }

    protected static Set<Checkout> unique(Set<Checkout> darts) {
        Set<Checkout> uniqueDarts = new HashSet<>();
        for (Checkout newCheckout : darts) {
            if (uniqueDarts.stream().noneMatch(existing -> existing.equals(newCheckout))) {
                uniqueDarts.add(newCheckout);
            }
        }

        return uniqueDarts;
    }

    protected static Set<Checkout> darts(int targetScore, int numberOfThrows) {
        return darts(targetScore, numberOfThrows, true, new Checkout());
    }

    protected static Set<Checkout> darts(int targetScore, int numberOfThrows, boolean mustBeDouble, Checkout partialDecomposition) {
        Set<Checkout> darts = new HashSet<>();

        if (numberOfThrows <= 0) return darts;
        if (targetScore <= 0) return darts;

        for (Field field : (mustBeDouble ? doubles : all)) {
            if (numberOfThrows == 1 && field.score() == targetScore) {
                darts.add(partialDecomposition.and(field));
            }

            darts.addAll(darts(
                targetScore - field.score(),
                numberOfThrows - 1,
                false,
                partialDecomposition.and(field)
            ));
        }

        return darts;
    }
}
