import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.lang.reflect.Method;

import org.junit.jupiter.api.Test;

class GestionStockMorphineTest {

    @Test
    void shouldExposeMethodToRegisterMorphineStockOutput() throws Exception {
        Method method = GestionStock.class.getDeclaredMethod(
            "enregistrerSortieMorphine",
            String.class,
            int.class,
            String.class,
            String.class
        );
        assertNotNull(method);
    }

    @Test
    void shouldExposeMethodWithTraceabilityDetailsForMorphine() throws Exception {
        Method method = GestionStock.class.getDeclaredMethod(
            "enregistrerSortieMorphine",
            String.class,
            int.class,
            String.class,
            String.class,
            String.class
        );
        assertNotNull(method);
    }
}
