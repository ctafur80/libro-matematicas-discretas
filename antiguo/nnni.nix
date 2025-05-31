

{ pkgs ? import <nixpkgs> {} }:

let
    project_name = "asignatura Lenguaje Matemático. Conjuntos y Números en el grado de Matemáticas en la UNED";
    message = "Entorno para ${project_name}.";
in
    pkgs.mkShell {
        packages = with pkgs; [

            (texliveBasic.withPackages (ps: with ps; [
                babel
                babel-spanish
                babel-latin
                babel-french
                babel-german

                enumitem

                # pgfplots

                graphics # The graphics bundle
                fontspec
                xcolor
                hyperref

                pgf # Includes TikZ
                # siunitx

                # luatextra
                # unicode-math
                # lualatex-math
                # luatexbase

                # biblatex

                etoolbox
            ]))
        ];

        buildInputs = with pkgs; [
            texlab
            gnumake

            git
            gh

            bash-completion
            gawk
            gnugrep
            starship
        ];

        shellHook = ''
            eval "$(starship init bash)"
            echo ; echo ${message}
            alias ls="ls --color"
        '';
    }







