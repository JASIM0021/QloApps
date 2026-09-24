/** @type {import('tailwindcss').Config} */
module.exports = {
  prefix: 'tw-',
  corePlugins: {
    preflight: false,
  },
  content: [
    './admin-dev/themes/default/template/**/*.tpl',
    './modules/**/views/templates/**/*.tpl',
    './themes/hotel-reservation-theme/**/*.tpl',
    './js/**/*.js',
  ],
  theme: {
    extend: {
      colors: {
        brand: {
          50: '#eff6ff',
          100: '#dbeafe',
          200: '#bfdbfe',
          300: '#93c5fd',
          400: '#60a5fa',
          500: '#1292ff',
          600: '#0066cc',
          700: '#0369a1',
          800: '#075985',
          900: '#090d16',
          950: '#040711',
        },
      },
      fontFamily: {
        sans: ['-apple-system', 'BlinkMacSystemFont', '"Segoe UI"', 'Roboto', '"Inter"', 'Arial', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
