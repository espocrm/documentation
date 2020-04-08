# Translation

## PO file

You need to have node installed and installed project dependencies with `npm install`.

Build po file with the following command:

```
node po.js en_EN
```

(specify needed language instead of en_EN)

The file will be created in `build` directory.

After that you can translate the generated po file. You can use some utilite or service for PO file translating. 

Build json files from the translated po file:

1. Put your po file espocrm-en_EN.po into `build` directory
2. Run `node lang.js en_EN`

(use your language instead of en_EN)

Json files will be created in `build` directory grouped by folders.

You can test thranslation by copying files into your EspoCRM directory.


