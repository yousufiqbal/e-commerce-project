import adapter from '@sveltejs/adapter-auto';
import {visualizer} from 'rollup-plugin-visualizer';
import sveltePreprocess from 'svelte-preprocess'

/** @type {import('@sveltejs/kit').Config} */
const config = {
  preprocess: [sveltePreprocess()],
	kit: {
		adapter: adapter(),
    vite: {
      plugins: [visualizer()]
    }
	}
};

export default config;
