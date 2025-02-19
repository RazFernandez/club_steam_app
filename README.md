<<<<<<< Firebase_auth
# club_steam_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
=======
# Club STEAM App

## Descripción

La **aplicación Club STEAM** está diseñada para fomentar el aprendizaje de conceptos STEAM (Ciencia, Tecnología, Ingeniería, Arte y Matemáticas) entre estudiantes de secundaria. Permite a **docentes**, **estudiantes** y **colaboradores** gestionar proyectos, compartir documentos, y colaborar de manera eficiente dentro de un entorno educativo.

---

## Tabla de Contenidos
- [Características Principales](#características-principales)
- [Estructura de la Base de Datos](#estructura-de-la-base-de-datos)
- [Servicios de Firebase Usados](#servicios-de-firebase-usados)
- [Roles y Acciones](#roles-y-acciones)
- [Vistas Principales](#vistas-principales)
- [Consideraciones Especiales](#consideraciones-especiales)
- [Cómo Contribuir](#cómo-contribuir)

---

## Características Principales

- Gestión de proyectos colaborativos con diferentes niveles de acceso.
- Envío, evaluación y retroalimentación de documentos PDF.
- Notificaciones en tiempo real para acciones clave.
- Recuperación de contraseñas mediante SMS.
- Personalización de perfiles de usuario.

---

## Estructura de la Base de Datos

### **Usuarios**
| Campo             | Tipo    | Descripción                                   |
|-------------------|---------|-----------------------------------------------|
| nombres           | String  | Nombre(s) del usuario.                       |
| apellidoPaterno   | String  | Apellido paterno del usuario.                |
| apellidoMaterno   | String  | Apellido materno del usuario.                |
| correoElectronico | String  | Dirección de correo electrónico.             |
| numeroCelular     | String  | Número de teléfono móvil.                    |
| tipoUsuario       | String  | Tipo de usuario: Docente, Estudiante, Colaborador. |
| proyectos         | Array   | Lista de proyectos asociados.                |
| unidadAdministrativa | String | (Colaboradores) Unidad administrativa.      |
| numeroControl     | String  | (Estudiantes) Número de control.             |
| ingenieria        | String  | (Docentes y Colaboradores) Ingeniería asociada. |

---

### **Proyectos**
| Campo             | Tipo     | Descripción                                  |
|-------------------|----------|----------------------------------------------|
| nombreProyecto    | String   | Nombre del proyecto.                        |
| descripción       | String   | Breve descripción del proyecto.             |
| imagenBanner      | String   | URL de la imagen del banner.                |
| estudianteEncargado | String | ID del estudiante encargado.                |
| colaboradores     | Array    | Lista de IDs de colaboradores.              |
| creadoPor         | String   | ID del docente creador del proyecto.        |
| fechaCreacion     | Timestamp| Fecha de creación del proyecto.             |
| docentes          | Array    | IDs de docentes asociados al proyecto.      |

---

### **Documentos**
| Campo             | Tipo     | Descripción                                  |
|-------------------|----------|----------------------------------------------|
| nombreDocumento   | String   | Nombre del documento.                       |
| fechaLimite       | Timestamp| Fecha límite para enviar el documento.      |
| estado            | String   | Estado del documento: Pendiente, Aprobado, Necesita revisión. |
| archivoPDF        | String   | URL del archivo PDF.                        |
| subidoPor         | String   | ID del usuario que subió el documento.      |
| fechaSubida       | Timestamp| Fecha de subida del documento.              |

---

### **Notificaciones**
| Campo             | Tipo     | Descripción                                  |
|-------------------|----------|----------------------------------------------|
| nombreUsuario     | String   | Nombre del usuario asociado.                |
| evento            | String   | Tipo de evento: Invitación, Documento listo, etc. |
| descripción       | String   | Breve descripción del evento.               |
| proyectoID        | String   | ID del proyecto relacionado.                |
| fechaHora         | Timestamp| Fecha y hora del evento.                    |
| leido             | Boolean  | Indica si la notificación fue leída.        |

---

## Servicios de Firebase Usados
1. **Firebase Authentication**: Gestión de usuarios y autenticación.
2. **Firebase Cloud Storage**: Almacenamiento de documentos y banners.
3. **Cloud Firestore**: Base de datos en tiempo real.
4. **Firebase Messaging**: Notificaciones push.

---

## Roles y Acciones

### **Docente**
- Crear, editar y eliminar proyectos.
- Crear, editar y eliminar documentos.
- Descargar y evaluar documentos.
- Invitar colaboradores y estudiantes.

### **Estudiante**
- Aceptar invitaciones.
- Subir documentos.
- Descargar documentos.
- Abandonar proyectos.

### **Colaborador**
- Aceptar invitaciones.
- Descargar documentos.
- Abandonar proyectos.

---

## Vistas Principales

1. **Login View**: Inicio de sesión y recuperación de contraseña.
2. **Register View**: Registro de nuevos usuarios.
3. **Home View**: Vista principal personalizada según el rol.
4. **Project View**: Gestión de proyectos.
5. **Document View**: Envío y evaluación de documentos.
6. **Profile View**: Configuración del perfil.
7. **Notifications View**: Gestión de notificaciones.

---

## Consideraciones Especiales
- Los usuarios pueden editar sus datos desde la vista de perfil (excepto el correo y el tipo de usuario).
- Las notificaciones permiten aceptar invitaciones, subir documentos y revisar estados.
- La eliminación de cuentas limpia los datos asociados.

---

## Cómo Contribuir
1. Haz un fork del repositorio.
2. Crea una rama para tus cambios: `git checkout -b feature/nueva-funcionalidad`.
3. Realiza tus modificaciones y confirma los cambios: `git commit -m "Descripción del cambio"`.
4. Sube los cambios a tu rama: `git push origin feature/nueva-funcionalidad`.
5. Abre un pull request en este repositorio.

---

### Licencia
Este proyecto está bajo la licencia MIT. Para más detalles, consulta el archivo `LICENSE`.
>>>>>>> main
