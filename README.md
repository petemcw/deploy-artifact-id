# Deployment Artifact ID

[![GitHub Release](https://img.shields.io/github/release/petemcw/deploy-artifact-id.svg?logo=github&style=for-the-badge)](https://github.com/petemcw/deploy-artifact-id/releases/latest)
[![GitHub Marketplace](https://img.shields.io/badge/marketplace-petemcw--deploy--artifact--id-blue?logo=github&style=for-the-badge)](https://github.com/marketplace/actions/deployment-artifact-id)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)

A GitHub Action to create a JSON file used for documenting the workflow run data for a deployed artifact.

## ⬇️ Inputs

|        Input        |                             Description                                        |         Default             |
|:---------------------|:---------------------------------------------------------------------------------|:----------------------------|
| `filename`          | The name of the artifact ID file, not including a file extension.              | `VERSION`                   |
| `git-sha`           | The commit SHA that triggered the workflow.                                    | `${{ github.sha }}`         |
| `run-id`            | A unique number for each workflow run within a repository.                     | `${{ github.run_id }}`      |
| `run-number`        | A unique number for each run of a particular workflow in a repository.         | `${{ github.run_number }}`  |
| `run-attempt`       | A unique number for each attempt of a particular workflow run in a repository. | `${{ github.run_attempt }}` |
| `working-directory` | The directory where the artifact file will be located.                         | `${{ github.workspace }}`   |

**Note:** All inputs are optional, and will default to the values shown in the table above.

## ⚙️ Usage

The following is a simple example of using this action during a deployment workflow.

```yaml
# File: .github/workflows/workflow.yml
name: "Production deployment"

on:
  push:
    tags:
      - "v[0-9]+.[0-9]+.[0-9]+.[0-9]+"

env:
  WORKING_DIR: "${{ github.workspace }}/src"

jobs:
  deploy-project-artifact:
    runs-on: ubuntu-latest
    steps:
      - name: "Check out repository code"
        uses: "actions/checkout@v3"

      - name: "Magento 2: create artifact ID file"
        uses: "petemcw/deploy-artifact-id@v1"
        with:
          filename: "VERSION"
          working-directory: "${{ env.WORKING_DIR }}/pub"
```

## 📝 License

The scripts and documentation in this project are released under the [MIT License](LICENSE).
