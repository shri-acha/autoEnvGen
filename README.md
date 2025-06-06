# autoEnvGen

A lightweight shell script to automatically generate a `.env.example` file by scanning your codebase for environment variable usage.
## Features

- [x] Multi-file & directory scanning
- [x] Supports JavaScript projects
- [x] Partly Supports Python projects
- [x] Partly Supports TypeScript projects
- [ ] Supports Go projects
- [ ] Customizable variable name patterns
- [ ] Better cli.

## Usage

**Run the script**
  ```bash <(curl -s https://raw.githubusercontent.com/shri-acha/autoEnvGen/main/autoEnvGen.sh) py>```
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
