# 🍽️ Sistema de Restaurante - Documentación Completa

## 📋 Resumen del Proyecto

Sistema completo de gestión para restaurante pequeño desarrollado con React, Firebase y Tailwind CSS. Incluye gestión de ventas, cocina, administración y reportes avanzados.

---

## 👥 Roles del Sistema

### 1. **Vendedor**
- Registrar clientes
- Crear órdenes de venta
- Seleccionar productos del menú
- Gestionar estado de pago (pagado/pendiente)
- Seleccionar método de pago (efectivo/transferencia)
- **Imprimir tickets automáticamente** ✨

### 2. **Cocinero**
- Visualizar órdenes pendientes
- Ver tiempo de preparación de cada orden
- Marcar órdenes como "LISTO"
- Entregar órdenes completadas

### 3. **Administrador**
- **Panel de Reportes:**
  - Estadísticas completas de ventas
  - Filtros por fecha
  - Desglose por método de pago
  - Productos vendidos con cantidades
  - Exportación a Excel (.xlsx) y PDF

- **Panel de Cobros:** ✨
  - Cambiar estado de pago de órdenes
  - Actualizar método de pago
  - Vista de todas las órdenes con detalles

- **Panel de Cocina:** ✨
  - Mismas funciones que el cocinero
  - Marcar órdenes como listas
  - Controlar preparación

- **Panel de Menú:**
  - Agregar nuevos productos
  - Eliminar productos
  - Configurar precios y tiempos de preparación

---

## 🚀 Mejoras Implementadas

### ✅ 1. Sistema de Impresión de Tickets
**Ubicación:** `index.html:81-170`

- Componente `PrintTicket`: Diálogo de impresión con trigger automático
- Componente `TicketToPrint`: Ticket formato 80mm para impresión
- Se activa automáticamente al confirmar una venta
- Incluye todos los detalles: orden, cliente, productos, totales, método de pago

**Características:**
```javascript
- Impresión automática después de 300ms
- Formato profesional de ticket
- Detalles completos de la orden
- Estado y método de pago visible
```

### ✅ 2. Gestión de Cobros (Administrador)
**Ubicación:** `index.html:511-563`

Nueva pestaña "Cobros" que permite:
- Ver todas las órdenes con estado visual
- Cambiar estado a: Efectivo pagado, Transferencia pagada, Pendiente
- Vista de tarjetas con información completa
- Actualización en tiempo real con Firebase

**Funciones:**
```javascript
updatePaymentStatus(id, paymentStatus, paymentMethod) {
  // Actualiza estado de pago localmente y en Firebase
  const updated = orders.map(o =>
    o.id === id ? {...o, paymentStatus, paymentMethod} : o
  );
  setOrders(updated);
  if(db) updateDoc(doc(db, 'artifacts', APP_ID, 'orders', id),
    { paymentStatus, paymentMethod });
}
```

### ✅ 3. Vista de Cocina para Administrador
**Ubicación:** `index.html:565-613`

Nueva pestaña "Cocina" con:
- Vista de todas las órdenes activas
- Control de estado (pendiente/listo/entregado)
- Visualización de tiempo de preparación
- Mismas capacidades que el rol de cocinero

**Funciones:**
```javascript
updateOrderStatus(id, status) {
  // Actualiza estado de orden en cocina
  const updated = orders.map(o => o.id === id ? {...o, status} : o);
  setOrders(updated);
  if(db) updateDoc(doc(db, 'artifacts', APP_ID, 'orders', id), { status });
}
```

### ✅ 4. Reportes Avanzados
**Ubicación:** `index.html:419-509`

**Estadísticas incluidas:**
- Total General
- Total Pagado (verde)
- Total Pendiente (rojo)
- Total Efectivo (morado)
- Total Transferencia (índigo)

**Tabla de Productos Vendidos:**
```javascript
const productsSold = {};
filteredOrders.forEach(order => {
  order.items.forEach(item => {
    if(!productsSold[item.name]) {
      productsSold[item.name] = { quantity: 0, total: 0 };
    }
    productsSold[item.name].quantity += item.q;
    productsSold[item.name].total += item.price * item.q;
  });
});
```

**Filtros:**
- Filtro por fecha
- Limpiar filtros con un click

### ✅ 5. Exportación a Excel Real (.xlsx)
**Ubicación:** `index.html:362-402`

**Integración de SheetJS:**
```html
<script src="https://cdn.sheetjs.com/xlsx-0.20.1/package/dist/xlsx.full.min.js"></script>
```

**Estructura del Excel exportado:**
1. **Resumen:**
   - Total General
   - Total Pagado
   - Total Pendiente
   - Total Efectivo
   - Total Transferencia

2. **Detalle de Órdenes:**
   - Número de orden
   - Cliente
   - Vendedor
   - Total
   - Estado de pago
   - Método de pago
   - Estado de orden
   - Fecha

3. **Productos Vendidos:**
   - Nombre del producto
   - Cantidad vendida
   - Total vendido

**Código:**
```javascript
const exportExcel = () => {
  const ws_data = [
    ['REPORTE DE VENTAS - RESTAURANTE ÁGIL'],
    ['Fecha de generación:', new Date().toLocaleString()],
    // ... más datos
  ];
  const ws = XLSX.utils.aoa_to_sheet(ws_data);
  const wb = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(wb, ws, 'Reporte');
  XLSX.writeFile(wb, `reporte_ventas_${new Date().toISOString().split('T')[0]}.xlsx`);
};
```

---

## 🔥 Configuración de Firebase

**Proyecto:** `mini-restaurante-d0353`

```javascript
const FIREBASE_CONFIG = {
  apiKey: "AIzaSyBedWCRDfZWIxj9HNxHqN0bD7G7W3jaKqA",
  authDomain: "mini-restaurante-d0353.firebaseapp.com",
  projectId: "mini-restaurante-d0353",
  storageBucket: "mini-restaurante-d0353.firebasestorage.app",
  messagingSenderId: "630103435028",
  appId: "1:630103435028:web:e417df55fe261bcb894401"
};
```

**Colecciones de Firestore:**
- `artifacts/restaurante-html-v1/products` - Productos del menú
- `artifacts/restaurante-html-v1/orders` - Órdenes de venta

---

## 📱 Tecnologías Utilizadas

### Frontend
- **React 18** (via CDN - sin instalación)
- **Tailwind CSS** (via CDN)
- **Babel Standalone** (para JSX en el navegador)

### Backend
- **Firebase Firestore** (base de datos en tiempo real)
- **Firebase Auth** (autenticación anónima)

### Librerías
- **SheetJS (XLSX)** - Exportación a Excel
- **React Hooks** - useState, useEffect

---

## 🏗️ Arquitectura del Código

### Componentes Principales

```javascript
// 1. Componentes de Impresión
- PrintTicket({ order, onClose })
- TicketToPrint({ order })

// 2. Pantalla de Login
- LoginScreen({ onLogin, isLocal })

// 3. Vistas por Rol
- VendedorView({ db, userData, isLocal, localState, setLocalState })
- CocineroView({ db, isLocal, localState, setLocalState })
- AdminView({ db, isLocal, localState, setLocalState })

// 4. App Principal
- App() - Maneja estado global y routing
```

### Estado Local (Offline Mode)

```javascript
const [localState, setLocalState] = useState({
  products: [
    { id: '1', name: 'Hamburguesa Clásica', price: 5.00, prepTime: 15 },
    { id: '2', name: 'Papas Fritas', price: 2.50, prepTime: 5 },
    { id: '3', name: 'Gaseosa', price: 1.50, prepTime: 0 }
  ],
  orders: []
});
```

### Sincronización Firebase

```javascript
// Escuchar cambios en productos
const qP = query(collection(db, 'artifacts', APP_ID, 'products'));
const unsubP = onSnapshot(qP, s =>
  setProducts(s.docs.map(d=>({id:d.id,...d.data()})))
);

// Escuchar cambios en órdenes
const qO = query(collection(db, 'artifacts', APP_ID, 'orders'),
  orderBy('createdAt', 'desc'));
const unsubO = onSnapshot(qO, s =>
  setOrders(s.docs.map(d=>({id:d.id,...d.data()})))
);
```

---

## 📊 Flujo de Datos

### Crear una Orden (Vendedor)

```
1. Usuario agrega productos al carrito
2. Ingresa nombre del cliente
3. Selecciona estado de pago y método
4. Click en "CONFIRMAR VENTA"
   ↓
5. Se crea objeto newOrder con:
   - ID único (timestamp)
   - Número secuencial
   - Items del carrito
   - Total calculado
   - Tiempo de preparación (máximo de items)
   - Estado: 'pending'
   - Info de pago
   ↓
6. Se actualiza estado local
7. Se guarda en Firebase (si está online)
8. Se muestra diálogo de impresión
9. Se activa impresión automática
```

### Actualizar Estado de Pago (Admin)

```
1. Admin va a pestaña "Cobros"
2. Ve todas las órdenes con estados visuales
3. Click en botón de método de pago
   ↓
4. Se llama updatePaymentStatus(id, status, method)
5. Se actualiza estado local
6. Se sincroniza con Firebase
7. Cambio se refleja en tiempo real en todas las vistas
```

### Marcar Orden Lista (Cocinero/Admin)

```
1. Cocinero ve orden pendiente (borde naranja)
2. Click en "MARCAR LISTO"
   ↓
3. Se llama updateOrderStatus(id, 'ready')
4. Borde cambia a verde
5. Estado se sincroniza con Firebase
   ↓
6. Click en "ENTREGAR"
7. Se llama updateOrderStatus(id, 'delivered')
8. Orden desaparece de vista activa
```

---

## 🎨 Diseño y UX

### Paleta de Colores

```css
- Fondo principal: #f1f5f9 (slate-100)
- Texto principal: #1e293b (slate-800)
- Acciones primarias: #2563eb (blue-600)
- Éxito/Pagado: #16a34a (green-600)
- Error/Pendiente: #dc2626 (red-600)
- Advertencia/Preparando: #ea580c (orange-600)
- Info/Transferencia: #7c3aed (purple-600)
```

### Responsive Design

```javascript
// Grids adaptables
className="grid grid-cols-1 md:grid-cols-3 gap-4"

// Flex adaptable
className="flex flex-col md:flex-row gap-2"

// Ocultar en móviles
className="hidden md:block"
```

### Estados Visuales

```javascript
// Orden pendiente
border-l-8 border-orange-500

// Orden lista
border-l-8 border-green-500

// Pago completado
bg-green-100 text-green-700

// Pago pendiente
bg-red-100 text-red-700
```

---

## 🔧 Configuración para Despliegue

### Firebase Hosting

**Archivo:** `firebase.json`
```json
{
  "hosting": {
    "public": ".",
    "ignore": [
      "firebase.json",
      "**/.*",
      "**/node_modules/**"
    ],
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ]
  }
}
```

**Archivo:** `.firebaserc`
```json
{
  "projects": {
    "default": "mini-restaurante-d0353"
  }
}
```

### Comandos de Despliegue

```bash
# Login a Firebase
firebase login

# Desplegar a hosting
firebase deploy --only hosting

# URL resultante
https://mini-restaurante-d0353.web.app
```

### GitHub Pages

1. Ir a: https://github.com/wash91/MI-RESTAURANTE/settings/pages
2. Seleccionar branch: `claude/restaurant-sales-system-01LYHvdfmMwLCevhVRtBAmh4`
3. Click en "Save"
4. URL: https://wash91.github.io/MI-RESTAURANTE/

---

## 📝 Commits Realizados

### Commit 1: `fb87e9c`
**Mensaje:** "Implementar mejoras completas del sistema de restaurante"

**Cambios:**
- ✅ Agregar componentes de impresión de tickets
- ✅ Implementar gestión de cobros en admin
- ✅ Agregar vista de cocina para admin
- ✅ Mejorar reportes con estadísticas detalladas
- ✅ Integrar SheetJS para exportación Excel
- ✅ Agregar filtros por fecha en reportes
- ✅ Crear tabla de productos vendidos

**Archivos modificados:**
- `index.html` (+374 líneas, -18 líneas)

### Commit 2: `10384ea`
**Mensaje:** "Agregar configuración de despliegue y guía de deployment"

**Cambios:**
- ✅ Crear `firebase.json`
- ✅ Crear `.firebaserc`
- ✅ Crear `DEPLOYMENT.md`

**Archivos nuevos:**
- `firebase.json` (configuración hosting)
- `.firebaserc` (proyecto Firebase)
- `DEPLOYMENT.md` (guía de despliegue)

---

## 🧪 Testing Manual

### Flujo Completo de Prueba

**1. Como Vendedor:**
```
1. Login como "Vendedor"
2. Agregar "Hamburguesa Clásica" al carrito (x2)
3. Agregar "Papas Fritas" al carrito (x1)
4. Ingresar cliente: "Juan Pérez"
5. Seleccionar "PAGADO"
6. Seleccionar método: "Efectivo"
7. Click en "CONFIRMAR VENTA"
8. ✅ Verificar que aparece diálogo de impresión
9. ✅ Verificar que ticket tiene todos los datos
10. ✅ Verificar que orden aparece en "Últimos Pedidos"
```

**2. Como Cocinero:**
```
1. Logout y login como "Cocinero"
2. ✅ Verificar que aparece la orden de Juan Pérez
3. ✅ Verificar borde naranja (pendiente)
4. ✅ Verificar tiempo de preparación (15 min)
5. Click en "MARCAR LISTO"
6. ✅ Verificar que borde cambia a verde
7. Click en "ENTREGAR"
8. ✅ Verificar que orden desaparece
```

**3. Como Admin - Reportes:**
```
1. Logout y login como "Admin"
2. Ir a pestaña "Reportes"
3. ✅ Verificar estadísticas:
   - Total General: $12.50
   - Total Pagado: $12.50
   - Total Efectivo: $12.50
4. ✅ Verificar tabla de productos:
   - Hamburguesa Clásica: 2 unidades, $10.00
   - Papas Fritas: 1 unidad, $2.50
5. Click en "Exportar Excel"
6. ✅ Verificar descarga de archivo .xlsx
7. ✅ Abrir Excel y verificar 3 secciones
```

**4. Como Admin - Cobros:**
```
1. Ir a pestaña "Cobros"
2. ✅ Verificar tarjeta de orden con estado verde
3. Click en "Marcar Pendiente"
4. ✅ Verificar que borde cambia a rojo
5. Click en "Transferencia"
6. ✅ Verificar que método actualiza
```

**5. Como Admin - Cocina:**
```
1. Ir a pestaña "Cocina"
2. ✅ Verificar que no hay órdenes activas
3. Crear nueva orden desde otro navegador (Vendedor)
4. ✅ Verificar que orden aparece en tiempo real
5. Click en "MARCAR LISTO"
6. ✅ Verificar funcionamiento idéntico a rol Cocinero
```

**6. Como Admin - Menú:**
```
1. Ir a pestaña "Menú"
2. Agregar producto:
   - Nombre: "Pizza Margarita"
   - Precio: 8.50
   - Tiempo: 20
3. Click en "Guardar"
4. ✅ Verificar que aparece en lista
5. Logout y login como Vendedor
6. ✅ Verificar que nuevo producto está disponible
7. Click en ícono de basura
8. ✅ Verificar que producto se elimina
```

---

## 🔐 Seguridad

### Reglas de Firestore

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /artifacts/{appId}/{collection}/{document=**} {
      allow read, write: if true; // Solo para desarrollo
      // En producción, implementar reglas más estrictas
    }
  }
}
```

### Mejoras de Seguridad Recomendadas

```javascript
// 1. Autenticación con usuarios reales
import { signInWithEmailAndPassword } from 'firebase/auth';

// 2. Reglas de Firestore por rol
match /orders/{orderId} {
  allow read: if request.auth != null;
  allow create: if request.auth.token.role == 'vendedor';
  allow update: if request.auth.token.role in ['admin', 'cocinero'];
}

// 3. Validación de datos
match /products/{productId} {
  allow write: if request.auth.token.role == 'admin'
    && request.resource.data.price is number
    && request.resource.data.prepTime is number;
}
```

---

## 🚀 Mejoras Futuras

### Prioridad Alta
1. **Autenticación real** con email/password
2. **Roles persistentes** en Firestore
3. **Historial de órdenes** completo
4. **Notificaciones en tiempo real** (sonido/visual)
5. **Impresión directa** a impresora térmica

### Prioridad Media
6. **Estadísticas por período** (día/semana/mes)
7. **Gráficos de ventas** (Chart.js)
8. **Gestión de inventario** básica
9. **Descuentos y promociones**
10. **Múltiples mesas/pedidos** simultáneos

### Prioridad Baja
11. **App móvil nativa** (React Native)
12. **Integración con sistemas de pago** (Stripe/PayPal)
13. **Sistema de propinas**
14. **Programa de lealtad** para clientes
15. **Multi-restaurante** (franquicias)

---

## 📞 Soporte y Contacto

**Desarrollador:** Claude (Anthropic)
**Repositorio:** https://github.com/wash91/MI-RESTAURANTE
**Demo:** https://wash91.github.io/MI-RESTAURANTE/
**Firebase Console:** https://console.firebase.google.com/project/mini-restaurante-d0353

---

## 📄 Licencia

Este proyecto fue desarrollado como sistema personalizado. Todos los derechos reservados.

---

**Última actualización:** 25 de Noviembre, 2025
**Versión:** 1.0.0
**Estado:** ✅ Producción (Todas las funcionalidades implementadas)
