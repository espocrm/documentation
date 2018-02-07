# Entity Manager

Entity Manager está disponible en el panel de administración. Proporciona la capacidad de personalizar al máximo tu instancia de EspoCRM. Usted puede hacer lo siguiente:

* Agregue nuevos tipos de entidades.
* Personalice los tipos existentes de entidades: cambie las etiquetas, el orden predeterminado en la vista de lista, active o desactive la transmisión.
* Configurar campos: agregar nuevo, personalizar los existentes.
* Configure las relaciones: agregue nuevas, cambie las etiquetas de las existentes.

## Creando nueva entidad

Haga clic en el botón `Crear entidad` en la página Administrador de la entidad. Especifique el nombre, las etiquetas y el tipo. Si selecciona `Persona`, su entidad tendrá los campos Correo electrónico, Teléfono, Nombre, Apellido y Saludo. Marque `Stream` si desea que su entidad tenga un panel de flujo y que los usuarios puedan Seguir entidades de este tipo.
Types:

* Base: entidad vacía solo con campos básicos como Nombre, Usuario asignado, Equipos, Descripción.
* Base Plus - como Base pero con paneles de Actividades, Historial, Tareas (disponible desde 4.3.0).
* Evento: fecha de inicio, fecha de finalización, duración, padre, campos de estado. Disponible en el panel Calendario y Actividades (desde 4.3.0, debe estar habilitado en Administration > Settings).
* Persona: correo electrónico, teléfono, nombre, apellido, saludo, campos de dirección. Actividades, historia, paneles de tareas.
* Empresa: correo electrónico, teléfono, dirección de facturación, campos de dirección de envío. Actividades, historia, paneles de tareas.

## Update existing entity

If you click `Edit` link on a certain entity you will be able to change some parameters of that entity.

* Labels - singular and plural name of the entity.
* Default order records are sorted by in list views.
* Stream - whether Stream feature is enabled for this entity.
* Disabled - check if you don't need this entity in your system.
* Text Filter Fields - what fields to search in for the main text filter and global search.


## Fields

By clicking `Fields` link you will be moved to a separate page. There you will be able to create new fields or update existing ones. The following types of fields are available in Entity Manager:

* Address - address with street, city, state, postal code and country;
* Array - list of values, with the ability to select multiple values (not a good option if you need to search by this field); users can add their own values if options are not specified.
* Attachment Multiple - multiple file attachments;
* Auto-increment - read only generated number;
* Boolean - checkbox, true or false;
* Currency - for currency values;
* Date;
* DateTime;
* Enum - selectbox, with the ability to select only one value;
* File - uploading one file;
* Float - number with a decimal part;
* Foreign - a field of related entity;
* Image - uploading image file with a preview;
* Integer - whole number;
* Number - auto-incrementing number of string type with a possible prefix and a specific length;
* Multi-enum - list of values, with the ability to select multiple values (not a good option if you need to search by this field), similar to Array but nicer.
* Text - text area, for long multiline texts;
* Url - for links;
* Varchar - short text;
* Wysiwyg - similar to Text field, with the ability to format text.

Parameters:
* Required - whether filling in of the field is mandatory.
* Default Value - Value of the field set upon creating new record.
* Audited - updates of the field will be logged in Stream.

**Note**: After you have added the new field you need to put this field on [layouts](layout-manager.md) (Administration > Layout Manager).

### Dynamic Logic

Provides an ability to make forms dynamic. It's possible to define conditions making certain fields visible, required or read-only. Conditions will be checked automatically when data in the form is changed.

For Enum, Array and Multi Enum fields it's possible to define different sets of options that will be available for the field depending on which condition is met.


## Relationships

You can create new relationships between both out-of-box and custom entities. There are 3 available relationship types:

* One-to-Many: after you have created this relationship you can put a link field to the detail layout of the right entity and add relationship panel to the left entity;
* Many-to-One: the same as One-to-Many but vice versa;
* Many-to-Many: relationship panels on both sides.

Parameter 'Link Multiple Field' implies that the field of `linkMultiple` type will be created along with relationship. You can put such a field on the layout. It's convenient for quick picking of related records. It's not a good option if your relationship is intended to have a lot of linked records that can slow down loading of detail view screen.

If parameter 'Audited' is checked then updates of the relationship will be logged in Stream.
