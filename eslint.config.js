const prettierRecommended = require('eslint-plugin-prettier/recommended');

module.exports = [
  {
    ignores: ['.agents/**', 'db.json', 'node_modules/**', 'public/**', 'themes/**'],
  },
  {
    files: ['**/*.{js,cjs,mjs}'],
    languageOptions: {
      ecmaVersion: 'latest',
      globals: {
        __dirname: 'readonly',
        console: 'readonly',
        module: 'readonly',
        process: 'readonly',
        require: 'readonly',
      },
      sourceType: 'commonjs',
    },
    rules: {
      'no-unused-vars': 'error',
    },
  },
  prettierRecommended,
];
