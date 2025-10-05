/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./layout/**/*.liquid",
    "./sections/**/*.liquid", 
    "./snippets/**/*.liquid",
    "./templates/**/*.json",
    "./assets/**/*.js",
    "./assets/**/*.css"
  ],
  theme: {
    extend: {
      colors: {
        'axolop-orange': '#FF411F',
        'axolop-bg': '#0B0B0C',
        'axolop-panel': '#1E1E22',
        'axolop-muted': '#A7A7AD'
      },
      fontFamily: {
        'sans': ['Inter', 'system-ui', 'sans-serif'],
        'heading': ['Lexend Giga', 'system-ui', 'sans-serif'],
        'mono': ['JetBrains Mono', 'SF Mono', 'Monaco', 'monospace']
      },
      borderRadius: {
        'axolop': '8px'
      }
    },
  },
  plugins: [],
}
