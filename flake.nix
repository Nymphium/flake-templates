{
  outputs = { self }: {
    templates = {
      ocaml.path = ./templates/ocaml;
      latex.ptah = ./templates/latex;
    };
  };
}
