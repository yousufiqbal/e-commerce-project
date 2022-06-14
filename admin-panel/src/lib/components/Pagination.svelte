<script>
  import { page } from "$app/stores";
  import { setQuery } from "$lib/others/utils";
  import Icon from "$lib/components/Icon.svelte";

  export let total = 200, limit = 20
  let totalPages = Math.ceil(+total/+limit)

  $: currentPage = +$page.url.searchParams.get('page') || 1
  $: previousPage = (currentPage - 1) != 0 ? currentPage - 1 : 1
  $: nextPage = currentPage < totalPages ? currentPage + 1 : totalPages
  $: previousDisabled = currentPage == 1
  $: nextDisabled = currentPage == totalPages
</script>

<div class="pagination">
  <div class="status">Page {currentPage} / {totalPages}</div>
  {#if !previousDisabled}
  <a sveltekit:noscroll class:disabled={previousDisabled} href="{setQuery({ 'page': previousPage}, $page)}" class="prev">
    <button>
      <Icon size="1.2rem" icon="arrowLeftS" />
    </button>
    <span>Prev</span>
  </a>
  {/if}
  {#if !nextDisabled}
  <a sveltekit:noscroll class:disabled={nextDisabled} href="{setQuery({ 'page': nextPage}, $page)}" class="next">
    <span>Next</span>
    <button>
      <Icon size="1.2rem" icon="arrowRightS" />
    </button>
  </a>
  {/if}
</div>

<style>
  .pagination {
    /* border: 1px solid red; */
    display: flex;
    gap: 15px;
    justify-content: end;
    /* align-items: center; */
    /* margin-bottom: 20px; */
  }
  a  {
    color: blue;
    display: flex;
    border: 1px solid var(--border);
    border-radius: 5px;
  }
  .status {
    padding: 6px 15px;
    border: 1px solid var(--border);
    border-radius: 5px;
  }
  a span {
    padding: 6px 15px;
  }
  a:not(.disabled):hover {
    color: blue;
    box-shadow: var(--shadow);
  }
  a.disabled {
    cursor: not-allowed;
    opacity: 0.7;
    background-color: rgb(221, 221, 221);
  }
  button {
    padding: 6px 5px;
    display: flex;
  }
  button:first-child {
    border-right: 1px solid var(--border);
  }
  button:last-child {
    border-left: 1px solid var(--border);
  }
  a:hover > button {
    color: red
  }
</style>