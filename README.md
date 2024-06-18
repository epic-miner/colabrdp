# ColabRDP Setup Script

This repository contains a bash script to automate the setup of a Chrome Remote Desktop environment on a Debian-based system. It creates a new user, installs necessary software including a desktop environment, Google Chrome, and configures Chrome Remote Desktop.

## Features
- Creates a new user and assigns sudo privileges
- Installs Chrome Remote Desktop
- Installs XFCE desktop environment
- Installs Google Chrome
- Configures Chrome Remote Desktop with a specified PIN
- Sets up autostart for a predefined YouTube link

## Requirements
- Debian-based operating system (e.g., Ubuntu)
- Internet connection

## Usage

1. **Clone the repository:**
    ```bash
    git clone https://github.com/epic-miner/colabrdp.git
    cd colabrdp
    ```

2. **Make the script executable:**
    ```bash
    chmod +x rdp.sh
    ```

3. **Run the script:**
    ```bash
    sudo ./rdp.sh
    ```

4. **Follow the prompts:**
    - Enter the desired username.
    - Enter the password for the new user.
    - Enter the Chrome Remote Desktop (CRP) value.

## Script Details

### User Configuration
The script will prompt for the username and password of the new user. This information is used to create and configure the user.

### Chrome Remote Desktop (CRD) Configuration
You will be prompted to enter the CRP value required for Chrome Remote Desktop. The script sets a default PIN (`123456`) for the remote desktop connection.

### Desktop Environment Installation
The script installs the XFCE desktop environment and configures it for use with Chrome Remote Desktop.

### Google Chrome Installation
Google Chrome is installed to provide a browser for the remote desktop environment.

### Autostart Configuration
The script sets up an autostart entry that opens a predefined YouTube link when the user logs in to the desktop environment.

## Notes
- Ensure you have sudo privileges before running the script.
- The script updates the package list and installs necessary dependencies, so it may take some time to complete.
- The CRP value is crucial for setting up Chrome Remote Desktop. Ensure it is entered correctly when prompted.

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request with your improvements.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact
For any questions or suggestions, please open an issue in the repository or contact the maintainer at [epic_miner@example.com](mailto:epicminer771@gmail.com).

---

This project is maintained by [epic-miner](https://github.com/epic-miner).
