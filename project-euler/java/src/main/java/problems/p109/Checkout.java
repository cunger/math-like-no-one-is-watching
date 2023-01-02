package problems.p109;

public class Checkout {

    private final Field doubleField;
    private final Field field1;
    private final Field field2;

    public Checkout() {
        this.doubleField = null;
        this.field1 = null;
        this.field2 = null;
    }

    public Checkout(Field field) {
        if (field.multiplier() != Multiplier.DOUBLE) {
            throw new IllegalArgumentException("final dart must be a double");
        }

        this.doubleField = field;
        this.field1 = null;
        this.field2 = null;
    }

    public Checkout(Field field, Field field1) {
        if (field.multiplier() != Multiplier.DOUBLE) {
            throw new IllegalArgumentException("final dart must be a double");
        }

        this.doubleField = field;
        this.field1 = field1;
        this.field2 = null;
    }

    public Checkout(Field field, Field field1, Field field2) {
        if (field.multiplier() != Multiplier.DOUBLE) {
            throw new IllegalArgumentException("final dart must be a double");
        }

        this.doubleField = field;
        this.field1 = field1;
        this.field2 = field2;
    }

    public Checkout and(Field next) {
        if (doubleField == null) return new Checkout(next);
        if (field1 == null) return new Checkout(doubleField, next);
        if (field2 == null) return new Checkout(doubleField, field1, next);
        throw new IllegalArgumentException("maximum is 3 throws");
    }

    private int score() {
        if (doubleField == null) return 0;
        if (field1 == null) return doubleField.score();
        if (field2 == null) return doubleField.score() + field1.score();
        return doubleField.score() + field1.score() + field2.score();
    }

    @Override
    public String toString() {
        if (doubleField == null) return "-";
        if (field1 == null) return doubleField + " (" + score() + ")";
        if (field2 == null) return field1 + "-" + doubleField + " (" + score() + ")";
        return field2 + "-" + field1 + "-" + doubleField + " (" + score() + ")";
    }

    @Override
    public boolean equals(Object object) {
        if (object == null || !(object instanceof Checkout)) {
            return false;
        }

        Checkout other = (Checkout) object;

        // If they finish on different doubles, they're different.
        // The order of the other two throws doesn't matter.
        return (doubleField == other.doubleField && (
            (field1 == other.field1 && field2 == other.field2) ||
            (field1 == other.field2 && field2 == other.field1)
        ));
    }
}
