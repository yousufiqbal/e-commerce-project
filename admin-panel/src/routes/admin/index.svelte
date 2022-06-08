<script>
import Button from "$lib/components/Button.svelte";
import ButtonGroup from "$lib/components/ButtonGroup.svelte";

import Subtitle from "$lib/components/Subtitle.svelte";

  import Title from "$lib/components/Title.svelte";
</script>

<Title title="Admin" />
<ButtonGroup>
  <Button icon="editBox" name="Edit Profile" />
  <Button icon="editBox" name="Edit Password" />
</ButtonGroup>

<Subtitle subtitle="Misc." />

<div class="links">
  <a href="/admin/constants">Constants</a>
  <a href="/admin/activities">Admin Activities</a>
  <a href="/admin/promo-giveaway">Giveaway Promo</a>
</div>

<style>
  .links {
    display: grid;
    gap: 5px;
  }
  .links a {
    color: blue;
  }
</style>