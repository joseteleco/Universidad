<%-- 
    Document   : Sidebar
    Created on : 18-abr-2012, 12:38:13
    Author     : javier
--%>
<%@ taglib prefix="stripes"
           uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>

<stripes:layout-definition>
    <stripes:layout-component name="sidebar">
        <ul>
            <li>
                <h2>Acciones</h2>
                <ul>
                    <li>
                        <stripes:link
                            beanclass="org.lmb97.web.action.${actionBean['class']}"
                            event="modify${actionBean['view']}">
                        </stripes:link> 
                    </li>
                    <li>
                        <stripes:link
                            beanclass="org.lmb97.web.action.${actionBean['class']}"
                            event="insert${actionBean['view']}">
                        </stripes:link> 
                    </li>
                    <li>
                        <stripes:link
                            beanclass="org.lmb97.web.action.${actionBean['class']}"
                            event="delete${actionBean['view']}">
                        </stripes:link> 
                    </li>
                </ul>
            </li>
        </ul>
    </stripes:layout-component>
</stripes:layout-definition>