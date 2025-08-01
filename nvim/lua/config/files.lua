vim.g.projectionist_heuristics = {
  ["Gemfile"] = {
    ["lib/*.rb"] = {
      type = "source",
      alternate = "spec/lib/{dirname}/{basename}_spec.rb",
    },
    ["spec/*_spec.rb"] = {
      type = "test",
      alternate = "{dirname}/{basename}.rb",
    },
  },
  ["pyproject.toml"] = {
    ["src/appsignal/*.py"] = {
      type = "source",
      alternate = "tests/{dirname}/test_{basename}.py",
    },
    ["src/*.py"] = {
      type = "source",
      alternate = "tests/{dirname}/test_{basename}.py",
    },
    ["tests/test_*.py"] = {
      type = "test",
      alternate = {
        "src/{dirname}/{basename}.py",
        "src/appsignal/{dirname}/{basename}.py",
      },
    },
  },
  ["mix.exs"] = {
    ["lib/*.ex"] = {
      type = "source",
      alternate = {
        "test/lib/{dirname}/{basename}_test.exs",
        "test/{dirname}/{basename}_test.exs",
      },
    },
    ["test/*_test.exs"] = {
      type = "test",
      alternate = {
        "lib/{dirname}/{basename}.ex",
        "{dirname}/{basename}.ex",
      },
    },
  },
  ["tsconfig.json"] = {
    ["*.ts"] = {
      type = "source",
      alternate = {
        "{dirname}/{basename}.test.ts",
        "{dirname}/__tests__/{basename}.test.ts",
      },
    },
    ["**/__tests__/*.test.ts"] = {
      type = "test",
      alternate = "{dirname}/{basename}.ts",
    },
    ["*.test.ts"] = {
      type = "test",
      alternate = "{dirname}/{basename}.ts",
    },
  },
  ["packages/*/package.json"] = {
    ["packages/**/__tests__/*.test.js"] = {
      type = "test",
      alternate = "packages/{dirname}/{basename}.js",
    },
    ["*.js"] = {
      type = "source",
      alternate = "{dirname}/__tests__/{basename}.test.js",
    },
  },
  ["app/frontend/javascripts/"] = {
    ["app/frontend/javascripts/*.js"] = {
      type = "source",
      alternate = "app/frontend/javascripts/{dirname}/{basename}.test.js",
    },
    ["app/frontend/javascripts/*.test.js"] = {
      type = "test",
      alternate = "app/frontend/javascripts/{dirname}/{basename}.js",
    },
    ["app/frontend/javascripts/*.jsx"] = {
      type = "source",
      alternate = "app/frontend/javascripts/{dirname}/{basename}.test.jsx",
    },
    ["app/frontend/javascripts/*.test.jsx"] = {
      type = "test",
      alternate = "app/frontend/javascripts/{dirname}/{basename}.jsx",
    },
  },
}
