<script lang="ts">
	import { onMount } from 'svelte';

	const title = 'Normalizer';

	let device: string;
	let error: string;

	onMount(() => {
		gpuInit();
	});

	async function gpuInit() {
		if (!navigator.gpu) {
			error = 'WebGPU not supported';
			return;
		}

		const adapter = await navigator.gpu.requestAdapter();

		if (!adapter) {
			error = "Couldn't request WebGPU adapter";
			return;
		}

		device = await adapter.requestDevice();

		if (!device) {
			error = "Couldn't request WebGPU device";
			return;
		}
	}
</script>

<h1>{title}</h1>

{#if error}
	<p>Error: {error}</p>
{:else}
	{device}
{/if}
