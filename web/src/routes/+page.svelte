<script lang="ts">
	import { onMount } from 'svelte';
	import initSync from '$lib/wasm/normalizer.js';

	const title = 'Normalizer';

	let device: string;

	onMount(() => {
		initSync();
	});
</script>

<svelte:head>
	<title>{title}</title>
</svelte:head>

<h1>{title}</h1>

<canvas id="webgpu-canvas"></canvas>
