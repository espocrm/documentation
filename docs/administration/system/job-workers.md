# Job Workers

*As of v10.1.*

Optionally, you can configure the system to process jobs with
workers (instead of [cron](../jobs.md#cron) and [daemon](../jobs.md#daemon)).
EspoCRM is shipped with a RabbitMQ implementation.

Starting commands:

- `bin/command job:prepare`
- `bin/command job:enqueue`
- `bin/command job:worker`

All processes are run in background. A supervisor (e.g. Docker) should re-start them if they exit.

Run multiple worker instances to distribute the workload. Adjust the number of workers to handle the current job load.

Neither cron nor daemon must be run if the workers setup is used.

When the application cache is cleared (e.g. after some customization action), each process gracefully exits. An exited process is meant to be re-started by the supervisor.

`SIGTERM` and `SIGINT` terminate the process gracefully, finishing the current work first.

The config parameter `jobPeriodForReadyNotStarted` defines the maximum lifetime for a job in Ready status (in seconds). By default, it is set to 600 (10 minutes). If a job was published (by *job:enqueue*) but no worker picked it up during this time window, the job will be marked as Failed. Consider increasing this parameter if needed.

## Commands

### job:prepare

Maintains jobs, processes scheduled jobs.

Optional parameters:

- `--interval` – iteration interval is seconds (float or int); default: 10;
- `--limit` – the max number of iterations (int); default: null;`
- `-sq` – skips preparation for `e0`, `q0`, `q1` queues; in this case you need to run separate enqueue and worker processes for each of the three queues;

### job:enqueue

Enqueues jobs.

Optional parameters:

- `--interval` – iteration interval is seconds (float or int); default: 1;
- `--limit` – the max number of iterations (int); default: null;
- `--portion` – the max number of jobs picked in an iteration (int); default:  defined by `jobMaxPortion` param which is defaulted to 15;
- `--queue` – a queue name (string); default: null (which means main queue);

### job:worker

Picks and run jobs.

Optional parameters:

- `--limit` – the max number of iterations (int); default: null;
- `--queue` – a queue name (string); default: null (which means main queue);

The *limit* parameter can be reasonable when the process memory consumption tends to grow.

## Queues

### Running all queues together

```
# One prepare process.
bin/command job:prepare

# One enqueue process.
bin/command job:enqueue

# Multiple worker processes.
bin/command job:worker
```

With this method, jobs from the queues `e0`, `q0`, `q1`  will run sequentially within the main queue, separate jobs are created in the main queue to run these three queues.

### Running queues separately

```
# One prepare process, with `-sq` flag.
bin/command job:prepare -sq

# One enqueue process for the main queue.
bin/command job:enqueue

# One enqueue process for the e0 queue.
bin/command job:enqueue --queue=e0

# One enqueue process for the q0 queue.
bin/command job:enqueue --queue=q0

# One enqueue process for the q1 queue.
bin/command job:enqueue --queue=q1

# Multiple worker processes for the main queue.
bin/command job:worker

# Multiple worker processes for the e0 queue.
bin/command job:worker --queue=e0

# Multiple worker processes for the q0 queue.
bin/command job:worker --queue=q0

# Multiple worker processes for the q1 queue.
bin/command job:worker --queue=q1
```

This method allows you to run multiple workers for any queue, which can be useful for queues with large numbers of jobs. Meaning that jobs from `e0`, `q0`, `q1`  can be processed in parallel.

This method also allows you to schedule jobs with an arbitrary queue name. You need to have running an enqueue and worker processes for that queue.

## Config parameters

RabbitMQ connection example (in `data/config-internal.php`):

```
'rabbitMq' => [
  'host' => 'localhost',
  'port' => 5672,
  'user' => 'guest',
  'password' => 'guest',
],
```

## Inter-process communication

### Redis

Redis can be used for inter-process communication. For example, a web server process can notify worker processes about updates to user roles or changes in currency rates. The workers receive these events and clear the corresponding cache.

1. You need to have Redis running on your server (for example, spun up via Docker).
2. In `data/config-internal.php`, set `'eventTransport' => 'Redis'`.

Optionally, in `data/config-internal.php`, specify Redis credentials:

```
'redis' => [
  'host' => 'localhost',
  'port' => 6379,
],
```

If not specified, defaults are used.
