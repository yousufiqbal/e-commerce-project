<script>
  import { goto } from "$app/navigation";
  import { page } from "$app/stores";
  import dayjs from "dayjs";

  const format = 'YYYY-MM-DD'
  const today = dayjs().format(format)

  export let start = $page.url.searchParams.get('start') || dayjs().format('YYYY-07-01')
  export let end = $page.url.searchParams.get('end') || dayjs().format('YYYY-06-30')

  const fire = () => {
    goto($page.url.pathname + '?start=' + start + '&end=' + end)
  }

  const setToday = () => {
    start = dayjs().startOf('day').format(format)
    end = dayjs().endOf('day').format(format)
    goto($page.url.pathname + '?start=' + start + '&end=' + end)
  }

  const setThisWeek = () => {
    start = dayjs().startOf('week').format(format)
    end = dayjs().endOf('week').format(format)
    goto($page.url.pathname + '?start=' + start + '&end=' + end)
  }
  
  const setThisMonth = () => {
    start = dayjs().startOf('month').format(format)
    end = dayjs().endOf('month').format(format)
    goto($page.url.pathname + '?start=' + start + '&end=' + end)
  }
  
  const setPreviousMonth = () => {
    start = dayjs().subtract(1, 'month').startOf('month').format(format)
    end = dayjs().subtract(1, 'month').endOf('month').format(format)
    goto($page.url.pathname + '?start=' + start + '&end=' + end)
  }
</script>

<div class="calendar">
  <input max={today} on:change={fire} type="date" bind:value={start}>
  <input min={start} on:change={fire} type="date" bind:value={end}>
  <button on:click={setToday}>Today</button>
  <button on:click={setThisWeek}>This Week</button>
  <button on:click={setThisMonth}>This Month</button>
  <button on:click={setPreviousMonth}>Previous Month</button>
</div>


<style>
  .calendar {
    /* outline: 1px solid red; */
    display: flex;
    gap: 10px;
    margin-bottom: 20px;
  }
  input {
    /* color: white; */
    border: 1px solid var(--border);
    padding: var(--padding);
  }
  button {
    border: 1px solid var(--border);
    padding: var(--padding);
  }
  button {
    color: blue;
  }
  button:hover {
    color: red;
  }
</style>