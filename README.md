# 🔧 autoEnvGen

A lightweight shell script to **automatically generate a `.env.example`** file by scanning your codebase for environment variable usage.

---

## ✨ Features

- ✅ Scans multiple files and directories recursively  
- ✅ Detects environment variables in **JavaScript**  
- ⚠️ Partial support for **Python**  
- ⚠️ Partial support for **TypeScript**  
- 🚧 Go support coming soon  
- 🚧 Customizable variable name patterns (planned)  

---

## 🚀 Usage

**Run the script using:**

```bash
bash <(curl -s https://raw.githubusercontent.com/shri-acha/autoEnvGen/main/autoEnvGen.sh) <project_file_type>
