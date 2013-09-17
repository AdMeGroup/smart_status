# S.M.A.R.T. status

This gem extracts and processes info about HDD health status (S.M.A.R.T.)

## Requirements

* You need to have `smartctl` to be installed
* You need to be able to run it with passwordless `sudo` (use `NOPASSWD` in sudoers)

## Usage

```ruby
require 'smart_status'
require 'pp'

processor = SMARTStatus::Parser.new("/dev/sda1")

while true do
  pp processor.process
  sleep 1
end
```

## Experimental status

The code is in experimental state yet and should not be used for production. Use at your own risk

Classname for `SMARTStatus::Parser` is expected to be changed (suggestions are welcome).

## Contributing

Pull requests are welcome.

## TODOs for later times

* Add possibility to run `smartctl` without `sudo` (you'll need to tweak user groups and block device permissions in this case instead of editing `sudoers`)
* Nice format output for `SMARTStatus::Attribute#inspect` and `SMARTStatus::Attribute#to_s`

## License and Author

    Author:: Timur Batyrshin (<erthad@gmail.com>)
    License:: Apache 2.0
