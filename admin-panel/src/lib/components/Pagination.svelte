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
  <a class:disabled={previousDisabled} href="{setQuery({ 'page': previousPage}, $page)}" class="prev">
    <Icon size="1.2rem" icon="arrowLeftS" />
    <span>Prev</span>
  </a>
  <div class="status">Page {currentPage} of {totalPages}</div>
  <a class:disabled={nextDisabled} href="{setQuery({ 'page': nextPage}, $page)}" class="next">
    <span>Next</span>
    <Icon size="1.2rem" icon="arrowRightS" />
  </a>
</div>

<style>
  .pagination {
    /* border: 1px solid red; */
    display: flex;
    gap: 25px;
    justify-content: end;
    align-items: center;
    /* margin-bottom: 20px; */
  }
  a {
    display: flex;
    padding: var(--padding);
    border: 1px solid var(--border);
    border-radius: 5px;
    gap: 7px;
    transition: box-shadow 500ms;
  }
  a:not(.disabled):hover {
    color: blue;
    box-shadow: 0 0 5px 0 rgb(123, 123, 123);
  }
  a.disabled {
    cursor: not-allowed;
    opacity: 0.7;
    background-color: rgb(221, 221, 221);
  }
</style>