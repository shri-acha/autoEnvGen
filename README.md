# autoEnvGen

A lightweight shell script to automatically generate a `.env.example` file by scanning your codebase for environment variable usage. No need for an existing `.env` file—autoEnvGen inspects your source code to infer required environment variables, making onboarding and sharing requirements easier and safer.

## Features

- [x] Multi-file & directory scanning
- [x] Supports JavaScript projects
- [x] Supports Python projects
- [x] Supports TypeScript projects
- [ ] Supports Go projects
- [ ] Customizable variable name patterns
- [ ] Better cli.

## Usage

1. **Clone the repository:**
   ```sh
   git clone https://github.com/shri-acha/autoEnvGen.git
   ```

2. **Make the script executable:**
   ```sh
   chmod +x autoEnvGen.sh
   ```

3. **Run the script in your project directory:**
   ```sh
   ./autoEnvGen.sh
   ```
   This will scan your codebase and generate a `.env.example` with all detected environment variables.

## Example

Suppose your code contains:
```js
process.env.DB_HOST
process.env.DB_USER
process.env.DB_PASS
```
or
```python
os.environ["API_KEY"]
os.getenv("SECRET_KEY")
```

After running `autoEnvGen.sh`, your `.env.example` will contain:
```
DB_HOST=
DB_USER=
DB_PASS=
API_KEY=
SECRET_KEY=
```

## Contributing

Help us expand language support, improve detection, or add new features!  
See [issues](https://github.com/shri-acha/autoEnvGen/issues) or open a pull request.

## License

This project is currently unlicensed. Please open an issue if you'd like to contribute or use this in a project.

---
