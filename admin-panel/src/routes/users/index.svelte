<script>
  import Button from "$lib/components/Button.svelte";
  import ButtonGroup from "$lib/components/ButtonGroup.svelte";
  import Table from "$lib/components/Table.svelte";
  import Title from "$lib/components/Title.svelte";
import { beautifyDateTime } from "$lib/others/utils";

  export let users = [
    { user_id: 1, name: 'Farhan Meva', city: 'Karachi', address: 'C26, Block-14 Gulistan-e-Jauhar' },
    { user_id: 2, name: 'Farhan Meva', city: 'Karachi', address: 'C26, Block-14 Gulistan-e-Jauhar' },
    { user_id: 3, name: 'Farhan Meva', city: 'Karachi', address: 'C26, Block-14 Gulistan-e-Jauhar' },
    { user_id: 4, name: 'Farhan Meva', city: 'Karachi', address: 'C26, Block-14 Gulistan-e-Jauhar' },
  ]
</script>

<Title title="Users" icon="userThree" />

<ButtonGroup>
  <Button icon="add" name="New User" />
  <Button shortcut="ctrl+k" icon="searchTwo" name="Search Users" href="/users/search" />
</ButtonGroup>

<Table>
  <tr>
    <th>Sr.</th>
    <th>ID</th>
    <th class="main">Name</th>
    <th>Email</th>
    <th class="main">Joined</th>
  </tr>
  {#each users as user, index (user.user_id)}
  <tr>
    <td>{index+1}</td>
    <td>{user.user_id}</td>
    <td><a href="/users/{user.user_id}">{user.name}</a></td>
    <td>{user.email}</td>
    <td>{beautifyDateTime(user.created)}</td>
  </tr>
  {/each}
</Table>