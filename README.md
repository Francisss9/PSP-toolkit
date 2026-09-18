# 🎮 PSP Toolkit

<br>

## 📌 Overview

**PSP Toolkit** is a structured collection of essential tools for PSP modding and maintenance.
It consolidates widely used software into a single, organized repository to streamline workflows for both beginners and advanced users.

This project prioritizes:

* Clean structure
* Reliability of tools
* Ease of navigation
* Practical modding workflows

---

## ⚙️ Features

* 📦 Centralized toolkit for PSP modding
* 🔧 Custom Firmware (CFW) installers and utilities
* 🧩 Plugin management tools
* 🛠️ Recovery and diagnostic utilities
* 📁 Organized directory structure
* 📚 Expandable and maintainable

---

## 📂 Project Structure

```
PSP-toolkit/
│
├── tools/              # Core modding software, one folder per tool
│   └── at3-converter/  # mp3 → AT3 conversion pipeline
├── firmware/            # CFW files, installers and links to github repositories
├── plugins/             # PSP plugins (.prx and configs)
├── recovery/            # Recovery and unbricking tools
├── docs/                # Guides and documentation
└── README.md
```

Each tool folder is self-contained: it has its own `README.md` explaining what it does,
its requirements, and how to use it.

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/Francisss9/PSP-toolkit.git
cd PSP-toolkit
```

---

### 2. Choose your workflow

* **Install Custom Firmware (CFW)**

  * Navigate to `firmware/`
  * Follow instructions inside each tool folder

* **Install Plugins**

  * Copy `.prx` files from `plugins/` to your PSP
  * Edit `seplugins/*.txt` accordingly

* **Run Tools**

  * Navigate to `tools/<tool-name>/` and follow its README

---

## 🧰 Included Tools (Planned / In Progress)

> Update this section as you add tools

### Firmware

* N/A

### Plugins

* N/A

### Utilities

* [AT3 Converter](tools/at3-converter/README.md) — mp3/wav → AT3 conversion pipeline

### Recovery

* N/A

---

## ⚠️ Disclaimer

This repository is for **educational and preservation purposes only**.

* You are responsible for how you use these tools
* Incorrect usage may brick your PSP and since it's old hardware be aware.
* Always verify compatibility with your model and firmware because doing something for 1k and it's only for 3k model, it can damage your PSP or not even work properly.

---

## 📖 Documentation

Detailed guides will be available in the `/docs` directory:

* Installing and using new CFW
* Plugin configuration
* Best/Popular plugins and how to install
* Recovery procedures

---

## 🤝 Contributing

Contributions are welcome if they improve:

* Organization
* Documentation
* Tool reliability

### Guidelines:

* Keep structure clean and consistent
* Avoid duplicate or unsafe tools
* Document anything you add
* Each tool lives in its own folder under `tools/`, `firmware/`, `plugins/` or `recovery/`,
  with its own README

---

## 🧠 Philosophy

This is not just a dump of files.

The goal is to build a **clean, structured, and reliable PSP modding environment** — something closer to a toolkit engineers would use, not a random archive.

---

## 📌 Roadmap

* [x] Finish AT3 converter setup
* [ ] Add first complete tool (stable)
* [ ] Introduce CFW installers
* [ ] Add plugin pack with configs
* [ ] Write detailed setup guides
* [ ] Improve documentation quality
* [ ] Add automation scripts
* [ ] Versioning system for tools
* [ ] launch as package

---

## 🔗 Author

Maintained by **Francis**
Focused on performance, structure, and long-term usability.
