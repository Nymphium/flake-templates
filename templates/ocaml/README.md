OCaml template with GitHub Actions
===

The template provides `ocamllsp`, `utop` and `ocamlformat` by default.
The dependencies of the project should be written in a opam file.

# Upload to opam automatically
The action creates a PR to opam-repository using `dune-release`.
See [release.yml](./.github/workflows/release.yml).

## Prerequirements
1. Rewrite environment variables in [release.yml](./.github/workflows/release.yml)
2. Set workflow permission
    
    GitHub repo -> Workflow permissions -> Check "Read and write permissions"
3. Create GitHub token
    
    It is needed to push opam-repository of your GitHub account more than the permission of `secrets.GITHUB_TOKEN`.
4. Set the token to the environment variable
    
    [release.yml](./.github//workflows/release.yml) requires `secrets.GH_TOKEN` by default.
5. Create `CHANGELOG` file or add `changelog` field in a opam file
