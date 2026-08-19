# INSTRUCTIONS

Start by creating a Spin app

```bash
# -t to set the desired template
# -a to accept defaults
spin new -t http-rust hello-rust -a

cd hello-rust
```

Explore the [Application Manifest](./hello-rust/spin.toml) and change the message returned from the application by editing [src/lib.rs](./hello-rust/src/lib.rs).

Now compile your source code down to WebAssembly using `spin build`:

```bash
# Compile Source to Wasm
spin build
```

Launch the application using `spin up`

```bash
# Run the application for testing purposes
spin up
```

Codespace will display a prompt allowing you to open the exposed endpoint using your default web browser.