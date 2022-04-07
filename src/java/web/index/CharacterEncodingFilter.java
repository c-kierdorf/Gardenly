package web.index;

import java.util.logging.*;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 *
 * @author CK Wichtig, damit deutsche Worteingaben mit Umlauten korrekt
 * übertragen werden. Wird auf ALLE Servlets angewendet, die mit POST-Methode
 * übertragen werden. Vorlage:
 * https://stackoverflow.com/questions/33941751/html-form-does-not-send-utf-8-format-inputs
 * Für GET-Methode muss man einen Eintrag in web.xml Datei ergänzen, siehe hier:
 * https://stackoverflow.com/questions/26770380/jsp-glassfish-how-to-setup-utf-8-encoding-correctly
 * und hier: https://docs.oracle.com/cd/E19798-01/821-1752/beafu/index.html
 *
 */
@WebFilter(filterName = "CharacterEncodingFilter", urlPatterns = {"/*"})
public class CharacterEncodingFilter implements Filter {

    private final static Logger logger
            = Logger.getLogger(CharacterEncodingFilter.class.getName());

    @Override
    public void init(FilterConfig config) throws ServletException {
        // NOOP.
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        if (request != null) {
            request.setCharacterEncoding("UTF-8");
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        // NOOP.
    }

}
