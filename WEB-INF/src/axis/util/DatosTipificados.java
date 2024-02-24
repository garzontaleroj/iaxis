package axis.util;

import java.util.ArrayList;
import java.util.List;

/**
 * Clase que contiene constantes que representan los datos tipificados de la
 * aplicaci�n, es decir, valores predeterminados de los combos, selects, listas
 * desplegables...para poder representarla en los formularios JSP. Esta clase se
 * carga al iniciar la aplicaci�n.
 * 
 * Fichero: DatosTipificados.java
 * 
 * @TODO Esta informaci�n seguramente viene de base de datos.
 * @TODO Antes de realizar el query a BD, comprobar si ya las tenemos en
 *       memoria.
 * @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
 */
public class DatosTipificados {
	// Si utiliz�ramos Java5, esta clase ser�a idealmente un Enum
	// Lista de constantes
	public static final List tipoPersona = new ArrayList();
	public static final List estadoPersona = new ArrayList();
	public static final List sexoPersona = new ArrayList();
	public static final List ramoProducto = new ArrayList();
	public static final List tipoDuracionProducto = new ArrayList();
	public static final List tipoCobro = new ArrayList();
	public static final List formaDePago = new ArrayList();
	public static final List tipoRevalorizacion = new ArrayList();
	public static final List idioma = new ArrayList();
	public static final List comision = new ArrayList();

	// Bloque de inicializaci�n
	// TODO: HardCode. Realizar query a BD
	// TODO: No est�n internacionalizados. Supongo que no estar�n en el bundle,
	// sino que vendr�n de BD ya traducidos en funci�n del locale/idioma.
	static {
		tipoPersona.add("F�sica");
		tipoPersona.add("Jur�dica");

		estadoPersona.add("Operativa");
		estadoPersona.add("Inoperativa");

		sexoPersona.add("Hombre");
		sexoPersona.add("Mujer");
		sexoPersona.add("Persona no f�sica");

		ramoProducto.add("Ramo 1");
		ramoProducto.add("Ramo 2");
		ramoProducto.add("Ramo 3");
		ramoProducto.add("Ramo 4");

		tipoDuracionProducto.add("Duraci�n mensual");
		tipoDuracionProducto.add("Duraci�n trimestral");
		tipoDuracionProducto.add("Duraci�n semestral");
		tipoDuracionProducto.add("Duraci�n anual");

		tipoCobro.add("Visa");
		tipoCobro.add("Efectivo");
		tipoCobro.add("Cheque");

		tipoRevalorizacion.add("Revalorizacion 1");
		tipoRevalorizacion.add("Revalorizacion 2");
		tipoRevalorizacion.add("Revalorizacion 3");
		tipoRevalorizacion.add("R. Geometrica");
		tipoRevalorizacion.add("R. Aritmetica");

		formaDePago.add("Mensual");
		formaDePago.add("Semestral");
		formaDePago.add("Anual");

		idioma.add("Catal�");
		idioma.add("Castellano");
		idioma.add("English");
		idioma.add("French");

		comision.add("Comision 1");
		comision.add("Comision 2");
	}
}
