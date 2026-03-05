Documentación Técnica: Sistema de Gestión para 
Unidades de Negocio (Suscripciones) 

Introducción y Propósito 
El presente proyecto nace de una observación directa sobre la ineficiencia operativa en negocios de 
suscripciones, donde el registro manual y el uso de papel limitaban el crecimiento y ponían en riesgo 
la integridad de la información. 

* ##Hitos de Desarrollo y Escalabilidad 
A diferencia de sistemas de gestión convencionales, este proyecto fue sometido a pruebas de estrés y 
optimización para superar los estándares de un negocio pequeño, alcanzando capacidades de nivel 
corporativo: 
* **Ingeniería de Datos (ETL):** Implementación de un pipeline en Python (Pandas) que automatiza 
la ingesta, limpieza y normalización de datos externos "sucios". 
* **Procesamiento Masivo:** Optimización del motor de base de datos para la carga y gestión de 
1.000.000 de registros, utilizando técnicas de Bulk Insert y gestión dinámica de índices 
(Disable/Rebuild) para maximizar la performance. 
* **Arquitectura de Seguridad:** Migración de un modelo de acceso abierto a uno de Control de 
Acceso Basado en Roles (RBAC), segregando permisos mediante Esquemas y protegiendo la 
información sensible. 
* **Robustez Operativa:** Configuración de planes de mantenimiento con Backups automatizados, 
asegurando la continuidad del negocio ante cualquier eventualidad. 
Arquitectura del Sistema 
Para asegurar un mantenimiento ágil y una estructura profesional, el sistema fue diseñado siguiendo 
un modelo de separación de responsabilidades: 
● Capa de Datos: Diseño y normalización de tablas en SQL Server. 
● Lógica de Negocio: Implementación de Stored Procedures y Triggers para centralizar la 
inteligencia en el motor de base de datos. 
● Backend: Aplicación desarrollada en Python bajo el paradigma de Programación Orientada a 
Objetos (POO), integrando el consumo de APIs para flujos de trabajo dinámicos. 
Optimización y Performance 
El sistema ha sido testeado en entornos de alta demanda operativa, superando los 150.000 registros. 
Para mantener tiempos de respuesta instantáneos, se implementaron las siguientes estrategias: 
* **Análisis de Planes de Ejecución:** Identificación de cuellos de botella mediante estadísticas de 
rendimiento. 
* **Estrategia de Indexación Avanzada:** Uso de índices Clustered y Non-Clustered. Se destaca la 
implementación de Covering Indexes en las consultas críticas para minimizar el I/O del disco y 
acelerar la recuperación de datos. 
* **Arquitectura de Almacenamiento:** Diseño pensado para la segregación de archivos .mdf y 
.log en unidades físicas independientes para optimizar la concurrencia. 
Lógica Financiera e Integridad 
* **Precisión Aritmética:** Uso estricto de tipos de datos Integer para el manejo de valores 
monetarios, evitando errores de redondeo binario propios de los tipos de coma flotante y 
garantizando cierres de caja exactos. 
* **Automatización de Procesos:** El sistema realiza cierres mensuales y anuales automáticos, 
asegurando la persistencia de históricos financieros. 
* **Módulo de Notificaciones:** Integración de lógica en Python para la detección proactiva de 
deudas y comunicación automatizada con los socios ante actualizaciones de aranceles.
