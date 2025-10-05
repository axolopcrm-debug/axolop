import { defineConfig } from 'vite'
import { resolve } from 'path'

export default defineConfig({
  build: {
    outDir: 'assets',
    rollupOptions: {
      input: {
        main: resolve(__dirname, 'src/main.js'),
        analyzer: resolve(__dirname, 'src/analyzer.js')
      },
      output: {
        entryFileNames: '[name].js',
        chunkFileNames: '[name].js',
        assetFileNames: '[name].[ext]'
      }
    }
  },
  css: {
    postcss: {
      plugins: [
        require('autoprefixer'),
        require('tailwindcss')
      ]
    }
  }
})
