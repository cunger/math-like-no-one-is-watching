package problems.p109;

import java.util.ArrayList;
import java.util.List;

public record Field(
    Multiplier multiplier,
    int number
) {
    private static int BULLSEYE = 25;

    public int score() {
        if (multiplier == Multiplier.DOUBLE) return 2 * number;
        if (multiplier == Multiplier.TRIPLE) return 3 * number;
        return number;
    }

    public String toString() {
        if (number == BULLSEYE) {
            if (multiplier == Multiplier.SINGLE) return "OUTERBULL";
            if (multiplier == Multiplier.DOUBLE) return "INNERBULL";
        }
        if (multiplier == Multiplier.DOUBLE) return "D" + number;
        if (multiplier == Multiplier.TRIPLE) return "T" + number;
        return "" + number;
    }

    public static List<Field> doubles() {
        List<Field> doubles = new ArrayList<>();

        doubles.add(new Field(Multiplier.DOUBLE, BULLSEYE));

        for (int number = 20; number > 0; number--) {
            doubles.add(new Field(Multiplier.DOUBLE, number));
        }

        return doubles;
    }

    public static List<Field> all() {
        List<Field> fields = new ArrayList<>();

        fields.add(new Field(Multiplier.SINGLE, BULLSEYE));
        fields.add(new Field(Multiplier.DOUBLE, BULLSEYE));

        for (int number = 20; number > 0; number--) {
            fields.add(new Field(Multiplier.SINGLE, number));
            fields.add(new Field(Multiplier.DOUBLE, number));
            fields.add(new Field(Multiplier.TRIPLE, number));
        }

        fields.sort((f1, f2) -> Integer.compare(f2.score(), f1.score()));

        return fields;
    }
}
