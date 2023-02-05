import { defineConfig } from 'vite'
import { svelte } from '@sveltejs/vite-plugin-svelte'
//const { resolve } = require('path')
import { resolve } from 'path'

console.log(resolve(__dirname, 'index.html'))

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [svelte()],
  //inlineDynamicImports: true,
  build:{
    outDir: "../djjs/generated/",
    emptyOutDir: true,
    rollupOptions:{
      
      input: {
        main: resolve(__dirname, '/templates/helloworld_assets.html'),
      },
      output: {
				manualChunks: false,
				inlineDynamicImports: false,
        //format: 'iife',
        chunkFileNames: "static/js/[name]-[hash].js", 
        entryFileNames: "static/js/[name]-[hash].js",
        assetFileNames: (assetInfo) => { 
          var info = assetInfo.name.split("."); 
          var extType = info[info.length - 1]; 
          if (/png|jpe?g|svg|gif|tiff|bmp|ico/i.test(extType)) { 
            extType = "img"; 
          } else if (/woff|woff2/.test(extType)) { 
            extType = "css"; 
          } 
          return   "static/" + extType +"/[name]-[hash][extname]"; 
        }       
      },
    }
  },
  server: {
    proxy: {
        '/api': 'http://localhost:8000/',
    },
  },
})
