# Email Sending

Actual as of v7.0.0.

Example:

```php
namespace Espo\SomeNamespace;

use Espo\Core\Mail\EmailSender;
use Espo\Core\Mail\EmailFactory;
use Espo\Core\Mail\SmtpParams; // optional

class SomeClass
{
    private $emailSender;
    
    private $emailFactory;
    
    public function __construct(EmailSender $emailSender, EmailFactory $emailFactory)
    {
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
