# HUBOT Cookbook

Cookbook in Chef to introduce Hubot into RochetChat.

## Requirements

### Platforms

- AmazonLinux

### Chef

- Chef 12.0 or later

### Cookbooks

- `RocketChat` - HUBOT needs RochetChat to install.

## Attributes

### HUBOT::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['hubot']['room']</tt></td>
    <td>Text</td>
    <td>Room for Hubot</td>
    <td><tt>general</tt></td>
  </tr>
  <tr>
    <td><tt>['hubot']['user']</tt></td>
    <td>Text</td>
    <td>The user Hubot uses</td>
    <td><tt>bot</tt></td>
  </tr>
  <tr>
    <td><tt>['hubot']['password']</tt></td>
    <td>Text</td>
    <td>The user's password</td>
    <td><tt>bot</tt></td>
  </tr>
</table>

## Usage

### HUBOT::default

Just include `RocketChat` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[HUBOT]"
  ]
}
```

## License and Authors

Authors: nekonoprotocol

