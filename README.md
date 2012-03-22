## Information

<table>
<tr> 
<td>Package</td><td>shodan</td>
</tr>
<tr>
<td>Description</td>
<td>Shodan API for node</td>
</tr>
<tr>
<td>Node Version</td>
<td>>= 0.4</td>
</tr>
</table>

## Usage

```coffee-script
Shodan = require 'shodan'

# Get an API key at http://shodanhq.com/api_doc
api = new Shodan 'Your API Key'

api.info (err, res) -> # Get API Key info
api.search 'wrt54g city:Phoenix', (err, res) -> # Run a search query
api.locations 'wrt54g', (err, res) -> # Run a location-oriented search query
api.host '216.197.103.72', (err, res) -> # Get all information on a host
api.fingerprint 'OpenSSH', (err, res) -> # Get software name for a banner

api.wps.locate '00:1D:7E:F0:A2:B0', (err, res) -> # Get address/location of a MAC address

api.exploits.search 'microsoft', (err, res) -> # Search ExploitDB 
api.exploits.download '9939', (err, res) -> # Download exploit code

api.msf.search 'microsoft', (err, res) -> # Search Metasploit
api.msf.download 'exploit/windows/smb/smb_relay', (err, res) -> # Download metasploit module
```

## Examples

You can view further examples in the [example folder.](https://github.com/wearefractal/node-shodan/tree/master/examples)

## LICENSE

(MIT License)

Copyright (c) 2012 Fractal <contact@wearefractal.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
