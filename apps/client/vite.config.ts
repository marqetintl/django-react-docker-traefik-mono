import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';
import tsconfigPaths from 'vite-tsconfig-paths';
import { viteStaticCopy } from 'vite-plugin-static-copy';

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    react(),
    // viteStaticCopy({
    //   targets: [
    //     {
    //       src: './public/**/*',
    //       dest: './static',
    //       // dest: "../backend/templates/client/static",
    //     },
    //   ],
    // }),
    tsconfigPaths(),
  ],
  resolve: {
    dedupe: ['react', 'react-dom', 'react-router-dom', 'unocss'],
  },
  publicDir: '../backend/static',
  build: {
    emptyOutDir: true,
    outDir: '../backend/templates/client',
    assetsDir: 'static',
    copyPublicDir: false,
    rollupOptions: {
      output: {
        minifyInternalExports: true,
      },
    },
  },
});
