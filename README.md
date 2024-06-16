# EIP-AUTO-STAR

> **Warning:** The API is very slow, so please be patient and consider running this in the background.

## Introduction

Welcome to EIP-AUTO-STAR! This script automates the process of supporting your city by starring. It interacts with a web application using your JWT token for authentication.

## Prerequisites

Before you begin, ensure you have the following:

- A modern web browser with developer tools.
- Access to the web application where you can retrieve your JWT.
- **jq** package installed. You can install it using:
  ```bash
  sudo apt-get install jq   # For Debian-based systems like Ubuntu
  ```

## Getting Your JWT

To obtain your JWT, follow these steps:

1. Open your web application in your preferred browser.
2. Open the developer tools by pressing `F12` or right-clicking on the page and selecting `Inspect`.
3. Go to the `Application` tab.
4. In the sidebar, navigate to `Local Storage`.
5. Find the `token` entry.

Your JWT should be visible here. This token is necessary for running the EIP-AUTO-STAR script.

![JWT Location](https://github.com/izimio/EIP-AUTO-STAR/assets/65503390/7883a332-0338-46f2-9b88-757e3421f1d9)

Now that you have your JWT, you are ready to run the script.

1. Clone the repository:

   ```bash
   git clone https://github.com/izimio/EIP-AUTO-STAR.git
   cd EIP-AUTO-STAR
   ```

## Running the Script

1. Make sure you are in the `EIP-AUTO-STAR` directory.

2. Run the script:

   ```bash
   ./eip-auto-star.sh
   ```

3. Follow the prompts and interact with the scripts to past your JWT and start the process.

Happy hacking!
