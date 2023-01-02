package problems.p109;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

public class CheckoutTest {

    @Test
    public void target2() {
        assertThat(Problem109.unique(Problem109.darts(2, 1)).size()).isEqualTo(1);
        assertThat(Problem109.numberOfCheckouts(2)).isEqualTo(1);
    }

    @Test
    public void target3() {
        assertThat(Problem109.unique(Problem109.darts(3, 1)).size()).isEqualTo(0);
        assertThat(Problem109.unique(Problem109.darts(3, 2)).size()).isEqualTo(1);
        assertThat(Problem109.unique(Problem109.darts(3, 3)).size()).isEqualTo(0);
    }

    @Test
    public void target6() {
        System.out.println(Problem109.unique(Problem109.darts(6, 1)));
        System.out.println(Problem109.unique(Problem109.darts(6, 2)));
        System.out.println(Problem109.unique(Problem109.darts(6, 3)));

        assertThat(Problem109.unique(Problem109.darts(6, 1)).size()).isEqualTo(1);
        assertThat(Problem109.unique(Problem109.darts(6, 2)).size()).isEqualTo(4);
        assertThat(Problem109.unique(Problem109.darts(6, 3)).size()).isEqualTo(6);
    }

    @Test
    public void target170() {
        System.out.println(Problem109.unique(Problem109.darts(170, 1)));
        System.out.println(Problem109.unique(Problem109.darts(170, 2)));
        System.out.println(Problem109.unique(Problem109.darts(170, 3)));
        assertThat(Problem109.unique(Problem109.darts(170, 1)).size()).isEqualTo(0);
        assertThat(Problem109.unique(Problem109.darts(170, 2)).size()).isEqualTo(0);
        assertThat(Problem109.unique(Problem109.darts(170, 3)).size()).isEqualTo(1);
    }

    @Test
    public void target100() {
        System.out.println(Problem109.unique(Problem109.darts(100, 1)));
        System.out.println(Problem109.unique(Problem109.darts(100, 2)));
        System.out.println(Problem109.unique(Problem109.darts(100, 3)));
        assertThat(Problem109.unique(Problem109.darts(100, 1)).size()).isEqualTo(0);
        assertThat(Problem109.unique(Problem109.darts(100, 2)).size()).isEqualTo(2);
    }
}
