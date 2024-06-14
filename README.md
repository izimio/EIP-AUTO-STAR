# EIP-AUTO-STAR

> Warning, the API is very very bad so it takes quite a long time, don't worry and leave it turn on background !

## Introduction

Welcome to EIP-AUTO-STAR! This tool automates your starring process supporting your city !

## Prerequisites

- A modern web browser with developer tools
- Access to the web application where you can retrieve your JWT

## Getting Your JWT

To obtain your JWT, follow these simple steps:

1. Open your web application in your preferred browser.
2. Open the developer tools by pressing `F12` or right-clicking on the page and selecting `Inspect`.
3. Go to the `Application` tab.
4. In the sidebar, navigate to `Local Storage`.
5. Find the `token` entry.

Your JWT should be visible here. This token is necessary for running the EIP-AUTO-STAR scripts.

![JWT Location](https://github.com/izimio/EIP-AUTO-STAR/assets/65503390/7883a332-0338-46f2-9b88-757e3421f1d9)

## Setting Up EIP-AUTO-STAR

Once you have your JWT, you need to pass it to the `token` variable in the script.

1. Clone the repository:
   ```bash
   git clone https://github.com/izimio/EIP-AUTO-STAR.git
   cd EIP-AUTO-STAR
   ```

2. Open the script file where you need to insert your token.

3. Locate the `token` variable and replace the placeholder with your actual JWT:
   ```javascript
   const TOKEN = 'your-jwt-token-here';
   ```

4. Save the changes.

## Running the Scripts

With your JWT in place, you are ready to launch the scripts. Depending on your setup, you might need to install some dependencies. If so, follow these steps:

1. Install the necessary dependencies:
   ```bash
   npm install
   ```

2. Run the script:
   ```bash
   npm start
   ```

Happy hacking!
