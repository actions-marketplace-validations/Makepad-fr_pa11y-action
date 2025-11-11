

# Pa11y Action

Run automated accessibility audits with [Pa11y](https://pa11y.org/) in your Github actions.

## Usage

```yaml
name: Accessibility Test

on:
  pull_request:
  push:
    branches: [main]

jobs:
  pa11y:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Run Pa11y
        uses: makepad-fr/pa11y-action@v1
        with:
          url: "https://example.com"
          standard: "WCAG2AA"
          threshold: "0"
          reporter: "json"
          report_file: "pa11y-report.json"

      - name: Upload report
        uses: actions/upload-artifact@v4
        with:
          name: pa11y-report
          path: pa11y-report.json
```

## Inputs

| Name | Required | Default | Description |
|------:|:-----------:|:----------:|:-------------:|
| `url` | ✅ | — | URL to test |
| `standard` | ❌ | WCAG2AA | WCAG level |
| `threshold` | ❌ | 0 | Max allowed issues |
| `wait` | ❌ | 0 | Wait before test (ms) |
| `headers` | ❌ | — | JSON headers |
| `reporter` | ❌ | json | Output format |
| `report_file` | ❌ | pa11y-report.json | Report file path |

## Outputs

- `report_path`: path of the generated report  
- `exit_code`: Pa11y exit code (0 = success)

---

Made with ❤️ by [Makepad](https://github.com/makepad-fr)
