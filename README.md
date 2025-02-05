﻿# Custom Search Engine Manager

CustomSearchEngineManager is a PowerShell script designed to help users add and manage custom search engines in Google Chrome or any other Browser. The script inserts a new custom search engine entry into Chrome's settings and includes commented code for developers who wish to customize it further.

## Features

- Add a custom search engine to Google Chrome.
- Customize search engine details such as name, keyword, favicon, and search URL.

## Requirements

- PowerShell
- PSSQLite module

## Installation

1. Install the PSSQLite module if you haven't already:

```bash
Install-Module -Name PSSQLite
```
2. Clone this repository to your local machine:
```bash
git clone https://github.com/tauseedzaman/Custom-Search-Engine-Manager
```

3. Usage
Open the script file `script.ps1` in a text editor.
Customize the search engine details as desired:
```powershell
# Define custom search engine information
$short_name = 'Ecosia'
$keyword = 'ecosia.or'
$favicon_url = 'https://www.ecosia.org/static/icons/favicon.ico'
$url = 'https://www.ecosia.org/search?method=index&q={searchTerms}'
$suggest_url = 'https://www.ecosia.org/suggest?q={searchTerms}'
$image_url = 'https://www.ecosia.org/images/search'
```

4. Run the script in PowerShell:
```powershell
script.ps1
```
You should see a confirmation message indicating the query executed successfully.

# Customization for Developers
The script includes commented code sections that other developers can use to customize the functionality further, such as setting the newly added search engine as the default. Uncomment and modify the code as needed.

# Contributing
Contributions are welcome! Please feel free to submit a Pull Request or open an Issue if you have any suggestions or improvements.

## Demo Video
Watch the demo video:

[![Custom Search Engine Manager Demo](https://img.youtube.com/vi/MM6e3PFdBEs/0.jpg)](https://www.youtube.com/watch?v=MM6e3PFdBEs)
