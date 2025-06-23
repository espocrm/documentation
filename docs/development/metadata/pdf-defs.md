# pdfDefs

Path: metadata > pdfDefs > {EntityType}.

## dataLoaderClassNameList

*class-string<Espo\Tools\Pdf\DataLoader\>[]*

List of classes that loads additional data for PDF. Classes should implement the interface `Espo\Tools\Pdf\DataLoader`. Use `__APPEND__` for extending.

## pdfA

*boolean*

*As of v9.2.*

Enables PDF/A.

## attachmentProviderClassNameList

*class-string<Espo\Tools\Pdf\AttachmentProvider\>[]*

*As of v9.2.*

Attachment providers. PDF/A has to be enabled to be able to include files in PDF.
