# Backend Coding Practices

## Namespace structure

Within a module namespace:

- `Entities\` – entities;
- `Controllers\` – record controllers
  (should not implement any additional logic, only extend the Record controller);
- `EntryPoints\` – entry points (accessible by `?entryPoint={name}`);
- `Hooks\{EntityType}\` – hooks (such as before-save, after-save);
- `Tools\` – domain level code, for business logic;
- `Tools\{DomainName}\Api\` – API actions (entry points for API);
- `Tools\{DomainName}\Jobs\` – jobs;
- `Tools\{DomainName}\Exceptions\` – domain-level exceptions;
- `Classes\` – framework related implementations;


The *Classes* namespace structure (recommendations, not strict rules):

- `Classes\Select\{EntityType}\` – Select framework related implementations;
- `Classes\Record\{EntityType}\` – Record framework related implementations;
- `Classes\Acl\{EntityType}\` – ACL framework related implementations;
- `Classes\AclPortal\{EntityType}\` – ACL framework related implementations related to portals;
- `Classes\Jobs\` – scheduled jobs;
- `Classes\AppParams\` – AppParams implementations;
- `Classes\Cleanup\` – Cleanup implementations;
- `Classes\MassAction\` – Mass actions implementations;
- `Classes\Action\` – Action implementations;
- `Classes\ConsoleCommands\` – Console command implementations;
- `Classes\FieldValidators\{EntityType}\{Field}` – field validators;
