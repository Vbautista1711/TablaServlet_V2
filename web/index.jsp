<%@page import="servlets.Sprocesar"%>
<%@page import="alumno.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    Alumno alumnos[] = new Alumno[10];
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/estilo.css">
        <title>Calificaciones con Servlet version 2</title>
    </head>
    <body>
       <div class='form-datos'>
            <h4>Formulario</h4>
          
            <form action='Sprocesar' method='post'>

                <input type='text'   class='controls' name='tfMatricula'       placeholder="Ingrese la matricula"> 
                <input type='text'   class='controls' name='tfNombre'          placeholder="Ingrese el nombre">
                <input type='text'   class='controls' name='tfApellidoPaterno' placeholder="Ingrese el apellido paterno">
                <input type='text'   class='controls' name='tfApellidoMaterno' placeholder="Ingrese el apellido materno"> 
                <input type='number' class='controls' name='tfDdi'             placeholder="Ingrese la calificación de DDI" > 
                <input type='number' class='controls' name='tfDwi'             placeholder="Ingrese la calificación de DWI">
                <input type='number' class='controls' name='tfEcbd'            placeholder="Ingrese la calificación de ECBD">
                    
                <button type='submit' class='botons' name='btnRegistrar'>Registrar</button>
            </form> 
        </div> 
        
       <%
            if(request.getAttribute("cont") != null)
            {
                alumnos = (Alumno[])request.getAttribute("alumnos");
                int cont = Integer.parseInt(request.getAttribute("cont").toString());


                if (cont ==10)
                {
                    out.print
                    (""  
                        +"<div id='advertencia'>"    
                        +"<h4>El arreglo esta lleno</h4>"
                        + "</div>"
                    );
                }

                out.println(""
                            +"<div id='contenido'>"
                            + "<table class = 'tabla'>"
                            + "     <thead class='Datos' >"
                            + "     <tr>"
                            + "         <th>MATRICULA</th>"
                            + "         <th>NOMBRE</th>"
                            + "         <th>APELLIDO PATERNO</th>"
                            + "         <th>APELLIDO PATERNO</th>"
                            + "         <th>DDI</th>"
                            + "         <th>DWI</th>"
                            + "         <th>ECBD</th>"
                            + "         <th>PROM</th>"
                            + "     </tr>"
                            + " </thead>"
                            + "</div>"
                );
                for(int i = 0; i < cont; i++)
                {
                        out.println
                    (""
                            + "<tbody>"
                            +   "<tr>"
                            +       "<td>" + alumnos[i].getMatricula() + "</td>"
                            +       "<td>" + alumnos[i].getNombre() + "</td>"
                            +       "<td>" + alumnos[i].getApellidoPaterno() +"</td>"
                            +       "<td>" + alumnos[i].getApellidoMaterno() + "</td>"
                            +       "<td>" + alumnos[i].getDdi() + "</td>"
                            +       "<td>" + alumnos[i].getDwi() + "</td>"
                            +       "<td>" + alumnos[i].getEcbd() + "</td>"
                            +       "<td>" + alumnos[i].calcularPromedio(alumnos[i].getDdi(), alumnos[i].getDwi(), alumnos[i].getEcbd()) + "</td>"
                            +   "</tr>"
                            + "</tbody>"
                     );
                }
                out.println(""
                    + "</table>"
                );
            }
       %>
       
    </body>
</html>
