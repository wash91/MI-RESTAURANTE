# 🍽️ Sistema de Restaurante Completo

Sistema integral de gestión para restaurante con 3 roles: Vendedor, Cocinero y Administrador.

## ✨ Características Principales

- ✅ **Sistema de ventas** con impresión automática de tickets
- ✅ **Gestión de cocina** con control de tiempos
- ✅ **Panel administrativo** completo con reportes avanzados
- ✅ **Exportación** a Excel (.xlsx) y PDF
- ✅ **Sincronización en tiempo real** con Firebase
- ✅ **Modo offline** funcional
- ✅ **Responsive design** (móvil, tablet, desktop)

## 🚀 Demo en Vivo

**URL:** [https://wash91.github.io/MI-RESTAURANTE/](https://wash91.github.io/MI-RESTAURANTE/)

## 👥 Roles del Sistema

### Vendedor
- Registrar clientes y ventas
- Gestionar métodos de pago (efectivo/transferencia)
- Imprimir tickets automáticamente

### Cocinero
- Ver órdenes pendientes
- Marcar órdenes como listas
- Controlar tiempos de preparación

### Administrador
- **Reportes:** Estadísticas completas, filtros por fecha, productos vendidos
- **Cobros:** Gestionar estados de pago de todas las órdenes
- **Cocina:** Control total de preparación de órdenes
- **Menú:** Agregar/eliminar productos

## 🛠️ Tecnologías

- React 18 (vía CDN)
- Firebase (Firestore + Auth)
- Tailwind CSS
- SheetJS (exportación Excel)

## 📦 Instalación y Uso

**Método 1: Abrir directamente**
```bash
# Solo abre index.html en tu navegador
open index.html
```

**Método 2: Servidor local**
```bash
# Python
python3 -m http.server 8080

# O con Node
npx serve
```

**Método 3: Desplegar en Firebase**
```bash
firebase login
firebase deploy --only hosting
```

## 📊 Mejoras Implementadas (v1.0.0)

✅ **Sistema de impresión** - Tickets automáticos formato 80mm
✅ **Gestión de cobros** - Panel administrativo para cambiar estados de pago
✅ **Vista de cocina (admin)** - Control completo desde panel admin
✅ **Reportes avanzados** - 5 estadísticas + tabla de productos
✅ **Exportación Excel real** - Archivo .xlsx con 3 secciones completas

## 📁 Estructura del Proyecto

```
MI-RESTAURANTE/
├── index.html              # Aplicación completa (55KB)
├── firebase.json           # Configuración Firebase Hosting
├── .firebaserc            # Proyecto Firebase
├── DEPLOYMENT.md          # Guía de despliegue
├── PROYECTO-COMPLETO.md   # Documentación técnica completa
└── README.md              # Este archivo
```

## 🔥 Configuración de Firebase

El proyecto usa Firebase con el proyecto `mini-restaurante-d0353`:
- Firestore para base de datos
- Firebase Auth (anónima)
- Firebase Hosting para despliegue

Ver `PROYECTO-COMPLETO.md` para configuración detallada.

## 📖 Documentación

- **[PROYECTO-COMPLETO.md](PROYECTO-COMPLETO.md)** - Documentación técnica detallada
- **[DEPLOYMENT.md](DEPLOYMENT.md)** - Guía de despliegue

## 🧪 Pruebas

1. Abre la aplicación
2. Selecciona un rol (Vendedor/Cocinero/Admin)
3. Prueba cada funcionalidad según el rol

Ver sección "Testing Manual" en `PROYECTO-COMPLETO.md` para flujos completos.

## 🤝 Contribuir

Este es un proyecto personalizado. Para sugerencias o mejoras, crear un issue en el repositorio.

## 📄 Licencia

Todos los derechos reservados © 2025

---

**Versión:** 1.0.0
**Última actualización:** 25 de Noviembre, 2025
**Estado:** ✅ Producción
