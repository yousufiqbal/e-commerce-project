<script>
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Nothing from "$lib/components/Nothing.svelte";
  import Table from "$lib/components/Table.svelte";
  import Title from "$lib/components/Title.svelte";

  // Dummy data
  export let backups = [
    { backup_id: 1, filename: 'Fast - Jan 07, 2022 - 23.02', created: 'Jan 07, 2022 - 23.02', size: '0.2MB' },
    { backup_id: 2, filename: 'Fast - Jan 07, 2022 - 23.02', created: 'Jan 07, 2022 - 23.02', size: '0.2MB' },
    { backup_id: 3, filename: 'Fast - Jan 07, 2022 - 23.02', created: 'Jan 07, 2022 - 23.02', size: '0.2MB' },
    { backup_id: 4, filename: 'Fast - Jan 07, 2022 - 23.02', created: 'Jan 07, 2022 - 23.02', size: '0.2MB' },
  ]
</script>

<Title title="Backups" icon="databaseTwo" />

<ButtonGroup>
  <Button icon="add" name="New Backup" href="/backups/add-backup" />
</ButtonGroup>

{#if backups.length != 0}
<Table>
  <tr>
    <th>Sr.</th>
    <th class="main">Filename</th>
    <th>Size</th>
    <th>Created</th>
  </tr>
  {#each backups as backup, index (backup.backup_id)}
  <tr>
    <td>{index + 1}</td>
    <td>{backup.filename}</td>
    <td>{backup.size}</td>
    <td>{backup.created}</td>
  </tr>
  {/each}
</Table>
{:else}
<Nothing>
  No Backups
</Nothing>
{/if}