const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      lineClamp: {
        10: '10',
        14: '14',
        16: '16',
        20: '10',
      },
      height:{
        168: '42rem'
      },
      maxHeight:{
        168: '42rem'
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('tailwindcss/colors'),
    require('@tailwindcss/line-clamp'),
  ]
}
