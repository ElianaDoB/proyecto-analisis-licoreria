# \# 📊 Análisis de Ventas de una Licorería

# 

# \## 📌 Descripción del proyecto

# 

# Este proyecto realiza un análisis exploratorio de ventas de una licorería utilizando \*\*Python, Pandas, SQL, SQLite y Matplotlib\*\*.

# 

# El objetivo es aplicar un flujo de trabajo similar al utilizado por un \*\*Data Analyst\*\*, comenzando con los datos de ventas y avanzando hasta la generación de indicadores, consultas SQL, visualizaciones y conclusiones de negocio.

# 

# El proyecto también utiliza \*\*Git y GitHub\*\* para el control de versiones y la documentación del trabajo.

# 

# \---

# 

# \## 🎯 Objetivo

# 

# Analizar las ventas de una licorería para identificar:

# 

# \* Las categorías con mayor facturación.

# \* Las categorías que generan mayor ganancia.

# \* Los productos con mejor desempeño.

# \* La cantidad de unidades vendidas.

# \* El margen de ganancia del negocio.

# \* El comportamiento de las ventas por fecha.

# \* Productos y categorías relevantes para la toma de decisiones.

# 

# El análisis busca transformar datos de ventas en información útil para apoyar decisiones comerciales.

# 

# \---

# 

# \## 🗂️ Dataset

# 

# El dataset principal se encuentra en:

# 

# `data/ventas.csv`

# 

# Contiene información sobre las operaciones de venta de diferentes productos de la licorería.

# 

# \### Variables principales

# 

# | Variable       | Descripción              |

# | -------------- | ------------------------ |

# | `fecha`        | Fecha de la venta        |

# | `producto`     | Nombre del producto      |

# | `categoria`    | Categoría de la bebida   |

# | `precio\_venta` | Precio de venta unitario |

# | `costo`        | Costo unitario           |

# | `cantidad`     | Unidades vendidas        |

# | `ingreso`      | Facturación generada     |

# | `ganancia`     | Ganancia obtenida        |

# 

# Las variables `ingreso` y `ganancia` permiten analizar tanto el volumen económico de las ventas como su rentabilidad.

# 

# \---

# 

# \## 🛠️ Tecnologías utilizadas

# 

# \* \*\*Python\*\* — procesamiento y análisis de datos.

# \* \*\*Pandas\*\* — limpieza, transformación, agrupaciones y cálculo de indicadores.

# \* \*\*SQL\*\* — consultas y análisis de datos.

# \* \*\*SQLite\*\* — almacenamiento y gestión de la base de datos local.

# \* \*\*Matplotlib\*\* — creación de visualizaciones.

# \* \*\*Jupyter Notebook\*\* — desarrollo interactivo del análisis.

# \* \*\*Git\*\* — control de versiones.

# \* \*\*GitHub\*\* — publicación y documentación del proyecto.

# 

# \---

# 

# \## 🔎 Metodología

# 

# El proyecto sigue un flujo de trabajo de análisis de datos dividido en varias etapas.

# 

# \### 1. Carga y exploración

# 

# Los datos se cargaron utilizando Pandas y posteriormente se inspeccionaron para comprender su estructura.

# 

# Se analizaron:

# 

# \* dimensiones del dataset;

# \* nombres de columnas;

# \* tipos de datos;

# \* valores nulos;

# \* registros duplicados;

# \* estadísticas descriptivas.

# 

# La variable `fecha` fue convertida a formato `datetime` para facilitar el análisis temporal.

# 

# \### 2. Limpieza y preparación

# 

# Se verificó la calidad de los datos antes de comenzar el análisis.

# 

# Entre las tareas realizadas se encuentran:

# 

# \* búsqueda de valores faltantes;

# \* detección de duplicados;

# \* revisión de tipos de datos;

# \* transformación de fechas;

# \* creación de variables calculadas.

# 

# Las principales métricas calculadas fueron:

# 

# ```python

# df\["ingreso"] = df\["precio\_venta"] \* df\["cantidad"]

# 

# df\["ganancia"] = (

# &#x20;   df\["precio\_venta"] - df\["costo"]

# ) \* df\["cantidad"]

# ```

# 

# \### 3. Análisis exploratorio con Pandas

# 

# Se realizaron agrupaciones para analizar el rendimiento por:

# 

# \* producto;

# \* categoría;

# \* fecha.

# 

# Ejemplo:

# 

# ```python

# ingresos\_categoria = (

# &#x20;   df.groupby("categoria")\["ingreso"]

# &#x20;     .sum()

# &#x20;     .sort\_values(ascending=False)

# )

# ```

# 

# También se generaron tablas resumen utilizando `groupby()` y `agg()`.

# 

# \### 4. Análisis con SQL

# 

# Los datos fueron almacenados en una base de datos \*\*SQLite\*\* para practicar consultas SQL aplicadas a un escenario de análisis.

# 

# Entre los conceptos utilizados se encuentran:

# 

# \* `SELECT`

# \* `WHERE`

# \* `GROUP BY`

# \* `HAVING`

# \* `ORDER BY`

# \* `SUM`

# \* `AVG`

# \* `CASE WHEN`

# \* subconsultas

# \* `INNER JOIN`

# \* `LEFT JOIN`

# 

# Ejemplo:

# 

# ```sql

# SELECT

# &#x20;   categoria,

# &#x20;   SUM(cantidad) AS unidades,

# &#x20;   SUM(ingreso) AS facturacion,

# &#x20;   SUM(ganancia) AS ganancia,

# &#x20;   ROUND(

# &#x20;       SUM(ganancia) \* 100.0 / SUM(ingreso),

# &#x20;       2

# &#x20;   ) AS margen\_pct

# FROM ventas

# GROUP BY categoria

# ORDER BY facturacion DESC;

# ```

# 

# Las consultas principales se encuentran en:

# 

# `sql/analisis\_ventas.sql`

# 

# \---

# 

# \## 📈 KPIs

# 

# Los principales indicadores utilizados en el análisis son:

# 

# \### Facturación total

# 

# ```text

# $10,870

# ```

# 

# Representa el ingreso total generado por las ventas analizadas.

# 

# \### Ganancia total

# 

# ```text

# $2,800

# ```

# 

# Representa la diferencia acumulada entre ingresos y costos.

# 

# \### Margen de ganancia

# 

# El margen se calcula mediante:

# 

# ```text

# Margen (%) = Ganancia / Facturación × 100

# ```

# 

# Para el dataset analizado:

# 

# ```text

# 25.76 %

# ```

# 

# Esto permite evaluar qué porcentaje de la facturación se convierte en ganancia.

# 

# \---

# 

# \## 📊 Análisis por categoría

# 

# Se agruparon las operaciones por categoría para comparar:

# 

# \* unidades vendidas;

# \* facturación;

# \* ganancia;

# \* margen porcentual.

# 

# Este análisis permite detectar categorías que generan un volumen importante de ingresos y comparar ese resultado con su rentabilidad.

# 

# \---

# 

# \## 🥇 Análisis por producto

# 

# También se analizaron individualmente los productos utilizando:

# 

# \* unidades vendidas;

# \* facturación;

# \* ganancia;

# \* margen.

# 

# Esto permite identificar productos estratégicos dentro del catálogo.

# 

# El análisis incluye un ranking de los productos con mayor facturación.

# 

# \---

# 

# \## 📅 Análisis temporal

# 

# La variable `fecha` fue utilizada para estudiar las ventas por día.

# 

# Se generaron variables adicionales como:

# 

# ```python

# df\["dia"] = df\["fecha"].dt.day

# df\["mes"] = df\["fecha"].dt.month

# df\["dia\_semana"] = df\["fecha"].dt.day\_name()

# ```

# 

# Posteriormente se agruparon las ventas por fecha para comparar facturación y ganancia.

# 

# \---

# 

# \## 📊 Visualizaciones

# 

# Se utilizó \*\*Matplotlib\*\* para transformar los resultados del análisis en gráficos fáciles de interpretar.

# 

# Entre las visualizaciones desarrolladas se encuentran:

# 

# \* facturación por categoría;

# \* ganancia por categoría;

# \* ranking de productos por facturación.

# 

# \### Top 5 productos por facturación

# 

# !\[Top 5 productos por facturación](visualizations/top5\_productos\_facturacion.png)

# 

# Las visualizaciones permiten detectar rápidamente diferencias entre productos y categorías.

# 

# \---

# 

# \## 💡 Conclusiones

# 

# El análisis permitió construir una visión general del rendimiento comercial de la licorería.

# 

# Entre los principales aprendizajes se encuentran:

# 

# \* La facturación y la ganancia deben analizarse por separado: vender más no necesariamente significa obtener proporcionalmente más beneficio.

# \* El margen de ganancia es un indicador clave para evaluar la rentabilidad.

# \* El análisis por categoría ayuda a identificar qué grupos de productos tienen mayor peso dentro del negocio.

# \* El ranking por producto permite detectar productos con mayor impacto en la facturación.

# \* El análisis temporal permite estudiar cómo cambia el rendimiento de las ventas según la fecha.

# \* Combinar Python y SQL permite abordar el mismo problema desde distintas herramientas habituales en análisis de datos.

# 

# Debido al tamaño reducido del dataset, los resultados deben interpretarse principalmente como una demostración de metodología analítica. Un dataset histórico de mayor tamaño permitiría realizar análisis temporales, de estacionalidad y comportamiento comercial más robustos.

# 

# \---

# 

# \## 📁 Estructura del repositorio

# 

# ```text

# proyecto-analisis-licoreria/

# │

# ├── data/

# │   └── ventas.csv

# │

# ├── notebooks/

# │   └── 01\_exploracion\_ventas.ipynb

# │

# ├── reports/

# │   ├── reporte\_categorias.csv

# │   └── top\_productos.csv

# │

# ├── sql/

# │   └── analisis\_ventas.sql

# │

# ├── visualizations/

# │   └── top5\_productos\_facturacion.png

# │

# ├── .gitignore

# └── README.md

# ```

# 

# La base de datos SQLite utilizada durante el desarrollo se mantiene local y se excluye del repositorio mediante `.gitignore`.

# 

# \---

# 

# \## 🔄 Flujo de trabajo con Git

# 

# El proyecto utiliza Git para mantener un historial de los cambios realizados.

# 

# Flujo utilizado:

# 

# ```bash

# git status

# git add .

# git commit -m "mensaje del commit"

# git push

# ```

# 

# Esto permite mantener el proyecto versionado y sincronizado con GitHub.

# 

# \---

# 

# \## 🚀 Próximos pasos

# 

# Como evolución del proyecto se plantea:

# 

# \* incorporar un dataset con mayor cantidad de ventas;

# \* analizar ventas mensuales y tendencias;

# \* agregar información de stock;

# \* analizar inversión en inventario;

# \* calcular rentabilidad por producto;

# \* crear nuevas visualizaciones;

# \* desarrollar consultas SQL más avanzadas;

# \* construir un dashboard;

# \* automatizar la generación de reportes.

# 

# \---

# 

# \## 👩‍💻 Sobre el proyecto

# 

# Este proyecto forma parte de mi formación práctica en \*\*Data Analytics y Big Data\*\*.

# 

# El objetivo no es únicamente obtener resultados, sino desarrollar una metodología de trabajo utilizando herramientas habituales del análisis de datos:

# 

# \*\*Python → Pandas → SQL → SQLite → Visualización → Interpretación → Git → GitHub\*\*

# 



