<script>
  import Breadcrumb from "$lib/components/Breadcrumb.svelte";
import Message from "$lib/components/Message.svelte";
import SmallButton from "$lib/components/SmallButton.svelte";
import SmallButtonGroup from "$lib/components/SmallButtonGroup.svelte";
import Subtitle from "$lib/components/Subtitle.svelte";
import Text from "$lib/components/Text.svelte";
  import Title from "$lib/components/Title.svelte";

  const crumbs = [
    { name: 'Account', href: '/account' },
    { name: 'Customer Support', href: '/account/customer-support' },
  ]
</script>

<Breadcrumb {crumbs} />

<Title back title="Customer Support" />

<Message pinned>
  Our customer support representatives are available <strong>9AM to 6PM</strong> everyday (except Sunday and prayer timings).
</Message>

<div class="supports">

  <div class="card">
    <Subtitle subtitle="WhatsApp" icon="whatsapp" />
  
    <Text>
      You can chat with us on WhatsApp No. <strong>0333-3535658</strong> regarding your queries
    </Text>

    <Text>
      <i>
        Please do not call. We only support chat on WhatsApp.
      </i>
    </Text>
    
    <SmallButtonGroup>
      <SmallButton icon="messageThree" name="Chat Now" />
    </SmallButtonGroup>
  </div>
  
  <div class="card">
    <Subtitle subtitle="Email" icon="mail" />
    
    <Text>
      You can email us on <strong>support@fast.com</strong> regarding your queries.
    </Text>
    
    <SmallButtonGroup>
      <SmallButton icon="mailSend" name="Email Now" />
    </SmallButtonGroup>
  </div>
  
  <div class="card">
    <Subtitle subtitle="Phone" icon="cellphone" />
  
    <Text>
      You can also call us on <strong>021-34546549</strong> regarding your queries.
    </Text>
    
    <SmallButtonGroup>
      <SmallButton icon="phone" name="Call Now" />
    </SmallButtonGroup>
  </div>
  
</div>

<div class="mb40"></div>

<style>
  i {
    font-style: italic;
  }
  strong {
    white-space: nowrap;
    font-weight: bold;
  }
  .supports {
    display: grid;
    gap: 20px;
  }
</style>