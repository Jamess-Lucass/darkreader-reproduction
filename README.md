# Dark reader reproduction

This repo contains code to reproduce a performance issue with dark reader when a lot of CSS, specifically tailwindcss < 3, due to version 1 & 2 importing all tailwind classes whereas version 3 introduced their JIT compiler to slim the build down.

## How to run?

> I did all my testing with the vite app running inside a container, just for more consistency,

```bash
docker compose up -d --build
```

Then visit `http://localhost:8080`

## Current benchmarks

Firefox: (Disable Cache: checked)

1. No dark reader: `145ms`
2. Dark reader `v4.9.80`: `1.38s`
3. Dark reader `v4.9.81`: `2.84m`

As you can see `v4.9.81` introduced a significant increase to page load times for these scenarios.
