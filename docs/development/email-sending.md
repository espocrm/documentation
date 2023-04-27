# Email Sending

Example:

```php
<?php
namespace Espo\SomeNamespace;

use Espo\Core\Mail\EmailSender;
use Espo\Core\Mail\EmailFactory;
use Espo\Core\Mail\SmtpParams; // optional

class SomeClass
{   
    public function __construct(
        private EmailSender $emailSender,
        private EmailFactory $emailFactory
    ) {
        $this->emailSender = $emailSender;
        $this->emailFactory = $emailFactory;
    }
    
    public function send(): void
    {
        $email = $this->emailFactory->create();
        
        $email->setSubject('Subject');
        $email->setBody('Email Body');
        $email->addToAddress('some@address.com');
        $email->setFromAddress('some@address.com'); // optional; if not specified, the system address will be used
        $email->setIsPlain(); // Html is by default
        
        $smtpParams = SmtpParams::create(); // build SMTP params (optionally)

        $this->emailSender
            ->withSmtpParams($smtpParams) // optional
            ->withAttachments([$attachment]) // optional, to send with attachments
            ->send();
    }
}
```
