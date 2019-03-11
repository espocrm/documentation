# Web-to-Lead
## Захват кандидата

Примечание: доступно с версии 5.4.0.

Используя функцию "Захват кандидата", администратор может создать точку входа для захвата потенциальных клиентов через API. Для создания точки входа перейдите в Администрирование > Захват кандидата.

* Subscribe to Target List - Созданный кандидат будет добавлен в указанный список целей;
* Subscribe Contact if exists - Если контакт с таким же адресом электронной почты существует, контакт будет добавлен в список целей;
* Target Team - Группа, которой назначат созданного кандидата;
* Campaign - Статистика будет доступна в журнале кампании;
* Payload Fields - Выберите, какие поля должны быть переданы.

### Двойное подтверждение подписки (double opt-in/confirmed opt-in)

Если включено двойное подтверджение подписки, ваши подписчики должны подтвердить свое намерение подписаться, щелкнув ссылку в электронном письме. Электронное письмо будет отправлено автоматически после получения данных через API.

Создайте шаблон эл. письма, который будет использоваться для двойного подтверждения подписки. Вы можете использовать следующие заполнители в теле шаблона:

* `{optInUrl}` - URL для подтверждения подписки;
* `{optInLink}` - ссылка для подтверждения подписки.

Ссылка для подтверждения подписки будет добавлена автоматически, если вы не вставили заполнитель в шаблон эл. письма.

## Отправка запроса API

Ваш веб-сайт должен сделать запрос POST для отправки данных формы вам CRM. Запрос не требует авторизации. Вам просто нужно использовать определенный URL с ключом API. Информация о запросе доступна на боковой панели в детальном виде Захвата кандидатов.

Требуемые заголовки:

* Content-Type: application/json
* Accept: application/json


### PHP

Вы можете использовать [API client for PHP](../development/api-client-php.md).

Пример:

```php
<?php

require_once('EspoApiClient.php');

$client = new EspoApiClient('https://URL_OF_YOUR_CRM');

$apiKey = 'f1b04885f28ee1a6d55dd203daed68f9'; // specify your API key here

$formData = [
    'firstName' => $_POST['firstName'],
    'lastName' => $_POST['lastName'],
    'emailAddress' => $_POST['emailAddress']
];

$client->request('POST', 'LeadCapture/' . $apiKey, $formData);

```

### Python

[API client in Python](../development/api-client-python.md)

### Непосредственно через веб-браузер

Примечание: работает с версии 5.4.4.

Пример:

```html
<div id="web-to-lead-form-container">
    <form id="web-to-lead-form">
        <div>
            <input type="text" name="firstName" placeholder="First Name">
        </div>
        <div>
            <input type="text" name="lastName" placeholder="Last Name" required>
        </div>
        <div>
            <input type="email" name="emailAddress" placeholder="Email Address" required>
        </div>
        <div>
            <button type="submit" name="submit">Submit</button>
        </div>
    </form>
</div>
<script type="text/javascript">
    var webToLeadFormElement = document.getElementById('web-to-lead-form');
    var webToLeadFormIsSubmitted = false;

    webToLeadFormElement.addEventListener('submit', function (event) {
        event.preventDefault();
        if (webToLeadFormIsSubmitted) return;
        webToLeadFormIsSubmitted = true;
        webToLeadFormElement.submit.setAttribute('disabled', 'disabled');

        var payloadData = {
            firstName: webToLeadFormElement.firstName.value,
            lastName: webToLeadFormElement.lastName.value,
            emailAddress: webToLeadFormElement.emailAddress.value
        };

        // Needed url can be found on Lead Capture detail view.
        var url = 'https://URL_OF_YOUR_CRM/api/v1/LeadCapture/API_KEY'; 

        var xhr = new XMLHttpRequest();
        xhr.open('POST', url, true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.setRequestHeader('Accept', 'application/json');
        xhr.onreadystatechange = function() {
            if (this.readyState == XMLHttpRequest.DONE && this.status == 200) {
                var containerElement = document.getElementById('web-to-lead-form-container');
                containerElement.innerHTML = 'Sent';
            }
        }
        xhr.onerror = function() {
            webToLeadFormElement.submit.removeAttribute('disabled');
            webToLeadFormIsSubmitted = false;
        }
        xhr.send(JSON.stringify(payloadData));
    });
</script>
```

Заголовок 'Access-Control-Allow-Origin' может быть установлен в data/config.php с помощью параметра `leadCaptureAllowOrigin`. По умолчанию используеться `*` значение.

## Распределение назначения кандидатов (Lead assignment distribution)

Используя [Рабочие потоки](workflows.md) или [Управление Бизнес-Процессами](bpm.md), вы можете создать правило назначения, которое будет распределять кандидатов среди пользователей группы. Доступны правила Round-Robin и Least-Busy.

Чтобы применить правило только для кандидатов, появляющихся через точку входа, вы можете использовать поле Кампания (Campaign) для проверки условий.
