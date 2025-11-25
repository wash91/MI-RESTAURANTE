# 🔧 Configuración de Usuarios - Restaurante Ágil

## 📋 Problema Resuelto

El sistema ahora usa **Firestore** para almacenar los roles de los usuarios, en lugar de detectarlos por el nombre del email. Esto permite:

✅ Asignar cualquier rol a cualquier email
✅ Cambiar roles sin modificar el código
✅ Agregar nuevos usuarios fácilmente

---

## 🚀 Pasos para Configurar Usuarios

### Paso 1: Obtener los UIDs de Firebase Authentication

1. Ve a [Firebase Authentication](https://console.firebase.google.com/project/mini-restaurante-d0353/authentication/users)
2. Verás la lista de usuarios creados
3. Para cada usuario, **copia el "User UID"** (es un código largo como `xYz123AbC...`)

**Usuarios actuales:**
- `jonathanlk08@gmail.com` → Debe ser **Administrador**
- `lucymontenieves@gmail.com` → Debe ser **Vendedor**

---

### Paso 2: Configurar los Roles en Firestore

**Opción A: Usar la página de configuración (Recomendado)**

1. Abre: **https://mini-restaurante-d0353.web.app/configurar-usuarios.html**
2. Pega el UID de cada usuario en los campos correspondientes
3. Ajusta los nombres si lo deseas
4. Click en "Configurar Usuarios en Firestore"
5. ✅ ¡Listo! Los roles están configurados

**Opción B: Configurar manualmente en Firebase Console**

1. Ve a [Firestore Database](https://console.firebase.google.com/project/mini-restaurante-d0353/firestore)
2. Crea una colección llamada `usuarios`
3. Para cada usuario, crea un documento con ID = UID del usuario
4. Agrega estos campos:
   ```
   email: "jonathanlk08@gmail.com"
   nombre: "Jonathan"
   rol: "admin"
   creadoEn: (timestamp)
   ```

---

### Paso 3: Probar el Login

1. Ve a: **https://mini-restaurante-d0353.web.app**
2. Inicia sesión con:
   - Email: `jonathanlk08@gmail.com`
   - Contraseña: (la que configuraste)
3. ✅ Deberías ver el **Panel Admin**

---

## 👥 Roles Disponibles

| Rol | Valor en Firestore | Permisos |
|-----|-------------------|----------|
| Administrador | `admin` | Acceso total: reportes, cobros, cocina, menú |
| Cocinero | `cocinero` | Ver y gestionar órdenes de cocina |
| Vendedor | `vendedor` | Registrar ventas y clientes |

---

## ➕ Agregar Nuevos Usuarios

### 1. Crear usuario en Firebase Auth

1. Ve a [Firebase Authentication](https://console.firebase.google.com/project/mini-restaurante-d0353/authentication/users)
2. Click en "Add user"
3. Ingresa email y contraseña
4. Copia el UID generado

### 2. Configurar rol en Firestore

Usa la página de configuración o agrega manualmente en Firestore:

```javascript
// Colección: usuarios
// Documento ID: UID del usuario
{
  email: "nuevo@usuario.com",
  nombre: "Nombre del Usuario",
  rol: "vendedor", // o "cocinero" o "admin"
  creadoEn: new Date().toISOString()
}
```

---

## 🔍 Verificar Configuración

En la página de configuración, usa el botón "Verificar Configuración" para ver qué usuarios están en Firestore y sus roles.

---

## ⚠️ Notas Importantes

- **Los usuarios DEBEN existir en Firebase Authentication** (crear primero allí)
- **El rol se consulta desde Firestore** (configurar después)
- **Si un usuario no está en Firestore**, se le asigna rol `vendedor` automáticamente
- **Los cambios de rol son inmediatos** (solo recargar página)

---

## 🆘 Solución de Problemas

**Problema:** Usuario tiene rol incorrecto
- ✅ **Solución:** Verifica que el UID en Firestore coincida con el de Firebase Auth

**Problema:** Usuario no puede iniciar sesión
- ✅ **Solución:** Verifica que el usuario exista en Firebase Authentication

**Problema:** Rol no se actualiza
- ✅ **Solución:** Cierra sesión y vuelve a iniciar sesión

---

## 📞 Soporte

Para cualquier problema, verifica:
1. Firebase Authentication: usuarios creados
2. Firestore: colección `usuarios` con documentos correctos
3. Console del navegador (F12) para ver errores
