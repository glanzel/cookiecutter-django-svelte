<script>
  import { onMount } from "svelte";
  import svelteLogo from './assets/svelte.svg'
  import Counter from './lib/Counter.svelte'
  let hellos = []

  let getTodos = async () => {
    await fetch(location.origin+'/api/dj/hello/?format=json')
      .then(r => r.json())
      .then(data => {
        hellos = data;
      });
    }
  onMount(getTodos)

</script>

<main>


  <h2>Django + Wagtail + 
    <a href="https://vitejs.dev" target="_blank" rel="noreferrer"> 
      Vite
    </a>
    + 
    <a href="https://svelte.dev" target="_blank" rel="noreferrer"> 
      Svelte
    </a>
  </h2>
  <div class="card">
    <Counter />
  </div>

  <div>
    <b>Full fledged Example: The following Hello World comes from Django Rest out of the Database:</b>

    {#each hellos as hello}
    <div class="card">
      {hello.content}
    </div>
    {/each}
  </div>

  <p class="read-the-docs">
    Click on the headline to learn more
  </p>
</main>

<style>
  .logo {
    height: 6em;
    padding: 1.5em;
    will-change: filter;
    transition: filter 300ms;
  }
  .logo:hover {
    filter: drop-shadow(0 0 2em #646cffaa);
  }
  .logo.svelte:hover {
    filter: drop-shadow(0 0 2em #ff3e00aa);
  }
  .read-the-docs {
    color: #888;
  }
</style>
