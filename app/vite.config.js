import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vite.dev/config/
export default defineConfig({
  plugins: [vue()],
  server: {
    host: '0.0.0.0', // Allow external access inside Docker
    port: 5173, // Vite's default port
  },
  build: {
    outDir: 'dist', // Nginx will serve this folder
  }
});
