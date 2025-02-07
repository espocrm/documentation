# API Client implementation in Zig

- [Installation](#installation)
- [API Key authentication](#using-api-key-authentication)
- [Making a read GET request](#making-a-read-request)
- [Making a list GET request](#making-a-list-request)
- [Making a create POST request](#making-a-create-request)
- [Making an update PUT request](#making-an-update-request)
- [Making a delete DELETE request](#making-a-delete-request)

For the source code, refer to [GitHub](https://github.com/definitepotato/espocrmz).

# Getting Started

This Zig `espocrm` library provides an API client for EspoCRM. To get started you'll have to provide the URL where EspoCRM is located and your method of authentication. Read more from the [official documentation](https://docs.espocrm.com/development/api/#authentication).

## Installation

Add this to your build.zig.zon

```zig
.dependencies = .{
    .espocrmz = .{
        .url = "https://github.com/definitepotato/espocrmz/archive/refs/heads/master.tar.gz",
        //the correct hash will be suggested by zig
    }
}
```

Add this to your build.zig

```zig
const espocrmz = b.dependency("espocrmz", .{
    .target = target,
    .optimize = optimize,
});
exe.root_module.addImport("espocrmz", espocrmz.module("espocrmz"));
```

You can then import the library into your code like this

```zig
const espocrm = @import("espocrmz").Client;
```

## Basic Usage

### Using API Key Authentication:

```zig
var gpa = std.heap.GeneralPurposeAllocator(.{}){};
defer _ = gpa.deinit();
const allocator = gpa.allocator();
const client = Client.init("https://espocrm.example.com", .{ .api_key = "Your API Key here" });
```

### Making a Read request:

```zig
var gpa = std.heap.GeneralPurposeAllocator(.{}){};
defer _ = gpa.deinit();
const allocator = gpa.allocator();

const result = try client.readEntity("Contact", "78abc123def456", allocator);
defer allocator.free(result);
```

### Making a List request:

```zig
var gpa = std.heap.GeneralPurposeAllocator(.{}){};
defer _ = gpa.deinit();
const allocator = gpa.allocator();

var params = espocrm.Parameters.init();
_ = params.maxSize(10).order(espocrm.Parameters.Order.Asc);
const params_encoded = try params.encode(allocator);

const result = try client.listEntities(allocator, "Contact", params, &[_]espocrm.Where{
  .{ .filter_type = espocrm.FilterOption.Equals, .filter_attribute = "name", .filter_value = "Alice" },
  .{ .filter_type = espocrm.FilterOption.GreaterThan, .filter_attribute = "age", .filter_value = "42" },
});
defer allocator.free(result);
```

### Making a Create request:

```zig
var gpa = std.heap.GeneralPurposeAllocator(.{}){};
defer _ = gpa.deinit();
const allocator = gpa.allocator();

const new_contact =
  \\{
  \\  "name": "Alice",
  \\  "age": 69
  \\}
;

const result = try espocrm.createEntity(allocator, "Contact", new_contact);
defer allocator.free(result);
```

### Making an Update request:

```zig
var gpa = std.heap.GeneralPurposeAllocator(.{}){};
defer _ = gpa.deinit();
const allocator = gpa.allocator();

const update_info =
  \\{
  \\  "name": "Bob
  \\}
;

const result = try client.updateEntity(allocator, "Contact", "67abe33f5883bd9e", update_info);
defer allocator.free(result);
```

### Making a Delete request:

```zig
var gpa = std.heap.GeneralPurposeAllocator(.{}){};
defer _ = gpa.deinit();
const allocator = gpa.allocator();

const result = try client.deleteEntity(allocator, "Contact", "67abe33f5883bd9e");
defer allocator.free(result);
```
