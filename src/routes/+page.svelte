<script lang="ts">
	import { onMount } from 'svelte';

	const title = 'Normalizer';

	let device: string;
	let error: string;

	onMount(() => {
		gpuInit().catch((err) => (error = err));
	});

	async function gpuInit() {
		const gpu = navigator.gpu;

		if (!gpu) {
			throw new Error('WebGPU not supported');
		}

		const adapter = await gpu.requestAdapter();

		if (!adapter) {
			throw new Error("Couldn't request WebGPU adapter");
		}

		device = await adapter.requestDevice();

		if (!device) {
			throw new Error("Couldn't request WebGPU device");
		}
	}
</script>

<h1>{title}</h1>

{#if error}
	{error}
{:else}
	{device}
{/if}
